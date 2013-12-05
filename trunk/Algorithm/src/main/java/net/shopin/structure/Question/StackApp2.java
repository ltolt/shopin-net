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

/* --栈的使用实例---------------------------------------------------------- */
/**
 * 单词逆序 利用LIFO特性来是单词逆序
 */
public class StackApp2
{

    /* ------------------------------------------------------------ */
    /**
     * @param args
     * @throws IOException
     */
    public static void main(String[] args) throws IOException
    {
        while (true)
        {
            System.out.println("Enter a String:");
            String value = getString();
            Reverse reverse = new Reverse(value);
            String reverseValue = reverse.getReverse();
            System.out.println("got the reverse :" + reverseValue);
        }
    }

    public static String getString() throws IOException
    {
        InputStreamReader in = new InputStreamReader(System.in);
        BufferedReader reader = new BufferedReader(in);
        String value = reader.readLine();
        return value;
    }

}

/**
 * -----------char数组构成的stack-------------------------------------------------
 */
/**
 */
class CharStack
{
    private int maxSize;//
    private char[] charArray;
    private int top;

    // ------constructor-----------
    public CharStack(int maxSize)
    {
        this.maxSize = maxSize;
        this.charArray = new char[maxSize];
        this.top = -1;
    }

    // -------------method---------
    public void push(char c)
    {
        charArray[++top] = c;
    }

    public char pop()
    {
        return charArray[top--];
    }

    public char peek()
    {
        return charArray[top];
    }

    public boolean isEmpty()
    {
        return top == -1;
    }

    public boolean isFull()
    {
        return top == maxSize - 1;
    }
}

/**
 * ----------逆序输出--------------------------------------------------
 */
/**
*/
class Reverse
{
    private String input;
    private String output;

    public Reverse(String input)
    {
        this.input = input;
    }

    /**
     * 反向输入
     */
    public String getReverse()
    {
        CharStack stack = new CharStack(input.length());
        for (int i = 0; i < input.length(); i++)
        {
            stack.push(input.charAt(i));
        }
        output = "";
        while (!stack.isEmpty())
        {
            output += stack.pop();
        }
        return output;
    }

}
