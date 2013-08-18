/**
 * 说明:\
 *     适配器
 * @Probject Name: design-pattern
 * @Path: adapterIteratorAdapter.java
 * @Create By k
 * @Create In 2013-8-18 下午3:05:31
 * TODO
 */
package adapter;

import java.util.Enumeration;
import java.util.Iterator;

/**
 * @Class Name IteratorAdapter
 * @Author k
 * @Create In 2013-8-18
 */
public class IteratorAdapter implements Iterator{

	Enumeration bookenum;
	
	
	
	public IteratorAdapter(Enumeration bookenum) {
		this.bookenum = bookenum;
	}

	@Override
	public boolean hasNext() {
		return bookenum.hasMoreElements();
	}

	@Override
	public Object next() {
		return bookenum.nextElement();
	}

	@Override
	public void remove() {
		System.out.println("枚举器中没有删除集合元素的方法");
	}
	
	
	

}
