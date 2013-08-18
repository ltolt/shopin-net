/**
 * @Probject Name: design-pattern
 * @Path: clientBookNameApp.java
 * @Create By k
 * @Create In 2013-8-18 下午3:22:10
 * TODO
 */
package client;

import java.util.Enumeration;

import target.NewBookNameList;

import adaptee.BookNameList;
import adapter.IteratorAdapter;

/**
 * @Class Name BookNameApp
 * @Author k
 * @Create In 2013-8-18
 */
public class BookNameApp {

	/**
	 * @Methods Name main
	 * @Create In 2013-8-18 By k
	 * @param args void
	 */
	public static void main(String[] args) {
		BookNameList old = new BookNameList();
		old.setName();
		Enumeration bookenum = old.getEnumeration();
		IteratorAdapter adapter = new IteratorAdapter(bookenum);
		NewBookNameList newList = new NewBookNameList(adapter);
		newList.setName();
		System.out.println("导入到新系统中的图书列表:");
		newList.getBookName();
		

	}

}
