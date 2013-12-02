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

import java.util.Scanner;

import net.shopin.structure.SequenceStack;


/* ------------------------------------------------------------ */
/**
 * 分隔符的匹配问题:
 *   判断java中的分隔符是否匹配如( 和  ) 
 */
public class StackApp
{
    private final int LEFT = 0;//记录"左分隔符"
    private final int RIGHT = 1;//记录"右分隔符"
    private final int OTHER = 2;//其他字符
    
    
    public int verifyFlag(String str ){
        if("(".equals(str) || "[".equals(str) //左分隔符
                ||"{".equals(str)|| "/*".equals(str))
            return LEFT;
        else if(")".equals(str)||"}".equals(str)||"*/".equals(str)
                ||"]".equals(str))//右分隔符
            return RIGHT;
        else
            return OTHER;
    }

    /**
     * 检查str1和str2是否匹配
     */
    public boolean matches(String str1,String str2){
        if(("(".equals(str1)&&")".equals(str2)) || ("[".equals(str1)&& "]".equals(str2)) 
                || ("{".equals(str1)&&"}".equals(str2)) ||("/*".equals(str1)&&"*/".equals(str2)))
            return true;
        else
            return false;
            
    }
    
    
    public boolean isLegal(String str)throws Exception{
        if(!"".equals(str)&&str != null){
            SequenceStack stack = new SequenceStack(100);
            int length = str.length();
            for(int i = 0;i<length;i++){
                char c = str.charAt(i);
                String t = String.valueOf(c);
                if(1!= length){
                    if(('/'==c&&'*'== str.charAt(i + 1))||('*' == c && '/' == str.charAt(i + 1 ) )){
                        t = t.concat(String.valueOf(str.charAt(i + 1)));
                        ++i;
                    }
                }
                if(LEFT == verifyFlag(t))
                    stack.push(t);//压栈
                else if(RIGHT == verifyFlag(t))
                    if(stack.isEmpty() || !matches(stack.pop().toString(),t))
                        throw new Exception("ERROR");
            }
            if(!stack.isEmpty())
                throw new Exception("ERROR");
            return true;
        }
        return false;
        
        
    }
    
    
    
    
    /* ------------------------------------------------------------ */
    /**
     * @param args
     * @throws Exception 
     */
    public static void main(String[] args) throws Exception
    {
        StackApp app = new StackApp();
        System.out.println("请输入字符:");
        Scanner sc = new Scanner(System.in);
        if(app.isLegal(sc.nextLine())){
            System.out.println("校验成功");
        }else{
            System.out.println("教研失败");
        }
        
    }

}
