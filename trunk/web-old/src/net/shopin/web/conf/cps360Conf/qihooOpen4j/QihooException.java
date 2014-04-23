package net.shopin.web.conf.cps360Conf.qihooOpen4j;


/*
 Copyright (c) 2007-2009, Yusuke Yamamoto
 All rights reserved.
 */

/**
 * An exception class that will be thrown when QihooAPI calls are failed.<br>
 * In case the Qihoo server returned HTTP error code, you can get the HTTP
 * status code using getStatusCode() method.
 *
 * @author Yusuke Yamamoto - yusuke at mac.com
 */
public class QihooException extends Exception {
	private static final long serialVersionUID = 2462412334085697802L;
	private int statusCode = -1;

	public QihooException(String msg) {
		super(msg);
	}

	public QihooException(Exception cause) {
		super(cause);
	}

	public QihooException(String msg, int statusCode) {
		super(msg);
		this.statusCode = statusCode;
	}

	public QihooException(String msg, Exception cause) {
		super(msg, cause);
	}

	public QihooException(String msg, Exception cause, int statusCode) {
		super(msg, cause);
		this.statusCode = statusCode;

	}

	public int getStatusCode() {
		return this.statusCode;
	}
}
