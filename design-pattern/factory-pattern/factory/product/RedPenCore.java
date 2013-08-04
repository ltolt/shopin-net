/**
 * @Desc 工厂模式中具体产品product
 * @Probject Name: design-pattern
 * @Path: factory.productRedPenCore.java
 * @Create By k
 * @Create In 2013-8-4 下午11:28:07
 * TODO
 */
package factory.product;

/**
 * @Class Name RedPenCore
 * @Author k
 * @Create In 2013-8-4
 */
public class RedPenCore extends PenCore{

	public RedPenCore() {
		color = "红色";
	}
	@Override
	public void writeWord(String s) {
		System.out.println("写出:" + color + "的字:" + s);
	}
	
	

}
