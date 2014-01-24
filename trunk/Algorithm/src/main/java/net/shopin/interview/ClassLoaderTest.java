/**
 * @Probject Name: Algorithm
 * @Path: net.shopin.interviewClassLoaderTest.java
 * @Create By kongm
 * @Create In 2014-1-16 下午3:21:14
 * TODO
 */
package net.shopin.interview;

import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;

/**
 * 测试java类是否相同
 * @Class Name ClassLoaderTest
 * @Author kongm
 * @Create In 2014-1-16
 */
public class ClassLoaderTest {

	/**
	 * @Methods Name main
	 * @Create In 2014-1-16 By kongm
	 * @param args void
	 * @throws ClassNotFoundException 
	 * @throws IllegalAccessException 
	 * @throws InstantiationException 
	 * @throws NoSuchMethodException 
	 * @throws SecurityException 
	 */
	public static void main(String[] args) throws ClassNotFoundException, InstantiationException, IllegalAccessException, SecurityException, NoSuchMethodException {
		ClassLoader loader = ClassLoaderTree.class.getClassLoader();
		Class<?> class1 = loader.loadClass("net.shopin.interview.Sample");
		Object obj1 = class1.newInstance();
		Class<?> class2 = loader.loadClass("net.shopin.interview.Sample");
		Object obj2 = class2.newInstance();
		Method setSampleMethod = class1.getMethod("setSample", java.lang.Object.class);
		try {
			setSampleMethod.invoke(obj1, obj2);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

}
