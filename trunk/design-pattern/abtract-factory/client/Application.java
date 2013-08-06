/**
 * 
 * @desc client
 * @Probject Name: design-pattern
 * @Path: clientApplication.java
 * @Create By k
 * @Create In 2013-8-7 ÉÏÎç12:10:18
 * TODO
 */
package client;

import factory.BeijingClothesFactory;
import factory.ClothesFactory;
import factory.ShanghaiClothesFactory;
import factory.Shop;

/**
 * @Class Name Application
 * @Author k
 * @Create In 2013-8-7
 */
public class Application {
	
	public static void main(String[] args) {
		Shop shop = new Shop();
		ClothesFactory factory = new BeijingClothesFactory();
		shop.giveSuit(factory, 100, 82,178);
		factory = new ShanghaiClothesFactory();
		shop.giveSuit(factory, 120,88,180);
		
		
		
	}

}
