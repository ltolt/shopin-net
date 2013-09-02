/**
 * ˵��:
 *     
 * @Probject Name: design-pattern
 * @Path: subject.concreteShopSubject.java
 * @Create By k
 * @Create In 2013-8-20 ����10:38:33
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
			o.update();//�����ù۲���ִ�и��²���,�����ṩ����
		}
	}
	
	public void setDiscountProducts(String name,double old, double cur){//���ô�����Ʒ
		productName = name;
		oldPrice = old;
		newPrice = cur;
		notifyObservers();//֪ͨ���й۲���
	}

	public String getProductName() {//�ṩ��ȡ��Ʒ���Ƶķ���
		return productName;
	}

	public double getOldPrice() {//�ṩ��ȡԭ��
		return oldPrice;
	}

	public double getNewPrice() {//�ṩ��ȡ�ּ�
		return newPrice;
	}
	
	

}
