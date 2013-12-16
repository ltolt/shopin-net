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


/* ----基于链表是实现的Stack-------------------------------------------------------- */
/**
 */
public class LinkStack
{
    private LinkedList list;
    

    public LinkStack()
    {
        this.list = new LinkedList();
    }


    //-----------method-----------
    public void push(int val){
        this.list.insertList(val,0.00);
    }

    public int pop(){
        return this.list.deleteLink().a;
    }
    
    public boolean isEmpty(){
        return this.list.isEmpty();
    }

    public void displayStack(){
        System.out.println("Stack -- top -- > bottom ");
        this.list.displayList();
    }
    
    /* ----基于链表实现的栈的用户-------------------------------------------------------- */
    /**
     * @param args
     */
    public static void main(String[] args)
    {
        LinkStack stack = new LinkStack();
        stack.push(1);stack.push(2);
        stack.displayStack();
        stack.push(3);stack.push(4);
        stack.displayStack();
        stack.pop();
        stack.displayStack();
    }

}
