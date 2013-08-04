/**
 * @Probject Name: design-pattern
 * @Path: factory.productBluePenCore.java
 * @Create By k
 * @Create In 2013-8-4 下午11:29:57
 * TODO
 */
package factory.product;

/**
 * @Class Name BluePenCore
 * @Author k
 * @Create In 2013-8-4
 */
public class BluePenCore extends PenCore {
	
	public BluePenCore() {
		color = "蓝色";
	}

	/* (non-Javadoc)
	 * @see factory.product.PenCore#writeWord(java.lang.String)
	 */
	@Override
	public void writeWord(String s) {
		System.out.println("写出" + color + "的字:" + s);
	}

}
