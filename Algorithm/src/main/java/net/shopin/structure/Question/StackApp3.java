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


package net.shopin.structure.Question;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;


/* ------------------------------------------------------------ */
/**
 *  栈的应用--分割符匹配问题
 */
public class StackApp3
{
    /**
     * 获取控制台输入内容
     */
    public static String getString() throws IOException{
        InputStreamReader in = new InputStreamReader(System.in);
        BufferedReader reader = new BufferedReader(in);
        String result = reader.readLine();
        return result;
    }
    
    
    /* ----分割符检查的用户-------------------------------------------------------- */
    /**
     * @param args
     * @throws IOException 
     */
    public static void main(String[] args) throws IOException
    {
        while(true){
            System.out.println("Enter A string :");
            System.out.flush();
            String input = getString();
            BracketChecker check =  new BracketChecker(input);
            check.check();
        }

    }

}
/**
 * 分割符检查------------------------------------------------------------ */
class BracketChecker{
    
    private String input;

    public BracketChecker(String input)
    {
        this.input = input;
    }
    
    public void check(){
        //调用StackApp2中的charstack类
       CharStack stack = new CharStack(input.length());
       for(int i = 0;i < input.length()  ;i ++){
           char ch = input.charAt(i);
           switch (ch)
        {
            case '(':
            case '[':
            case '{':
                stack.push(ch);//如果是左分隔符则压栈
                break;
            case ')':
            case ']':
            case '}':
                if(!stack.isEmpty()){
                    char chx = stack.pop();//如果是右分隔符则弹栈
                    if((ch==')'&&chx!='(')||(ch==']'&&chx!='[')||(ch=='}'&&chx!='{'))
                        System.out.println("Check error at " + i + " " + ch + chx);
                }else{
                    System.out.println("Error " + ch + "at" + i);
                }
                break;
            default:
                break;
        }
           
       }
       if(!stack.isEmpty()){
           System.out.println("Error check ");
       }
       
    }
}
