/**
 * @Desc ����ģʽ�й����ߵĽ�ɫ
 * @Probject Name: design-pattern
 * @Path: factory.creatorBallPen.java
 * @Create By k
 * @Create In 2013-8-4 ����11:32:46
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
		System.out.println("������һֻװ��" + getPenCore().color + "��о��Բ���");
	}
	
	/**
	 * @Desc ��������
	 * @Methods Name getPenCore
	 * @Create In 2013-8-4 By k
	 * @return PenCore
	 */
	public abstract PenCore getPenCore();//
	
	
}
