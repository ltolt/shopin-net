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
 */
public class HignArraApp
{

    /* ------------------------------------------------------------ */
    /**
     * @param args
     */
    public static void main(String[] args)
    {
        int maxSize = 100;//array size
        HighArray arr;//reference to array
        arr = new HighArray(maxSize);//create the array
        arr.insert(77);//insert 10 items
        arr.insert(99);
        arr.insert(22);
        arr.insert(33);
        arr.insert(11);
        arr.insert(55);
        arr.insert(88);arr.insert(90);arr.insert(12);arr.insert(14);
        arr.display();//display items
        int searchKey = 12;//serach for item
        if(arr.find(searchKey))
            System.out.println("Found " + searchKey);
        else
            System.out.println("Cannot find " + searchKey);
        arr.delete(13);
        arr.delete(99);
        arr.display();
    }

}
//{!begin HighArray}
class HighArray{
    
    private long[] a;//ref to array a 
    private int nElems;//number of data items
    //---------------contructor-------
    public HighArray(int max)
    {
        a = new long[max]; //creat the array
        nElems = 0;//no items yet
    }
    //------------methods--------
    public void insert(long value){//put elems into array
        a[nElems] = value;//insert it
        nElems ++;//increment size
    }
    
    
    public boolean find(long searchKey){
        int j;
        for(j = 0;j < nElems;j++)//for each element
            if(a[j] == searchKey)//found items?
                break;//exit loop before end
        if(j == nElems)//gone to end
            return false; //cannot find it
        else
            return true;//find it
        
    }
    
    public boolean delete(long value){
        int j;
        for(j = 0;j<nElems;j++)//look for it
            if(value == a[j])
                break;
        if(j == nElems)
            return false;//cannot fint it
        else
        {
            for(int k = j;k < nElems;k++)//move higher ones down
                a[k] = a[k+1];
            nElems --;//decrement size
            return true;
        }
            
    }
    
    public void display(){//display array contents
        for(int j = 0;j < nElems;j ++)//for each element
            System.out.print(a[j] + " ");
        System.out.println("");
    }
}
//{!end HihgArray}










