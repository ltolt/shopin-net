/**
 * 说明:
 *     
 * @Probject Name: design-pattern
 * @Path: subject.concreteShopSubject.java
 * @Create By k
 * @Create In 2013-8-20 下午10:38:33
 * TODO
 */
package subject.concrete;

import java.util.ArrayList;

import observer.DiscountObserver;
import subject.DiscountSubject;

/**
 * @Class Name ShopSubject
 * @Author k
 * @Create In 2013-8-20
 */
public class ShopSubject implements DiscountSubject {

	String productName;
	double oldPrice,newPrice;
	ArrayList<DiscountObserver> customs;
	
	
	
	
	public ShopSubject() {
		super();
		customs = new ArrayList<DiscountObserver>();
	}

	/* (non-Javadoc)
	 * @see subject.DiscountSubject#addObserver(observer.DiscountObserver)
	 */
	@Override
	public void addObserver(DiscountObserver o) {
		if(!customs.contains(o))
			customs.add(o);
	}

	/* (non-Javadoc)
	 * @see subject.DiscountSubject#deleteObserver(observer.DiscountObserver)
	 */
	@Override
	public void deleteObserver(DiscountObserver o) {
		if(customs.contains(o))
			customs.remove(o);
	}

	/* (non-Javadoc)
	 * @see subject.DiscountSubject#notifyObservers()
	 */
	@Override
	public void notifyObservers() {
		for(int i = 0;i<customs.size();i++){
			DiscountObserver o = customs.get(i);
			o.update();//仅仅让观察者执行更新操作,但不提供数据
		}
	}
	
	public void setDiscountProducts(String name,double old, double cur){//设置打折商品
		productName = name;
		oldPrice = old;
		newPrice = cur;
		notifyObservers();//通知所有观察者
	}

	public String getProductName() {//提供获取商品名称的方法
		return productName;
	}

	public double getOldPrice() {//提供获取原价
		return oldPrice;
	}

	public double getNewPrice() {//提供获取现价
		return newPrice;
	}
	
	

}
