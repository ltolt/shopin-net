/**
 * @Probject Name: design-pattern
 * @Path: subjectDiscountSubject.java
 * @Create By k
 * @Create In 2013-8-20 обнГ10:35:22
 * TODO
 */
package subject;

import observer.DiscountObserver;

/**
 * @Class Name DiscountSubject
 * @Author k
 * @Create In 2013-8-20
 */
public interface DiscountSubject {
	
	void addObserver(DiscountObserver o);
	void deleteObserver(DiscountObserver o);
	void notifyObservers();
}
