/**
 * @Probject Name: design-pattern
 * @Path: targetNewBookNameList.java
 * @Create By k
 * @Create In 2013-8-18 ÏÂÎç3:19:12
 * TODO
 */
package target;

import java.util.Iterator;
import java.util.LinkedList;

/**
 * @Class Name NewBookNameList
 * @Author k
 * @Create In 2013-8-18
 */
public class NewBookNameList {
	
	LinkedList<String> boolist;
	Iterator iterator;
	public NewBookNameList( Iterator iterator) {
		this.boolist =new LinkedList<String>();
		this.iterator = iterator;
	}
	
	public void setName(){
		while(iterator.hasNext()){
			String name = (String) iterator.next();
			boolist.add(name);
		}
	}
	
	public void getBookName(){
		Iterator<String> iter = boolist.iterator();
		while(iter.hasNext()){
			String name = iter.next();
			System.out.println(name);
		}
	}

}
