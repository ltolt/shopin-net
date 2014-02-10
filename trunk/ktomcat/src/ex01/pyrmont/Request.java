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

import java.io.IOException;
import java.io.InputStream;


/* ------------------------------------------------------------ */
/**
 * 简易请求原理
 */
public class Request
{
    //----------fields
    private String uri;
    private InputStream input;
    //-------constructor
    public Request(InputStream input)
    {
        this.input = input;
    }
    
    //-------methods
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

    public String getUri()
    {
        return uri;
    }
    
    
    
    
    
    
    
    
    
    
    

}
