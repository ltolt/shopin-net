/**
 * @Probject Name: design-pattern
 * @Path: adapteeBookNameList.java
 * @Create By k
 * @Create In 2013-8-18 ����3:16:23
 * TODO
 */
package adaptee;

import java.util.Enumeration;
import java.util.Vector;

/**
 * @Class Name BookNameList
 * @Author k
 * @Create In 2013-8-18
 */
public class BookNameList {
	
	
	private Vector<String> vector;
	private Enumeration bookenum;
	public BookNameList() {
		vector = new Vector<String>();
	}
	public  void setName(){
		vector.add("j2ee����");
		vector.add("j2ee����");
		vector.add("j2ee����");
		vector.add("j2ee����");
	}
	
	public Enumeration getEnumeration(){
		return vector.elements();
	}
	

}
