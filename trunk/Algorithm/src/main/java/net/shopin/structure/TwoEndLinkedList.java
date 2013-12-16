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
 * 双端链表
 */
public class TwoEndLinkedList
{
    //--------------field--------
    Link1 first;//表头 
    Link1 last;//表尾
    //-------------constructor------
    public TwoEndLinkedList()
    {
    }
    
    //-------------method--------
    public boolean isEmpty(){
        return first == null;
    }
    
    public void insertFirst(int data){
        Link1 link = new Link1(data);
        if(isEmpty())
            last = link;
        link.next = first;
        first = link;
    }
    
    public void insertLast(int data){
        Link1 link = new Link1(data);
        if(isEmpty())
            first = link;
        else
            last.next = link;
        last = link;
    }
    
    public Link1 deleteFirst(){
        Link1 temp = first;
        if(first.next == null)
            last = null;
        first = first.next;
        return temp;
    }

    public void displayList(){
        System.out.println("Linked List first --> last");
        Link1 current = first;
        while(current != null){
            current.displayLink();
            current = current.next;
        }
    }
    
    
    /* ---------双端链表使用--------------------------------------------------- */
    /**
     * @param args
     */
    public static void main(String[] args)
    {
        TwoEndLinkedList list = new TwoEndLinkedList();
        list.insertFirst(1);//list.insertFirst(2);
        list.insertLast(3);
        list.displayList();
    }




  

}
/**
 * --链接点---------------------------------------------------------- */
/**
 */
class Link1{
    
    public int data;
    Link1 next;
    
    //-------constructor
    public Link1(int data)
    {
        this.data = data;
    }
    
    //-------method-------
    public void displayLink(){
        System.out.println("{data : " + data + " } ");
    }
    
}