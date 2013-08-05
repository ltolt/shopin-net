/**
 * @Desc  抽象工厂角色
 * @Probject Name: design-pattern
 * @Path: factoryClothesFactory.java
 * @Create By k
 * @Create In 2013-8-6 上午12:08:20
 * TODO
 */
package factory;

import product.Trousers;
import product.UpperClothes;

/**
 * @Class Name ClothesFactory
 * @Author k
 * @Create In 2013-8-6
 */
public abstract class ClothesFactory {

	public abstract UpperClothes createUpperClothes(int chestSize,int height);
    public abstract Trousers createTrousers(int waistSize,int height);
	
	
}
