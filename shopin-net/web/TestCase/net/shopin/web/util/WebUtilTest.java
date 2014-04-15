/**
 * @Probject Name: web
 * @Path: net.shopin.web.util.WebUtilTest.java
 * @Create By kongm
 * @Create In 2013-8-13 下午2:20:23
 * TODO
 */
package net.shopin.web.util;

import java.util.UUID;

import com.shopin.modules.utils.Codec;

/**
 * @Class Name WebUtilTest
 * @Author kongm
 * @Create In 2013-8-13
 */
public class WebUtilTest {

	/**
	 * @Methods Name main
	 * @Create In 2013-8-13 By kongm
	 * @param args void
	 */
	public static void main(String[] args) {
		if(args.length<=0) return;
		boolean result = WebUtil.validatePath(args[0]);
		System.out.println(result);
		String md1 = Codec.encodeMd5("000000");
		System.out.println(md1);
		
		String md2 = MD5Utils.getMD5String("000000");
		System.out.println(md2);
		
		System.out.println(UUID.randomUUID().toString());
		
		
	}

}
