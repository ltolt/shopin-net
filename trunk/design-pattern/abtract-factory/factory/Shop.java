/**
 * @Probject Name: design-pattern
 * @Path: factoryShop.java
 * @Create By k
 * @Create In 2013-8-7 ����12:07:06
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

		System.out.println("<��װ��Ϣ>");
		System.out.println(cloth.getName() + ":");
		System.out.print("��Χ:" + cloth.getChestSize());
		System.out.println("���:" + cloth.getHeight());
		System.out.println(trousers.getName() + ":");
		System.out.print("��Χ:" + trousers.getWaistSize());
		System.out.println("���:" + trousers.getHeight());

	}

}
