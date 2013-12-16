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
 *  单链表
 */
public class LinkedList
{
    public Link first;//单链表只需维护表头
    
    //--constructor
    public LinkedList()
    {
    }

    //-----method---------
    /**
     * 将链接点插入表头
     */
    public void insertList(int a , double b){
        Link link = new Link(a,b);
        link.next = first;
        first = link;
    }
    /**
     * 删除链表头的link
     */
    public Link deleteLink(){
        if(isEmpty())throw new IllegalStateException("Linked List is Empty");
        Link temp = first;
        first = first.next;
        return temp;
    }

    /**
     * 链表是否为空
     */
    public boolean isEmpty(){
        return first == null;
    }

    /**
     * 遍历链表
     */
    public void displayList(){
        if(isEmpty())throw new IllegalStateException("Linked List is Empty");
        Link current = first;    
        while(current != null){
            current.displayLink();
            current = current.next;
        }
    }
    /**
     * 根据关键字查找链接点
     */
    public Link find(int key){
        Link current = first;//from first start
        while(current.a != key){//
            if(current.next == null){//the last one not found
                return null;
            }else{
                current = current.next;//not the last one continue to find 
            }
        }
        return current;
    }
    
    public Link delete(int key){
        Link current = first;
        Link previous = first;
        while(current.a != key){
            if(current.next == null){//the last one not found the key
                System.out.println("Not Found it " + key);
                return null;
            }else{
                previous = current;
                current = current.next;
            }
        }
        if(current == first){//the first 
            first = first.next;//change first
        }else{
            previous.next = current.next;//bypass the key
        }
        return current;
    }
    

    /* ----------单链表的使用-------------------------------------------------- */
    /**
     * @param args
     */
    public static void main(String[] args)
    {
        LinkedList list = new LinkedList();
        list.insertList(1,1.00);list.insertList(2,2.00);
        list.insertList(3,3.00);list.insertList(4,4.00);
        list.displayList();
        Link founded =  list.find(1);
        System.out.println("Found :" + founded.a);
        Link deleted =  list.delete(44);
        System.out.println("Delete " + deleted);
        System.out.println("List <first --> last >:");
        list.displayList();
        
    }

}
/**
 * ---链接点--------------------------------------------------------- */
/**
 */
class Link{
    
    public int a;
    public double b;
    Link next;//自引用
    //--------------constructor--------
    Link(int a , double b){
        this.a = a;
        this.b = b;
    }
    
    //------------display-----
    public void displayLink(){
        System.out.println("{a =  " + a + " ; b = " + b +  "}");
    }
}

