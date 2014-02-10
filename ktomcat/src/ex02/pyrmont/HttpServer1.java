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
import java.io.InputStream;
import java.io.OutputStream;
import java.net.InetAddress;
import java.net.ServerSocket;
import java.net.Socket;


/* ------------------------------------------------------------ */
/**
 * 简易servlet容器
 */
public class HttpServer1
{

 // shutdown command
    private static final String SHUTDOWN_COMMAND = "/SHUTDOWN";

    // the shutdown command received
    private boolean shutdown = false;
    
    /* ------------------------------------------------------------ */
    /**
     * @param args
     */
    public static void main(String[] args)
    {
        HttpServer1 server = new HttpServer1();
        server.await();
    }
    
    
    public void await() {
        ServerSocket serverSocket = null;
        int port = 8080;
        try {
          serverSocket =  new ServerSocket(port, 1, InetAddress.getByName("127.0.0.1"));
        }
        catch (IOException e) {
          e.printStackTrace();
          System.exit(1);
        }

        // Loop waiting for a request
        while (!shutdown) {
          Socket socket = null;
          InputStream input = null;
          OutputStream output = null;
          try {
            socket = serverSocket.accept();
            input = socket.getInputStream();
            output = socket.getOutputStream();

            // create Request object and parse
            Request request = new Request(input);
            request.parse();

            // create Response object
            Response response = new Response(output);
            response.setRequest(request);

            // check if this is a request for a servlet or a static resource
            // a request for a servlet begins with "/servlet/"
            if (request.getUri().startsWith("/servlet/")) {
              ServletProcessor1 processor = new ServletProcessor1();
              processor.process(request, response);
            }
            else {
              StaticResourceProcessor processor = new StaticResourceProcessor();
              processor.process(request, response);
            }

            // Close the socket
            socket.close();
            //check if the previous URI is a shutdown command
            shutdown = request.getUri().equals(SHUTDOWN_COMMAND);
          }
          catch (Exception e) {
            e.printStackTrace();
            continue;
          }
        }
      }

}
