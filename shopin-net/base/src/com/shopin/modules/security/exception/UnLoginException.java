package com.shopin.modules.security.exception;

/**
 * Created by IntelliJ IDEA.
 * User: yanwt
 * Date: 2009-10-15
 * Time: 11:39:23
 */
public class UnLoginException extends RuntimeException {
    public UnLoginException() {
		super();
	}

	public UnLoginException(String s) {
		super(s);
	}

	public UnLoginException(String message, Throwable cause) {
		super(message, cause);
	}

	public UnLoginException(Throwable cause) {
		super(cause);
	}
}
