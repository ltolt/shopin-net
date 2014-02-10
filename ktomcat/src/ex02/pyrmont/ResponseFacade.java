// ========================================================================
// Copyright (c) 2009-2009 Mort Bay Consulting Pty. Ltd.
// ------------------------------------------------------------------------
// All rights reserved. This program and the accompanying materials
// are made available under the terms of the Eclipse Public License v1.0
// and Apache License v2.0 which accompanies this distribution.
// The Eclipse Public License is available at 
// http://www.eclipse.org/legal/epl-v10.html
// The Apache License v2.0 is available at
// http://www.opensource.org/licenses/apache2.0.php
// You may elect to redistribute this code under either of these licenses. 
// ========================================================================


package ex02.pyrmont;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Locale;

import javax.servlet.ServletOutputStream;
import javax.servlet.ServletResponse;


/* ------------------------------------------------------------ */
/**
 */
public class ResponseFacade implements ServletResponse
{
    private ServletResponse response;
    
    public ResponseFacade(Response response)
    {
        this.response = response;
    }
    

    public void flushBuffer() throws IOException {
      response.flushBuffer();
    }

    public int getBufferSize() {
      return response.getBufferSize();
    }

    public String getCharacterEncoding() {
      return response.getCharacterEncoding();
    }

    public Locale getLocale() {
      return response.getLocale();
    }

    public ServletOutputStream getOutputStream() throws IOException {
      return response.getOutputStream();
    }

    public PrintWriter getWriter() throws IOException {
      return response.getWriter();
    }

    public boolean isCommitted() {
      return response.isCommitted();
    }

    public void reset() {
      response.reset();
    }

    public void resetBuffer() {
      response.resetBuffer();
    }

    public void setBufferSize(int size) {
      response.setBufferSize(size);
    }

    public void setContentLength(int length) {
      response.setContentLength(length);
    }

    public void setContentType(String type) {
      response.setContentType(type);
    }

    public void setLocale(Locale locale) {
      response.setLocale(locale);
    }

    

}
