/**
 * @Probject Name: Algorithm
 * @Path: net.shopin.interviewStaticMember.java
 * @Create By kongm
 * @Create In 2014-1-16 下午1:43:09
 * TODO
 */
package net.shopin.interview;

/**
 * 说明:
 *     静态成员变量面试题总结
 *     
 * @Class Name StaticMember
 * @Author kongm
 * @Create In 2014-1-16
 */
public class StaticMember {

	
	private static int i;
	
	private int j;
	
	
	public static void f1(){
		i++;
	}
	
	
	public void f2(){
		i++;
		j++;
	}
	
	/**
	 * @Methods Name main
	 * @Create In 2014-1-16 By kongm
	 * @param args void
	 */
	public static void main(String[] args) {
		StaticMember s1 = new StaticMember();
		StaticMember s2 = new StaticMember();
		s1.f1();s1.f2();
		System.out.println(s1.i);
		System.out.println(s2.i);
		System.out.println(s1.j);
		System.out.println(s2.j);
	}

}
