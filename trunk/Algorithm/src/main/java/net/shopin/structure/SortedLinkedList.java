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


/* ----------有序链表-------------------------------------------------- */
/**
 */
public class SortedLinkedList
{
    private SLink first;
    
    public SortedLinkedList()
    {
        first = null;
    }

    
    public void insert(int val){
        SLink link = new SLink(val);
        SLink previous = null;
        SLink current = first;
        //如果val 大于 current 并且current 不是最后或最开始的一个
        while(current != null && val > current.val){
            previous = current;
            current = current.next;
        }
        if(previous == null)
            first = link;
        else
            first.next = link;
        //正常情况下
        link.next = current;
    }
    
    public int remove(){
        if(isEmpty())throw new IllegalStateException("Error");
        SLink temp = first;
        first = first.next;
        return temp.val;
    }

    public boolean isEmpty(){
        return first == null;
    }

    public void displayList(){
        System.out.println("Display the Sorted List ");
        SLink current = first;
        while(current != null){
            current.displayLink();
            current = current.next;
        }
    }
    
    
    /* ------有序链表的使用------------------------------------------------------ */
    /**
     * @param args
     */
    public static void main(String[] args)
    {
        SortedLinkedList list = new SortedLinkedList();
        list.insert(11);list.insert(22);
        list.insert(13);
        list.displayList();
        

    }

}
class SLink{
    public int val;
    public SLink next;

    public SLink(int val)
    {
        this.val = val;
    }
    
    public void displayLink(){
        System.out.println("val = " + val);
    }
    
}