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


package ex01.pyrmont;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.InetAddress;
import java.net.ServerSocket;
import java.net.Socket;
import java.net.UnknownHostException;


/* ------------------------------------------------------------ */
/**
 * 简易web容器原理
 */
public class HttpServer
{
    
    //-------------------constants
    /** WEB_ROOT is the directory where our HTML and other files reside.
     *  For this package, WEB_ROOT is the "webroot" directory under the working
     *  directory.
     *  The working directory is the location in the file system
     *  from where the java command was invoked.
     */
     public static final String WEB_ROOT = 
             System.getProperty("user.dir") + File.separator + "webroot";
     
     //shutdown command
     private static final String SHUTDOWN_COMMAND = "/SHUTDOWN";
     
     //------------------------fields
     //the shutdown command received
     private boolean shutdown = false;
    
    /* ------------------------------------------------------------ */
    /**
     * @param args
     */
    public static void main(String[] args)
    {
        //test print user.dir
//        System.out.println(System.getProperty("user.dir"));
         HttpServer server = new HttpServer();
         server.await();
    }
    
    public void await(){
        ServerSocket serverSocket = null;
        int port = 8080;
        try
        {
            serverSocket = new ServerSocket(port,1,InetAddress.getByName("127.0.0.1"));
        }
        catch (UnknownHostException e)
        {
            e.printStackTrace();
        }
        catch (IOException e)
        {
            e.printStackTrace();
            System.exit(1);
        }
        //loop waiting for a request
        while(!shutdown){
            Socket socket = null;
            InputStream input = null;
            OutputStream output = null;
            try
            {
                socket = serverSocket.accept();
                input = socket.getInputStream();
                output = socket.getOutputStream();
                
                //create Request object and parse
                Request request = new Request(input);
                request.parse();
                //create response object
                Response response = new Response(output);
                response.setRequest(request);
                response.sendStaticResource();
                //close the socket
                socket.close();
                //check if the previous URI is a shutdown command
                shutdown = request.getUri().equals(SHUTDOWN_COMMAND);
            }
            catch (IOException e)
            {
                e.printStackTrace();
                continue;
            }
            
        }
        
        
        
        
        
        
    }
    

}
