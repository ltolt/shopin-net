/**
 * @Probject Name: design-pattern
 * @Path: factory.productBlackPenCore.java
 * @Create By k
 * @Create In 2013-8-4 下午11:31:11
 * TODO
 */
package factory.product;

/**
 * @Class Name BlackPenCore
 * @Author k
 * @Create In 2013-8-4
 */
public class BlackPenCore extends PenCore {

	public BlackPenCore() {
		color = "黑色";
	}
	/* (non-Javadoc)
	 * @see factory.product.PenCore#writeWord(java.lang.String)
	 */
	@Override
	public void writeWord(String s) {
		System.out.println("写出" + color + "的字:" + s);

	}

}
