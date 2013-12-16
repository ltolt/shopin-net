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


/* -------基于双端链表实现的队列----------------------------------------------------- */
/**
 */
public class LinkedQueue
{
    private TwoEndLinkedList list;
    

    public LinkedQueue()
    {
        this.list = new TwoEndLinkedList();
    }

    //------method--------
    public void insert(int val){
        this.list.insertLast(val);
    }
    
    public int remove(){
        return this.list.deleteFirst().data;
    }

    
    public boolean isEmpty(){
        return this.list.isEmpty();
    }

    public void display(){
        System.out.println("from front --- > rear");
        this.list.displayList();
    }
    

    /* ------------------------------------------------------------ */
    /**
     * @param args
     */
    public static void main(String[] args)
    {
        LinkedQueue queue = new LinkedQueue();
        queue.insert(1);queue.insert(2);
        queue.display();
        queue.insert(3);queue.insert(4);
        queue.remove();
        queue.display();
    }

}
