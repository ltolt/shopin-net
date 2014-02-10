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
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;

/*
HTTP Response = Status-Line
  *(( general-header | response-header | entity-header ) CRLF)
  CRLF
  [ message-body ]
  Status-Line = HTTP-Version SP Status-Code SP Reason-Phrase CRLF
*/
/* ------------------------------------------------------------ */
/**
 * 简易响应---静态资源的响应
 */
public class Response
{
    //--------constants
    private static final int BUFFER_SIZE = 1024;
    Request request;
    OutputStream output;
    
    //------------constructor
    public Response(OutputStream output)
    {
        this.output = output;
    }

    //---------methods
    public void setRequest(Request request)
    {
        this.request = request;
    }
    
    
    public void sendStaticResource()throws IOException{
        byte[] bytes = new byte[BUFFER_SIZE];
        FileInputStream fis= null;
        try
        {
            File file = new File(HttpServer.WEB_ROOT,request.getUri());
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
    
    
    
    
    
    
    
    
    
    
    
    
    
    

}
