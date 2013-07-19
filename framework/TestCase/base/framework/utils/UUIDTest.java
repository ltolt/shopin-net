/**
 * @Probject Name: framework
 * @Path: base.framework.utils.UUIDTest.java
 * @Create By kongm
 * @Create In 2013-7-17 上午10:37:50
 * TODO
 */
package base.framework.utils;

import java.util.UUID;

/**
 * @Class Name UUIDTest
 * @Author kongm
 * @Create In 2013-7-17
 */
public class UUIDTest {

	public static void main(String[] args) {
		//利用UUID生成随机数
		String uuid = UUID.randomUUID().toString();
		System.out.println(uuid);
		
		
	}
	
	
}
