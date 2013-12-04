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
 * 有序数组的java实现
 * 二分查找实现
 */
public class OrderArray
{
    //------------field-----------
    private long[] a;//ref to array a 
    private int nElems;//nunber of data items
    //----------constructor
    public OrderArray(int max)
    {
        this.a = new long[max];//creat array
        this.nElems = 0;
    }
    
    //----------method---------
    public int size(){
        return nElems;
    }
    
    //-----------二分查找---------
    public int find(long searchKey){
        int lowerBound = 0;
        int upperBound = nElems - 1;
        int curIn;
        while(true){
            curIn = (lowerBound + upperBound)/2;
            if(a[curIn] == searchKey){
                return curIn;//found it
            }else if(lowerBound > upperBound){
                return nElems;//cannot found it
            }else{//redivide range 
                if(a[curIn] < searchKey){//it is in the upper half
                    lowerBound = curIn + 1;
                }else if(a[curIn] > searchKey){
                    upperBound = curIn - 1;//it is in the lower half
                }
            }
        }
    }
    
    //---------insert -------------
    public void insert(long value){//put element into array
        int j;
        for(j = 0;j<nElems;j++)
            if(a[j]  >  value)//find linear 
                break;
        for(int k = nElems;k > j; k --)//move bigger one upper
            a[k] = a[k - 1];
        a[j] = value;//insert it
        nElems ++;//increment size
    }
    
    //----------delete------
    public boolean delete(long value){
        int j = find(value);
        if(j == nElems){//cannot find it
            return false;
        }else{
            for(int k = j;k < nElems;k++){//move bigger ones down
                a[k] = a[k + 1];
            }
            nElems --;//decrement size
            return true;
        }
        
    }
    
    //-------display------
    public void display(){
        for(int i = 0;i < nElems;i ++)
            System.out.print(a[i] + " ");
        System.out.println();
    }
    

    /*8
     * --有序数组的使用者---------------------------------------------------------- */
    /**
     * @param args
     */
    public static void main(String[] args)
    {
        OrderArray array = new OrderArray(100);
        array.insert(11);
        array.insert(111);array.insert(112);array.insert(122);
        array.insert(414);array.insert(132);array.insert(133);
        array.insert(412);array.insert(819);array.insert(213);
        int searchkey = 111;
        if(array.find(searchkey)!= array.nElems){
            System.out.println("Found it " + searchkey);
        }else{
            System.out.println("Not found it" + searchkey);
        }
        
        array.delete(111);
        array.delete(112);
        array.display();
    }
    
}
