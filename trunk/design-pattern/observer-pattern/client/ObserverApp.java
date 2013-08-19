/**
 * ˵��:
 *     �۲���ģʽ��ʹ��
 * @Probject Name: design-pattern
 * @Path: clientObserverApp.java
 * @Create By k
 * @Create In 2013-8-19 ����10:48:55
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
		SeekJobCenter center = new SeekJobCenter();//������������
		UniversityObserver o1 = new UniversityObserver("F://o1.txt", center);
		StandfordObserver o2 = new StandfordObserver("F://o2.txt",center);
		center.giveNewMess("��˼������Ҫ8������Ա");
		center.notifyObservers();
		center.giveNewMess("��ͨ������Ҫ8������Ա");
		center.notifyObservers();
		center.giveNewMess("�ػ���Ҫ8������Ա");
		center.notifyObservers();
		center.giveNewMess("�ػ���Ҫ8������Ա");
		center.notifyObservers();
	}

}
