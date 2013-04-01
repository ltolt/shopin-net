package base.framework.test;

import base.framework.util.StringUtils;

/**
 * @author kongming
 *
 */
public class TestStringUtils {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		String encode = StringUtils.getEncoding("商品");
		System.out.println(encode);
		boolean result = StringUtils.isNotEmpty("s");
		System.out.println(result);
	}

}
