/**
 * @Probject Name: Algorithm
 * @Path: net.shopinHelloWorld.java
 * @Create By kongm
 * @Create In 2014-1-7 下午2:22:35
 * TODO
 */
package net.shopin;

import java.util.Map;

/**
 * @Class Name HelloWorld
 * @Author kongm
 * @Create In 2014-1-7
 */
public class HelloWorld {

	
	public native void hello();//所有native关键词修饰的都是对本地的声明
	
	static{
		System.loadLibrary("hello");//载入本地库
	}
	
	/**
	 * @Methods Name main
	 * @Create In 2014-1-7 By kongm
	 * @param args void
	 */
	public static void main(String[] args) {
		new HelloWorld().hello();
		Map<String, String> map;
	}

}
