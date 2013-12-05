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


/* ------------------------------------------------------------ */
/**
 * 第一个栈的实现
 * 使用数组实现的简单栈结构
 */
public class StackX
{
    private int maxSize;//size of stack array
    private int[] stackArray;
    private int top;//top of stack
    
    //-------------constructor-----
    public StackX(int maxSize)
    {
        this.maxSize = maxSize;//set array size
        this.stackArray = new int[maxSize];
        this.top = -1;//empty stack
    }
    
    //--------------method-------------
    /**
     * 压栈
     */
    public void push(int value){
        stackArray[++top] = value;//increment top and then insert the value
    }
    /**
     * 弹栈
     */
    public int pop(){
        return stackArray[top --];//get the item decrement top
    }
    /**
     * 查看栈顶
     */
    public int peek(){
        return stackArray[top];
    }

    public boolean isEmpty(){
        return top == -1;
    }
    
    public boolean isFull(){
        return top == maxSize - 1;
    }
    
    
    /* ----数组栈的使用-------------------------------------------------------- */
    /**
     * @param args
     */
    public static void main(String[] args)
    {
        StackX stack = new StackX(10);
        stack.push(1);
        stack.push(2);
        stack.push(3);stack.push(4);
        while(!stack.isEmpty()){
            int value = stack.pop();
            System.out.print(value + " ");
        }
        System.out.println();
    }

   

}
