/**
 * @Probject Name: design-pattern
 * @Path: observer.concreteCustomerOne.java
 * @Create By k
 * @Create In 2013-8-20 ����10:47:00
 * TODO
 */
package observer.concrete;

import observer.DiscountObserver;
import subject.DiscountSubject;
import subject.concrete.ShopSubject;

/**
 * @Class Name CustomerOne
 * @Author k
 * @Create In 2013-8-20
 */
public class CustomerOne implements DiscountObserver {

	DiscountSubject subject;
	String productName,personName;
	
	
	
	/* (non-Javadoc)
	 * @see observer.DiscountObserver#update()
	 */
	@Override
	public void update() {
		if(subject instanceof ShopSubject){
			productName = ((ShopSubject)subject).getProductName();
			System.out.println(personName + "ֻ�Դ�����Ʒ�����ָ���Ȥ");
			System.out.println("���۵���Ʒ��:" + productName);
		}

	}



	public CustomerOne(DiscountSubject subject, String personName) {
		super();
		this.subject = subject;
		this.personName = personName;
		subject.addObserver(this);
	}

}
