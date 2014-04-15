/**
 * @Probject Name: business
 * @Path: net.shopin.utils.ElapsedTest.java
 * @Create By kongm
 * @Create In 2013-7-11 下午5:06:06
 * TODO
 */
package net.shopin.utils;

import java.util.Date;

import com.shopin.modules.utils.Elapsed;

/**
 * @Class Name ElapsedTest
 * @Author kongm
 * @Create In 2013-7-11
 */
public class ElapsedTest {
	
	
	public static void main(String[] args) {
		//40 年前
		String date = Elapsed.calcElapsed(new Date(1000));
		System.out.println(date);//40 年前
		date = Elapsed.calcElapsed("2013-01-01 00:00:00");
		System.out.println(date);//6 个月前
		
	}
	

}
