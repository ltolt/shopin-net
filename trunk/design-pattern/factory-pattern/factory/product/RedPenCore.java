/**
 * @Desc ����ģʽ�о����Ʒproduct
 * @Probject Name: design-pattern
 * @Path: factory.productRedPenCore.java
 * @Create By k
 * @Create In 2013-8-4 ����11:28:07
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
		color = "��ɫ";
	}
	@Override
	public void writeWord(String s) {
		System.out.println("д��:" + color + "����:" + s);
	}
	
	

}
