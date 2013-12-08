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
 * 优先级队列
 */
public class PriorityQueue
{
    
    private int maxSize;
    private int[] queueArray;
    private int nElems;
    
    //----constructor----
    public PriorityQueue(int maxSize)
    {
        this.maxSize = maxSize;
        this.queueArray = new int[maxSize];
        this.nElems  = 0;
    }

    //-------method--------
    /**
     * 插入优先级队列
     */
    public void insert(int value){
        if(nElems == 0){
            queueArray[nElems++] = value;//插入
        }else{
            int j;
            for(j = nElems - 1;j >=0;j --){
                if(value > queueArray[j])
                    queueArray[j + 1] = queueArray[j];//如果插入的值大则队列顶部的元素往上移动
                else
                    break;
            }
            queueArray[j + 1] =value;//插入
            nElems ++;
        }
    }
    /** 
     * @return
     */
    public int remove(){
        return queueArray[--nElems];
    }
    
    public int peek(){
        return queueArray[nElems - 1];
    }
    
    public boolean isEmpty(){
        return nElems == 0;
    }
    
    public boolean isFull(){
        return nElems == maxSize;
    }
    
    /* -------优先级队列的使用----------------------------------------------------- */
    /**
     * @param args
     */
    public static void main(String[] args)
    {
        PriorityQueue queue = new PriorityQueue(5);
        queue.insert(3);queue.insert(1);queue.insert(6);queue.insert(2);
        queue.insert(33);
        while(!queue.isEmpty()){
            int value = queue.remove();
            System.out.print(value + " ");        
        }
        System.out.println();
    }

}
