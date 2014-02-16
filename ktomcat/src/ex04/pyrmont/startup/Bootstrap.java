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


package ex04.pyrmont.startup;

import org.apache.catalina.connector.http.HttpConnector;

import ex04.pyrmont.core.SimpleContainer;


/* ------------------------------------------------------------ */
/**
 * 使用默认连接器--启动类
 */
@SuppressWarnings("deprecation")
public final class Bootstrap
{

    /* ------------------------------------------------------------ */
    /**
     * @param args
     */
    public static void main(String[] args)
    {
        HttpConnector connector = new HttpConnector();
        SimpleContainer container = new SimpleContainer();
        connector.setContainer(container);
        
        try
        {
            connector.initialize();
            connector.start();
            
            // make the application wait until we press any key.
            System.in.read();
        }
        catch (Exception e)
        {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }

}
