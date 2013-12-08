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


/* ------队列的第一种实现------------------------------------------------------ */
/**
 */
public class Queue
{
    private int maxSize;
    private int[] queueArray;
    private int front;
    private int rear;
    private int nElems;
    
    
    //---------------constructor
    public Queue(int maxSize)
    {
        this.maxSize = maxSize;
        this.queueArray = new int[maxSize];
        this.front = 0;
        this.rear = -1;
        this.nElems = 0;
    }
    
    //--------------method==============
    /**
     * 插入元素到队列的队尾
     */
    public void insert(int value){
        if(isFull())
            throw new IllegalStateException("Queue is Full");
        if(rear == maxSize - 1)//队列指针环绕  队尾指针到了最后边
            rear = -1;
         queueArray[++rear] = value;//插入队列
         nElems ++;
    }
    /**
     * 移除队头的元素 
     */
    public int remove(){
        if(isEmpty())
            throw new IllegalStateException("Queue is Empty");
        int temp = queueArray[front ++];//获取队头元素并且将队头指针加一
        if(front == maxSize)//环绕指针
            front = 0;
        nElems --;
        return temp;
    }
    /**
     * 返回队头的元素
     */
    public int peekFront(){
        return queueArray[front];
    }
    /**
     * 队列是否为空
     */
    public boolean isEmpty(){
        return nElems == 0;
    }
    /**
     * 队列是否有已满
     */
    public boolean isFull(){
        return nElems == maxSize;
    }
    /**
     * 队列的大小
     */
    public int size(){
        return nElems;
    }
    
    /* ------------------------------------------------------------ */
    /**
     * @param args
     */
    public static void main(String[] args)
    {
        Queue queue = new Queue(5);
        queue.insert(10);queue.insert(20);queue.insert(30);
        queue.insert(40);
        queue.remove();queue.remove();queue.remove();
        queue.insert(50);queue.insert(60);queue.insert(70);queue.insert(80);
        while(!queue.isEmpty()){
            int value = queue.remove();
            System.out.print(value + " -- ");
        }
        System.out.println();
    }

}
