/**
 * @Probject Name: Algorithm
 * @Path: net.shopin.interviewClassLoaderTree.java
 * @Create By kongm
 * @Create In 2014-1-16 下午2:13:36
 * TODO
 */
package net.shopin.interview;

/**
 * @Class Name ClassLoaderTree
 * @Author kongm
 * @Create In 2014-1-16
 */
public class ClassLoaderTree {

	/**
	 * 演示 类加载器的树状组织结构
	 * @Methods Name main
	 * @Create In 2014-1-16 By kongm
	 * @param args void
	 */
	public static void main(String[] args) {
		ClassLoader loader = ClassLoaderTree.class.getClassLoader();
		while(loader != null){
			System.out.println(loader.toString());
			loader = loader.getParent();
		}
		

	}

}
