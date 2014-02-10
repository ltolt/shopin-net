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

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.util.Enumeration;
import java.util.Locale;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletInputStream;
import javax.servlet.ServletRequest;


/* ------------------------------------------------------------ */
/**
 *  javax.servlet.ServletRequest的一个简易实现
 */
public class Request implements ServletRequest
{
    
    //-----------------fields
    private String uri;
    private InputStream input;
    
    //----------------constructor
    public Request(InputStream input)
    {
        this.input = input;
    }

    //-----------methods
    public String getUri()
    {
        return uri;
    }
    
    public void parse(){
        //read a set of characters from the socket
        StringBuffer request = new StringBuffer(2048);
        int i;
        byte[] buffer = new byte[2048];
     
        try
        {
            i = input.read(buffer);
        }
        catch (IOException e)
        {
            e.printStackTrace();
            i = -1;
        }
        for(int j = 0;j < i;j++){
            request.append((char)buffer[j]);
        }
        System.out.println(request.toString());
        uri = parseUri(request.toString());
    }
    
    private String parseUri(String requestString){
        int index1,index2;
        index1 = requestString.indexOf(' ');
        if(index1 != -1){
            index2 = requestString.indexOf(' ', index1 + 1);
            if(index2 > index1){
                return requestString.substring(index1 + 1,index2);
            }
        }
        return null;
    }




    /* ----implementation of servletRequest-------------------------------------------------------- */
    /**
     * @see javax.servlet.ServletRequest#getAttribute(java.lang.String)
     */
    @Override
    public Object getAttribute(String arg0)
    {
        // TODO Auto-generated method stub
        return null;
    }

    /* ------------------------------------------------------------ */
    /**
     * @see javax.servlet.ServletRequest#getAttributeNames()
     */
    @Override
    public Enumeration getAttributeNames()
    {
        // TODO Auto-generated method stub
        return null;
    }

    /* ------------------------------------------------------------ */
    /**
     * @see javax.servlet.ServletRequest#getCharacterEncoding()
     */
    @Override
    public String getCharacterEncoding()
    {
        // TODO Auto-generated method stub
        return null;
    }

    /* ------------------------------------------------------------ */
    /**
     * @see javax.servlet.ServletRequest#getContentLength()
     */
    @Override
    public int getContentLength()
    {
        // TODO Auto-generated method stub
        return 0;
    }

    /* ------------------------------------------------------------ */
    /**
     * @see javax.servlet.ServletRequest#getContentType()
     */
    @Override
    public String getContentType()
    {
        // TODO Auto-generated method stub
        return null;
    }

    /* ------------------------------------------------------------ */
    /**
     * @see javax.servlet.ServletRequest#getInputStream()
     */
    @Override
    public ServletInputStream getInputStream() throws IOException
    {
        // TODO Auto-generated method stub
        return null;
    }

    /* ------------------------------------------------------------ */
    /**
     * @see javax.servlet.ServletRequest#getLocale()
     */
    @Override
    public Locale getLocale()
    {
        // TODO Auto-generated method stub
        return null;
    }

    /* ------------------------------------------------------------ */
    /**
     * @see javax.servlet.ServletRequest#getLocales()
     */
    @Override
    public Enumeration getLocales()
    {
        // TODO Auto-generated method stub
        return null;
    }

    /* ------------------------------------------------------------ */
    /**
     * @see javax.servlet.ServletRequest#getParameter(java.lang.String)
     */
    @Override
    public String getParameter(String arg0)
    {
        // TODO Auto-generated method stub
        return null;
    }

    /* ------------------------------------------------------------ */
    /**
     * @see javax.servlet.ServletRequest#getParameterMap()
     */
    @Override
    public Map getParameterMap()
    {
        // TODO Auto-generated method stub
        return null;
    }

    /* ------------------------------------------------------------ */
    /**
     * @see javax.servlet.ServletRequest#getParameterNames()
     */
    @Override
    public Enumeration getParameterNames()
    {
        // TODO Auto-generated method stub
        return null;
    }

    /* ------------------------------------------------------------ */
    /**
     * @see javax.servlet.ServletRequest#getParameterValues(java.lang.String)
     */
    @Override
    public String[] getParameterValues(String arg0)
    {
        // TODO Auto-generated method stub
        return null;
    }

    /* ------------------------------------------------------------ */
    /**
     * @see javax.servlet.ServletRequest#getProtocol()
     */
    @Override
    public String getProtocol()
    {
        // TODO Auto-generated method stub
        return null;
    }

    /* ------------------------------------------------------------ */
    /**
     * @see javax.servlet.ServletRequest#getReader()
     */
    @Override
    public BufferedReader getReader() throws IOException
    {
        // TODO Auto-generated method stub
        return null;
    }

    /* ------------------------------------------------------------ */
    /**
     * @see javax.servlet.ServletRequest#getRealPath(java.lang.String)
     */
    @Override
    public String getRealPath(String arg0)
    {
        // TODO Auto-generated method stub
        return null;
    }

    /* ------------------------------------------------------------ */
    /**
     * @see javax.servlet.ServletRequest#getRemoteAddr()
     */
    @Override
    public String getRemoteAddr()
    {
        // TODO Auto-generated method stub
        return null;
    }

    /* ------------------------------------------------------------ */
    /**
     * @see javax.servlet.ServletRequest#getRemoteHost()
     */
    @Override
    public String getRemoteHost()
    {
        // TODO Auto-generated method stub
        return null;
    }

    /* ------------------------------------------------------------ */
    /**
     * @see javax.servlet.ServletRequest#getRequestDispatcher(java.lang.String)
     */
    @Override
    public RequestDispatcher getRequestDispatcher(String arg0)
    {
        // TODO Auto-generated method stub
        return null;
    }

    /* ------------------------------------------------------------ */
    /**
     * @see javax.servlet.ServletRequest#getScheme()
     */
    @Override
    public String getScheme()
    {
        // TODO Auto-generated method stub
        return null;
    }

    /* ------------------------------------------------------------ */
    /**
     * @see javax.servlet.ServletRequest#getServerName()
     */
    @Override
    public String getServerName()
    {
        // TODO Auto-generated method stub
        return null;
    }

    /* ------------------------------------------------------------ */
    /**
     * @see javax.servlet.ServletRequest#getServerPort()
     */
    @Override
    public int getServerPort()
    {
        // TODO Auto-generated method stub
        return 0;
    }

    /* ------------------------------------------------------------ */
    /**
     * @see javax.servlet.ServletRequest#isSecure()
     */
    @Override
    public boolean isSecure()
    {
        // TODO Auto-generated method stub
        return false;
    }

    /* ------------------------------------------------------------ */
    /**
     * @see javax.servlet.ServletRequest#removeAttribute(java.lang.String)
     */
    @Override
    public void removeAttribute(String arg0)
    {
        // TODO Auto-generated method stub

    }

    /* ------------------------------------------------------------ */
    /**
     * @see javax.servlet.ServletRequest#setAttribute(java.lang.String, java.lang.Object)
     */
    @Override
    public void setAttribute(String arg0, Object arg1)
    {
        // TODO Auto-generated method stub

    }

    /* ------------------------------------------------------------ */
    /**
     * @see javax.servlet.ServletRequest#setCharacterEncoding(java.lang.String)
     */
    @Override
    public void setCharacterEncoding(String arg0) throws UnsupportedEncodingException
    {
        // TODO Auto-generated method stub

    }

}
