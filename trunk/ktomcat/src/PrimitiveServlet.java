import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.Servlet;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

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

/* ------------------------------------------------------------ */
/**
 */
public class PrimitiveServlet implements Servlet
{

    /* ------------------------------------------------------------ */
    /**
     * @see javax.servlet.Servlet#destroy()
     */
    @Override
    public void destroy()
    {
        System.out.println("destroy");
    }

    /* ------------------------------------------------------------ */
    /**
     * @see javax.servlet.Servlet#getServletConfig()
     */
    @Override
    public ServletConfig getServletConfig()
    {
        // TODO Auto-generated method stub
        return null;
    }

    /* ------------------------------------------------------------ */
    /**
     * @see javax.servlet.Servlet#getServletInfo()
     */
    @Override
    public String getServletInfo()
    {
        // TODO Auto-generated method stub
        return null;
    }

    /* ------------------------------------------------------------ */
    /**
     * @see javax.servlet.Servlet#init(javax.servlet.ServletConfig)
     */
    @Override
    public void init(ServletConfig arg0) throws ServletException
    {
        System.out.println("init");
    }

    /* ------------------------------------------------------------ */
    /**
     * @see javax.servlet.Servlet#service(javax.servlet.ServletRequest, javax.servlet.ServletResponse)
     */
    @Override
    public void service(ServletRequest request, ServletResponse response) throws ServletException, IOException
    {
        System.out.println("from service");
        PrintWriter out = response.getWriter();
        out.println("Hello. Roses are red.");
        out.print("Violets are blue.");
    }

}
