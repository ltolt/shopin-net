/**
 * @Desc ���幤����ɫ
 * @Probject Name: design-pattern
 * @Path: factoryBeijingClothesFactory.java
 * @Create By k
 * @Create In 2013-8-7 ����12:01:00
 * TODO
 */
package factory;

import product.Trousers;
import product.UpperClothes;
import product.WesternTrousers;
import product.WesternUpperClothes;

/**
 * @Class Name BeijingClothesFactory
 * @Author k
 * @Create In 2013-8-7
 */
public class BeijingClothesFactory extends ClothesFactory {

	/* (non-Javadoc)
	 * @see factory.ClothesFactory#createUpperClothes(int, int)
	 */
	@Override
	public UpperClothes createUpperClothes(int chestSize, int height) {
		return new WesternUpperClothes("��������������", chestSize, height);
	}

	/* (non-Javadoc)
	 * @see factory.ClothesFactory#createTrousers(int, int)
	 */
	@Override
	public Trousers createTrousers(int waistSize, int height) {
		return new WesternTrousers("��������������", waistSize, height);
	}

}
