/**
 * @Probject Name: design-pattern
 * @Path: clientStrategyApp.java
 * @Create By k
 * @Create In 2013-8-18 ����5:26:24
 * TODO
 */
package client;

import concretestrategy.StrategyOne;
import concretestrategy.StrategyThree;
import concretestrategy.StrategyTwo;
import context.Games;

/**
 * @Class Name StrategyApp
 * @Author k
 * @Create In 2013-8-18
 */
public class StrategyApp {

	/**
	 * @Methods Name main
	 * @Create In 2013-8-18 By k
	 * @param args void
	 */
	public static void main(String[] args) {
		Games game = new Games();//�����Ķ���
		game.setStrategy(new StrategyOne());//���������Ķ���ʹ�õĲ���
		Person zhang = new Person();
		zhang.setName("����");
		double[] a = {9.12,9.25,8.87,9.99,9.77,9.88};
		Person li = new Person();
		li.setName("����");
		double[] b = {9.15,9.26,8.99,7.77,8.88,8.66};
		zhang.setScore(game.getPersonScore(a));
		li.setScore(game.getPersonScore(b));
		System.out.println("ʹ������ƽ��ֵ����:");
		System.out.printf("%s ���÷�: %5.3f %n",zhang.getName(),zhang.getScore());
		System.out.printf("%s ���÷�: %5.3f %n",li.getName(),li.getScore());
		game.setStrategy(new StrategyTwo());//ʹ�ò���
		zhang.setScore(game.getPersonScore(a));
		li.setScore(game.getPersonScore(b));
		System.out.println("ʹ�ü���ƽ��ֵ:");
		System.out.printf("%s ���÷�: %5.3f %n",zhang.getName(),zhang.getScore());
		System.out.printf("%s ���÷�: %5.3f %n",li.getName(),li.getScore());
		game.setStrategy(new StrategyThree());
		zhang.setScore(game.getPersonScore(a));
		li.setScore(game.getPersonScore(b));
		System.out.println("ȥ��һ����߷�ȥ��һ����ͷ�:");
		System.out.printf("%s ���÷�: %5.3f %n",zhang.getName(),zhang.getScore());
		System.out.printf("%s ���÷�: %5.3f %n",li.getName(),li.getScore());
		
	}

}

class Person{
	String name;
	double score;
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public double getScore() {
		return score;
	}
	public void setScore(double score) {
		this.score = score;
	}
}
