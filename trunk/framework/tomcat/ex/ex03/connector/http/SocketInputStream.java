/**
 * @Probject Name: framework
 * @Path: ex.ex03.connector.http.SocketInputStream.java
 * @Create By kimi
 * @Create In 2013年9月9日 上午12:26:10
 * TODO
 */
package ex.ex03.connector.http;

import java.io.IOException;
import java.io.InputStream;

import org.apache.catalina.util.StringManager;

/**
 *  Extends InputStream to be more efficient reading lines during HTTP
 * header processing.
 * @Class Name SocketInputStream
 * @Author kimi
 * @Create In 2013年9月9日
 */
public class SocketInputStream extends InputStream {
	// -------------------------------------------------------------- Constants
	/**
	 * CR
	 */
	private static final byte CR = (byte)'\r';
	/**
	 *  LF
	 */
	private static final byte LF = (byte)'\n';
	/**
	 * SP
	 */
	private static final byte SP = (byte)' ';
	/**
	 * HT
	 */
	private static final byte HT = (byte)'\t';
	/**
	 * COLON
	 */
	private static final byte COLON = (byte)':';

	/**
	 * Lower case offset
	 */
	private static final int LC_OFFSET = 'A' - 'a';
	
	/**
	 * Internal buffer
	 */
	protected byte buf[];
	/**
	 * Last valid byte
	 */
	protected int count;
	/**
	 * Position in the buffer
	 */
	protected int pos;
	
	/**
	 * underlying input stream
	 */
	protected InputStream is;
	
	// ----------------------------------------------------------- Constructors
	
	/**
	 * Construct a servlet input stream associated with the specified socket
     * input.
	 * @param is
	 * @param bufferSize
	 */
	public SocketInputStream(InputStream is,int bufferSize) {
		this.is = is;
		buf = new byte[bufferSize];
	}
	
	 // -------------------------------------------------------------- Variables
	/**
	 * the string manager for this package
	 */
	protected static StringManager sm = 
			StringManager.getManager("");
	 // ----------------------------------------------------- Instance Variables
	
	
	 // --------------------------------------------------------- Public Methods
	
	
	
	/* (non-Javadoc)
	 * @see java.io.InputStream#read()
	 */
	@Override
	public int read() throws IOException {
		// TODO Auto-generated method stub
		return 0;
	}

	

}
