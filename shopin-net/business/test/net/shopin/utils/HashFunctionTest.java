/**
 * @Probject Name: business
 * @Path: net.shopin.utils.HashFunctionUtils.java
 * @Create By kongm
 * @Create In 2013-7-11 下午5:14:31
 * TODO
 */
package net.shopin.utils;

import com.shopin.modules.utils.HashFunction;

/**
 * @Class Name HashFunctionUtils
 * @Author kongm
 * @Create In 2013-7-11
 */
public class HashFunctionTest {
	
	
	public static void main(String[] args) {
	
		HashFunction md5hash = new HashFunction();
		long str  = md5hash.hash("kongm");
		System.out.println(str);
		
	}

}
