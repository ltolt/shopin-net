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

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.Locale;

import javax.servlet.ServletOutputStream;
import javax.servlet.ServletResponse;


/* ------------------------------------------------------------ */
/**
 * javax.servlet.ServletResponse的一个实现
 */
public class Response implements ServletResponse
{
    //------------fields
    private static final int BUFFER_SIZE = 1024;
    Request request;
    OutputStream output;
    PrintWriter writer;
    
    //-----------constructor
    public Response(OutputStream output)
    {
        this.output = output;
    }

    
    
    public void setRequest(Request request)
    {
        this.request = request;
    }

    /*
     * ---this method is used to server static pages--------------------------------------------------------- */
    /**
     * @throws IOException
     */
    public void sendStaticResource()throws IOException{
        byte[] bytes = new byte[BUFFER_SIZE];
        FileInputStream fis= null;
        try
        {
            File file = new File(Constants.WEB_ROOT,request.getUri());
            if(file.exists()){
                fis = new FileInputStream(file);
                int ch = fis.read(bytes,0,BUFFER_SIZE);
                while(ch != -1){
                    output.write(bytes,0,ch);
                    ch = fis.read(bytes,0,BUFFER_SIZE);
                }
            }else{
                //file not found
                String errorMessage = "HTTP/1.1 404 File Not Found\r\n" +
                        "Content-Type: text/html\r\n" + 
                        "Content-Length: 23\r\n" + 
                        "\r\n" + 
                        "<h1>File Not Found</h1>";
                     
                
            }
        }
        catch (Exception e)
        {
            System.out.println(e.toString());
        }
        finally{
            if(fis != null)
                fis.close();
        }

        
    }

    /* ------------------------------------------------------------ */
    /**
     * @see javax.servlet.ServletResponse#flushBuffer()
     */
    @Override
    public void flushBuffer() throws IOException
    {
        // TODO Auto-generated method stub

    }

    /* ------------------------------------------------------------ */
    /**
     * @see javax.servlet.ServletResponse#getBufferSize()
     */
    @Override
    public int getBufferSize()
    {
        // TODO Auto-generated method stub
        return 0;
    }

    /* ------------------------------------------------------------ */
    /**
     * @see javax.servlet.ServletResponse#getCharacterEncoding()
     */
    @Override
    public String getCharacterEncoding()
    {
        // TODO Auto-generated method stub
        return null;
    }

    /* ------------------------------------------------------------ */
    /**
     * @see javax.servlet.ServletResponse#getLocale()
     */
    @Override
    public Locale getLocale()
    {
        // TODO Auto-generated method stub
        return null;
    }

    /* ------------------------------------------------------------ */
    /**
     * @see javax.servlet.ServletResponse#getOutputStream()
     */
    @Override
    public ServletOutputStream getOutputStream() throws IOException
    {
        // TODO Auto-generated method stub
        return null;
    }

    /* ------------------------------------------------------------ */
    /**
     * @see javax.servlet.ServletResponse#getWriter()
     */
    @Override
    public PrintWriter getWriter() throws IOException
    {
        //autoflush is true println() will flush
        //but print() will not
        writer = new PrintWriter(output,true);
        return writer;
    }

    /* ------------------------------------------------------------ */
    /**
     * @see javax.servlet.ServletResponse#isCommitted()
     */
    @Override
    public boolean isCommitted()
    {
        // TODO Auto-generated method stub
        return false;
    }

    /* ------------------------------------------------------------ */
    /**
     * @see javax.servlet.ServletResponse#reset()
     */
    @Override
    public void reset()
    {
        // TODO Auto-generated method stub

    }

    /* ------------------------------------------------------------ */
    /**
     * @see javax.servlet.ServletResponse#resetBuffer()
     */
    @Override
    public void resetBuffer()
    {
        // TODO Auto-generated method stub

    }

    /* ------------------------------------------------------------ */
    /**
     * @see javax.servlet.ServletResponse#setBufferSize(int)
     */
    @Override
    public void setBufferSize(int arg0)
    {
        // TODO Auto-generated method stub

    }

    /* ------------------------------------------------------------ */
    /**
     * @see javax.servlet.ServletResponse#setContentLength(int)
     */
    @Override
    public void setContentLength(int arg0)
    {
        // TODO Auto-generated method stub

    }

    /* ------------------------------------------------------------ */
    /**
     * @see javax.servlet.ServletResponse#setContentType(java.lang.String)
     */
    @Override
    public void setContentType(String arg0)
    {
        // TODO Auto-generated method stub

    }

    /* ------------------------------------------------------------ */
    /**
     * @see javax.servlet.ServletResponse#setLocale(java.util.Locale)
     */
    @Override
    public void setLocale(Locale arg0)
    {
        // TODO Auto-generated method stub

    }

}
