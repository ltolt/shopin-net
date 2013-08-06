/**
 * @Probject Name: design-pattern
 * @Path: factoryShop.java
 * @Create By k
 * @Create In 2013-8-7 上午12:07:06
 * TODO
 */
package factory;

import product.Trousers;
import product.UpperClothes;

/**
 * @Class Name Shop
 * @Author k
 * @Create In 2013-8-7
 */
public class Shop {

	UpperClothes cloth;
	Trousers trousers;

	public void giveSuit(ClothesFactory factory, int chestSize, int waistSize,
			int height) {
		cloth = factory.createUpperClothes(chestSize, height);
		trousers = factory.createTrousers(waistSize, height);
		showMess();

	}

	private void showMess() {

		System.out.println("<套装信息>");
		System.out.println(cloth.getName() + ":");
		System.out.print("胸围:" + cloth.getChestSize());
		System.out.println("身高:" + cloth.getHeight());
		System.out.println(trousers.getName() + ":");
		System.out.print("腰围:" + trousers.getWaistSize());
		System.out.println("身高:" + trousers.getHeight());

	}

}
