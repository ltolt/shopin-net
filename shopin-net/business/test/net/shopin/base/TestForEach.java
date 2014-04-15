/**
 * @Probject Name: business
 * @Path: net.shopin.base.TestForEach.java
 * @Create By kongm
 * @Create In 2013-9-26 下午3:58:05
 * TODO
 */
package net.shopin.base;

import java.util.ArrayList;
import java.util.List;

import net.shopin.view.CartItem;

/**
 * @Class Name TestForEach
 * @Author kongm
 * @Create In 2013-9-26
 */
public class TestForEach {

	/**
	 * @Methods Name main
	 * @Create In 2013-9-26 By kongm
	 * @param args void
	 */
	public static void main(String[] args) {
		List<CartItem> list = new ArrayList<CartItem>();
		for (CartItem item : list) {
			System.out.println(item.getPromotionPrice());
			}
		}

	}

