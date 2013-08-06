/**
 * @Desc ���幤����ɫ
 * @Probject Name: design-pattern
 * @Path: factoryShanghaiClothesFactory.java
 * @Create By k
 * @Create In 2013-8-7 ����12:04:12
 * TODO
 */
package factory;

import product.CowboyTrousers;
import product.CowboyUpperClothes;
import product.Trousers;
import product.UpperClothes;

/**
 * @Class Name ShanghaiClothesFactory
 * @Author k
 * @Create In 2013-8-7
 */
public class ShanghaiClothesFactory extends ClothesFactory {

	/* (non-Javadoc)
	 * @see factory.ClothesFactory#createUpperClothes(int, int)
	 */
	@Override
	public UpperClothes createUpperClothes(int chestSize, int height) {
		return new CowboyUpperClothes("�Ϻ���ţ������", chestSize, height);
	}

	/* (non-Javadoc)
	 * @see factory.ClothesFactory#createTrousers(int, int)
	 */
	@Override
	public Trousers createTrousers(int waistSize, int height) {
		return new CowboyTrousers("�Ϻ���ţ�п���", waistSize, height);
	}

}
