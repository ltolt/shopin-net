/**
 * @Desc 工厂模式中构造者的角色
 * @Probject Name: design-pattern
 * @Path: factory.creatorBallPen.java
 * @Create By k
 * @Create In 2013-8-4 下午11:32:46
 * TODO
 */
package factory.creator;

import factory.product.PenCore;

/**
 * @Class Name BallPen
 * @Author k
 * @Create In 2013-8-4
 */
public abstract class BallPen {

	public BallPen() {
		System.out.println("生产了一只装有" + getPenCore().color + "笔芯的圆珠笔");
	}
	
	/**
	 * @Desc 工厂方法
	 * @Methods Name getPenCore
	 * @Create In 2013-8-4 By k
	 * @return PenCore
	 */
	public abstract PenCore getPenCore();//
	
	
}
