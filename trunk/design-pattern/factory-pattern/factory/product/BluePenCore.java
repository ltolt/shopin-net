/**
 * @Probject Name: design-pattern
 * @Path: factory.productBluePenCore.java
 * @Create By k
 * @Create In 2013-8-4 ����11:29:57
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
		color = "��ɫ";
	}

	/* (non-Javadoc)
	 * @see factory.product.PenCore#writeWord(java.lang.String)
	 */
	@Override
	public void writeWord(String s) {
		System.out.println("д��" + color + "����:" + s);
	}

}
