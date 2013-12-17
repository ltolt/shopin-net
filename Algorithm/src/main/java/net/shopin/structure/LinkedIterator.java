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


/* ------链表的迭代器------------------------------------------------------ */
/**
 * 
 */
public class LinkedIterator
{
    //-----------field-----------
    private Link previous;//previous link
    private Link current;//current link
    private LinkedList list;//linked list
    
    //---------constructor--------
    public LinkedIterator(LinkedList list)
    {
        this.list = list;
        
    }
    
    //-------------method----------
    public void reset(){
        current = list.getFirst();
        previous = null;
    }

    public boolean atEnd(){
        return current.next == null;
    }
    
    public void next(){
        if(atEnd())throw new  IllegalStateException("Error ");
        previous = current;
        current = current.next;
    }
    
    public Link getCurrent(){
        return current;
    }

    /**
     * insert after current link
     */
    public void insertAfter(int val){
        Link  link = new Link(val,0.00);
        if(list.isEmpty()){
            list.setFirst(link);
            current = link;
        }else{
            link.next = current.next;
            current.next = link;
            next();
        }
    }
    /**
     * insert before current
     */
    public void insertBefore(int val){
        Link  link = new Link(val,0.00);
        
        if(previous == null){
            list.setFirst(link);
            current = link;
            reset();
        }else{
            link.next = current;
            previous.next = link;
            current = link;
        }
    }
    
    public int deleteCurrrent(){
        int result = current.a;
        if(previous == null){
            list.setFirst(current.next);
            reset();
        }else{
            previous.next = current.next;
            if(atEnd()){
                reset();
            }else{
                current = current.next;
            }
        }
        return result;
    }
    
    
    /* -----链表迭代器的使用------------------------------------------------------- */
    /**
     * @param args
     */
    public static void main(String[] args)
    {
        
        

    }

}


