/**
 * @Probject Name: design-pattern
 * @Path: factoryApplication2.java
 * @Create By k
 * @Create In 2013-8-4 обнГ11:56:17
 * TODO
 */
package factory;

import java.util.Collection;
import java.util.Iterator;
import java.util.LinkedList;

/**
 * @Class Name Application2
 * @Author k
 * @Create In 2013-8-4
 */
public class Application2 {

	/**
	 * @Methods Name main
	 * @Create In 2013-8-4 By k
	 * @param args void
	 */
	public static void main(String[] args) {
		Collection<Integer> mylist = new LinkedList<Integer>();
		for(int i = 0;i<10;i++){
			mylist.add(new Integer(i));
		}
		Iterator<Integer> iter = mylist.iterator();
		while(iter.hasNext()){
			System.out.println(iter.next());
		}
	}

}
