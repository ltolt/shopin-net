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
import java.io.IOException;
import java.net.URL;
import java.net.URLClassLoader;
import java.net.URLStreamHandler;

import javax.servlet.Servlet;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;


/* ------------------------------------------------------------ */
/**
 *  servlet请求处理器
 */
public class ServletProcessor1
{
    
    public void process(Request request, Response response) {

        String uri = request.getUri();
        String servletName = uri.substring(uri.lastIndexOf("/") + 1);
        URLClassLoader loader = null;

        try {
          // create a URLClassLoader
          URL[] urls = new URL[1];
          URLStreamHandler streamHandler = null;
          File classPath = new File(Constants.WEB_ROOT);
          // the forming of repository is taken from the createClassLoader method in
          // org.apache.catalina.startup.ClassLoaderFactory
          String repository = (new URL("file", null, classPath.getCanonicalPath() + File.separator)).toString() ;
          // the code for forming the URL is taken from the addRepository method in
          // org.apache.catalina.loader.StandardClassLoader class.
          urls[0] = new URL(null, repository, streamHandler);
          loader = new URLClassLoader(urls);
        }
        catch (IOException e) {
          System.out.println(e.toString() );
        }
        Class myClass = null;
        try {
          myClass = loader.loadClass(servletName);
        }
        catch (ClassNotFoundException e) {
          System.out.println(e.toString());
        }

        Servlet servlet = null;

        try {
          servlet = (Servlet) myClass.newInstance();
          servlet.service((ServletRequest) request, (ServletResponse) response);
        }
        catch (Exception e) {
          System.out.println(e.toString());
        }
        catch (Throwable e) {
          System.out.println(e.toString());
        }

      }
    
    

}
