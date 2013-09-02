/**
 * @Probject Name: design-pattern
 * @Path: observer.concreteCustomerTwo.java
 * @Create By k
 * @Create In 2013-8-20 下午10:51:00
 * TODO
 */
package observer.concrete;

import observer.DiscountObserver;
import subject.DiscountSubject;
import subject.concrete.ShopSubject;

/**
 * @Class Name CustomerTwo
 * @Author k
 * @Create In 2013-8-20
 */
public class CustomerTwo implements DiscountObserver {
	
	DiscountSubject subject;
	double old,cur;
	String personName;
	
	
	

	public CustomerTwo(DiscountSubject subject, String personName) {
		super();
		this.subject = subject;
		this.personName = personName;
		subject.addObserver(this);
	}




	/* (non-Javadoc)
	 * @see observer.DiscountObserver#update()
	 */
	@Override
	public void update() {
		if(subject instanceof ShopSubject){
			old = ((ShopSubject)subject).getOldPrice();
			cur = ((ShopSubject)subject).getNewPrice();
			System.out.println(personName + "只对商品的原价和折扣后的价格感兴趣");
			System.out.println("原价" + old);
			System.out.println("现价" + cur);
		}

	}

}
