/**
 * ˵��:
 *     �۲���ģʽ�����ݷ����Ŀͻ���
 * @Probject Name: design-pattern
 * @Path: clientPullApplication.java
 * @Create By k
 * @Create In 2013-8-20 ����10:54:17
 * TODO
 */
package client;

import observer.concrete.CustomerOne;
import observer.concrete.CustomerTwo;
import subject.DiscountSubject;
import subject.concrete.ShopSubject;

/**
 * @Class Name PullApplication
 * @Author k
 * @Create In 2013-8-20
 */
public class PullApplication {

	/**
	 * @Methods Name main
	 * @Create In 2013-8-20 By k
	 * @param args void
	 */
	public static void main(String[] args) {
		ShopSubject subject = new ShopSubject();
		CustomerOne a = new CustomerOne(subject, "AAA");
		CustomerTwo b = new CustomerTwo(subject, "BBB");
		subject.setDiscountProducts("����", 111.0,100);
		subject.setDiscountProducts("nike", 111.0,100);
		
	}

}
