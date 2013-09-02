/**
 * @Probject Name: design-pattern
 * @Path: observer.concreteCustomerOne.java
 * @Create By k
 * @Create In 2013-8-20 下午10:47:00
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
			System.out.println(personName + "只对打折商品的名字感兴趣");
			System.out.println("打折的商品是:" + productName);
		}

	}



	public CustomerOne(DiscountSubject subject, String personName) {
		super();
		this.subject = subject;
		this.personName = personName;
		subject.addObserver(this);
	}

}
