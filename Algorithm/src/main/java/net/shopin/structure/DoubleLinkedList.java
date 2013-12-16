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


/* ----双向链表的实现-------------------------------------------------------- */
/**
 */
public class DoubleLinkedList
{
    //-------------------field-------
    private DLink first;//the first elem
    private DLink last;//the last elem
    
    //---------------constructor-----
    public DoubleLinkedList()
    {
        first = null;
        last = null;
    }

    //---------method -------
    
    public boolean isEmpty(){
        return first == null;
    }
    
    public void insertFirst(int val){
        //new elem
        DLink link = new DLink(val);
        if(isEmpty())
            last = link;
        else
            first.previous = link;
        link.next = first;
        first = link;
    }
    
    
    public void insertLast(int val){
        DLink link = new DLink(val);
        if(isEmpty())
            first = link;
        else
            last.next = link;
        link.previous = last;
        last = link;
        
    }
    /**
     * insert val after key
     */
    public boolean insertAfter(int key , int val){
        if(isEmpty())throw new IllegalArgumentException("Error ");
        DLink current = first;
        DLink link = new DLink(val);
        while(current.val != key){
            current = current.next;
            if(current == null)
                return false;
        }
        if(current == last)
            last = link;
        else
            current.next.previous  = link;
        link.next = current.next;
        current.next = link;
        link.previous = current;
        return true;
    }
    
    
    public int deleteFirst(){
        if(isEmpty())throw new IllegalStateException();
        DLink temp = first;
        if(first.next == null)
           last = null;
        else
            first.next.previous = null;
        first = first.next;
        return temp.val;
    }
    

    public int deleteLast(){
        if(isEmpty())throw new IllegalStateException();
        DLink temp = last;
        if(last.previous == null)
            first = null;
        else
            last.previous.next = null;
        last = last.previous;
        return temp.val;
    }
    
    public int deleteKey(int key){
        //find key 
        DLink current = first;
        while(current.val != key){
            current = current.next;
            if(current == null)
                return -1;//not exits
        }
        if(current == first)
            first = current.next;
        else
            current.previous.next = current.next;
        
        if(current == last)
            last = current.previous;
        else
            current.next.previous = current.previous;
        
        return current.val;
    }
    
    
    public void displayForward(){
        DLink current = first;
        System.out.println("Display Double Linked List : ");
        while(current != null ){
            current.displayLink();
            current = current.next;
        }
        
    }
    
    
    /* ------use double linked list------------------------------------------------------ */
    /**
     * @param args
     */
    public static void main(String[] args)
    {
        DoubleLinkedList list = new DoubleLinkedList();
        list.insertFirst(1);list.insertFirst(2);
        list.displayForward();
        list.insertLast(3);list.insertLast(0);
        list.displayForward();
        list.deleteFirst();
        list.deleteLast();
        list.displayForward();
        list.insertAfter(3,4);
        list.displayForward();
        int val =  list.deleteKey(4);
        list.displayForward();
        System.out.println(val);
    }

    
}
class DLink{
    
    public int val;
    public DLink previous;//前一个link
    public DLink next;//
    
    public DLink(int val)
    {
        this.val = val;
    }
    
    public void displayLink(){
        System.out.println("val :" + val);
    }
    
    
}