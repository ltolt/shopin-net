/**
 * 说明:
 *     观察者模式的使用
 * @Probject Name: design-pattern
 * @Path: clientObserverApp.java
 * @Create By k
 * @Create In 2013-8-19 下午10:48:55
 * TODO
 */
package client;

import observer.concrete.StandfordObserver;
import observer.concrete.UniversityObserver;
import subject.concrete.SeekJobCenter;

/**
 * @Class Name ObserverApp
 * @Author k
 * @Create In 2013-8-19
 */
public class ObserverApp {

	/**
	 * @Methods Name main
	 * @Create In 2013-8-19 By k
	 * @param args void
	 */
	public static void main(String[] args) {
		SeekJobCenter center = new SeekJobCenter();//创建具体主题
		UniversityObserver o1 = new UniversityObserver("F://o1.txt", center);
		StandfordObserver o2 = new StandfordObserver("F://o2.txt",center);
		center.giveNewMess("文思海辉需要8个程序员");
		center.notifyObservers();
		center.giveNewMess("软通动力需要8个程序员");
		center.notifyObservers();
		center.giveNewMess("敦煌需要8个程序员");
		center.notifyObservers();
		center.giveNewMess("敦煌需要8个程序员");
		center.notifyObservers();
	}

}
