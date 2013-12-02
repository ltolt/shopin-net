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


/* ----链栈的实现-------------------------------------------------------- */
/**
 */
public class LinkedStack<T> implements IStack
{
    /**
     * 定义节点数据结构------------------------------------------------------------ */
    private class Node{
        public Object data;
        public Node next;
        public Node()
        {
        }
        public Node(Object data, Node next)
        {
            this.data = data;
            this.next = next;
        }
    }
    //栈顶元素
    private Node top;
    //元素个数
    private int size;
    
    /* ------------------------------------------------------------ */
    /**
     * @see net.shopin.structure.IStack#clear()
     */
    public void clear()
    {
        // TODO Auto-generated method stub

    }

    /* ------------------------------------------------------------ */
    /**
     * @see net.shopin.structure.IStack#isEmpty()
     */
    public boolean isEmpty()
    {
        return size == 0;
    }

    /* ------------------------------------------------------------ */
    /**
     * @see net.shopin.structure.IStack#length()
     */
    public int length()
    {
        return size;
    }

    /* --返回栈顶的元素 但不出栈---------------------------------------------------------- */
    /**
     * @see net.shopin.structure.IStack#peek()
     */
    public Object peek()
    {
        return top.data;
    }

    /* -入栈----------------------------------------------------------- */
    /**
     * @see net.shopin.structure.IStack#push(java.lang.Object)
     */
    public void push(Object x)
    {
        top = new Node(x,top);
        size ++;
    }

    /* --出栈---------------------------------------------------------- */
    /**
     * @see net.shopin.structure.IStack#pop()
     */
    public Object pop()
    {
        Node oldNode = top;
        top = top.next;
        //释放引用
        oldNode.next = null;
        size --;
        return oldNode.data;
    }

}
