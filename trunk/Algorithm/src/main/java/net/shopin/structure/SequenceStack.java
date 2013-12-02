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


package net.shopin.structure;

import java.util.Stack;


/* -java  顺序栈的实现----------------------------------------------------------- */
/**
 */
public class SequenceStack implements IStack
{
    private Object[] stackElem;
    
    private int top;
    
    /**
     * 构造一个空栈大小为maxSize
     */
    public SequenceStack(int maxSize)
    {
        stackElem = new Object[maxSize];
        top = 0;
    }

    
    
    /* --栈置空---------------------------------------------------------- */
    /**
     * 
     * @see net.shopin.structure.IStack#clear()
     */
    public void clear()
    {
        top = 0;
    }

    /* --栈判空---------------------------------------------------------- */
    /**
     * @see net.shopin.structure.IStack#isEmpty()
     */
    public boolean isEmpty()
    {
        return top == 0;
    }

    /* -----------求栈数据元素个数------------------------------------------------- */
    /**
     * @see net.shopin.structure.IStack#length()
     */
    public int length()
    {
        return top;
    }

    /* --取栈顶元素的函数---------------------------------------------------------- */
    /**
     * @see net.shopin.structure.IStack#peek()
     */
    public Object peek()
    {
        if(!isEmpty()) //栈非空
            return stackElem[top - 1];//栈顶元素
        else
            return null;
    }

    /* ---入栈操作--------------------------------------------------------- */
    /**
     * @see net.shopin.structure.IStack#push(java.lang.Object)
     */
    public void push(Object x)
    {
        //a.判断顺序栈是否为满,若满则抛出异常
        if(top == stackElem.length)
            throw new IllegalArgumentException("The stack is full");
        else
        //b.若栈不满,则将新元素x压入栈顶,并修正栈顶指针
            stackElem[top++] = x;
    }

    /* ----出栈操作-------------------------------------------------------- */
    /**
     * @see net.shopin.structure.IStack#pop()
     */
    public Object pop()
    {
        //若栈空
        if(isEmpty())
            return null;
        else
            return stackElem[--top];
    }
    
    //-----输出函数
    /**
     * @see
     */
    public void display(){
        for(int i = top -1;i >= 0 ; i-- ){
            System.out.print(stackElem[i] + " ");
        }
    }

}
