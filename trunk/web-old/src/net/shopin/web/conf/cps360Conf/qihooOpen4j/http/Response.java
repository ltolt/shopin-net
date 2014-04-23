package net.shopin.web.conf.cps360Conf.qihooOpen4j.http;


import java.io.BufferedReader;
import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import java.util.zip.GZIPInputStream;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;

import org.w3c.dom.Document;
import org.xml.sax.SAXException;

import net.shopin.web.conf.cps360Conf.qihooOpen4j.QihooException;
import net.shopin.web.conf.cps360Conf.qihooOpen4j.json.*;

/**
 * A data class representing HTTP Response
 *
 * @author Yusuke Yamamoto - yusuke at mac.com
 */
public class Response {
	private final static boolean DEBUG = true;

	private static ThreadLocal<DocumentBuilder> builders = new ThreadLocal<DocumentBuilder>() {
		@Override
		protected DocumentBuilder initialValue() {
			try {
				return DocumentBuilderFactory.newInstance()
						.newDocumentBuilder();
			} catch (ParserConfigurationException ex) {
				throw new ExceptionInInitializerError(ex);
			}
		}
	};

	private int statusCode;
	private Document responseAsDocument = null;
	private String responseAsString = null;
	private InputStream is;
	private HttpURLConnection con;
	private boolean streamConsumed = false;

	public Response() {

	}

	public Response(HttpURLConnection con) throws IOException {
		this.con = con;
		this.statusCode = con.getResponseCode();
		if (null == (is = con.getErrorStream())) {
			is = con.getInputStream();
		}
		if (null != is && "gzip".equals(con.getContentEncoding())) {
			// the response is gzipped
			is = new GZIPInputStream(is);
		}
	}

	// for test purpose
	/* package */Response(String content) {
		this.responseAsString = content;
	}

	public int getStatusCode() {
		return statusCode;
	}

	public String getResponseHeader(String name) {
		if (con != null)
			return con.getHeaderField(name);
		else
			return null;
	}

	/**
	 * Returns the response stream.<br>
	 * This method cannot be called after calling asString() or asDcoument()<br>
	 * It is suggested to call disconnect() after consuming the stream.
	 *
	 * Disconnects the internal HttpURLConnection silently.
	 *
	 * @return response body stream
	 * @see #disconnect()
	 */
	public InputStream asStream() {
		if (streamConsumed) {
			throw new IllegalStateException("Stream has already been consumed.");
		}
		return is;
	}

	/**
	 * Returns the response body as string.<br>
	 * Disconnects the internal HttpURLConnection silently.
	 *
	 * @return response body
	 */
	public String asString() throws QihooException {
		if (null == responseAsString) {
			BufferedReader br;
			try {
				InputStream stream = asStream();
				if (null == stream) {
					return null;
				}
				br = new BufferedReader(new InputStreamReader(stream, "UTF-8"));
				StringBuffer buf = new StringBuffer();
				String line;
				while (null != (line = br.readLine())) {
					buf.append(line).append("\n");
				}
				this.responseAsString = buf.toString();
				log(responseAsString);
				stream.close();
				con.disconnect();
				streamConsumed = true;
			} catch (NullPointerException npe) {
				// don't remember in which case npe can be thrown
				throw new QihooException(npe.getMessage(), npe);
			} catch (IOException ioe) {
				throw new QihooException(ioe.getMessage(), ioe);
			}
		}
		return responseAsString;
	}

	/**
	 * Returns the response body as org.w3c.dom.Document.<br>
	 * Disconnects the internal HttpURLConnection silently.
	 *
	 * @return response body as org.w3c.dom.Document
	 * @throws QihooException
	 */
	public Document asDocument() throws QihooException {
		if (null == responseAsDocument) {
			try {
				// it should be faster to read the inputstream directly.
				// but makes it difficult to troubleshoot
				this.responseAsDocument = builders.get().parse(
						new ByteArrayInputStream(asString().getBytes("UTF-8")));
			} catch (SAXException saxe) {
				throw new QihooException(
						"The response body was not well-formed:\n"
								+ responseAsString, saxe);
			} catch (IOException ioe) {
				throw new QihooException(
						"There's something with the connection.", ioe);
			}
		}
		return responseAsDocument;
	}

	/**
	 * Returns the response body as JSONObject.<br>
	 * Disconnects the internal HttpURLConnection silently.
	 *
	 * @return response body as JSONObject
	 * @throws QihooException
	 */
	public JSONObject asJSONObject() throws QihooException {
		try {
			return new JSONObject(asString());
		} catch (JSONException jsone) {
			throw new QihooException(jsone.getMessage() + ":"
					+ this.responseAsString, jsone);
		}
	}

	/**
	 * Returns the response body as JSONArray.<br>
	 * Disconnects the internal HttpURLConnection silently.
	 *
	 * @return response body as JSONArray
	 * @throws QihooException
	 */
	public JSONArray asJSONArray() throws QihooException {
		try {
			return new JSONArray(asString());
		} catch (Exception jsone) {
			throw new QihooException(jsone.getMessage() + ":"
					+ this.responseAsString, jsone);
		}
	}

	public InputStreamReader asReader() {
		try {
			return new InputStreamReader(is, "UTF-8");
		} catch (java.io.UnsupportedEncodingException uee) {
			return new InputStreamReader(is);
		}
	}

	public void disconnect() {
		con.disconnect();
	}

	private static Pattern escaped = Pattern.compile("&#([0-9]{3,5});");

	/**
	 * Unescape UTF-8 escaped characters to string.
	 *
	 * @param original
	 *            The string to be unescaped.
	 * @return The unescaped string
	 */
	public static String unescape(String original) {
		Matcher mm = escaped.matcher(original);
		StringBuffer unescaped = new StringBuffer();
		while (mm.find()) {
			mm.appendReplacement(unescaped, Character.toString((char) Integer
					.parseInt(mm.group(1), 10)));
		}
		mm.appendTail(unescaped);
		return unescaped.toString();
	}

	@Override
	public String toString() {
		if (null != responseAsString) {
			return responseAsString;
		}
		return "Response{" + "statusCode=" + statusCode + ", response="
				+ responseAsDocument + ", responseString='" + responseAsString
				+ '\'' + ", is=" + is + ", con=" + con + '}';
	}

	private void log(String message) {
		if (DEBUG) {
			System.out.println("[" + new java.util.Date() + "]" + message);
		}
	}

	private void log(String message, String message2) {
		if (DEBUG) {
			log(message + message2);
		}
	}

	public String getResponseAsString() {
		return responseAsString;
	}

	public void setResponseAsString(String responseAsString) {
		this.responseAsString = responseAsString;
	}

	public void setStatusCode(int statusCode) {
		this.statusCode = statusCode;
	}

}
