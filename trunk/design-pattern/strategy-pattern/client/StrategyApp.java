/**
 * @Probject Name: design-pattern
 * @Path: clientStrategyApp.java
 * @Create By k
 * @Create In 2013-8-18 下午5:26:24
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
		Games game = new Games();//上下文对象
		game.setStrategy(new StrategyOne());//设置上下文对象使用的策略
		Person zhang = new Person();
		zhang.setName("张三");
		double[] a = {9.12,9.25,8.87,9.99,9.77,9.88};
		Person li = new Person();
		li.setName("李四");
		double[] b = {9.15,9.26,8.99,7.77,8.88,8.66};
		zhang.setScore(game.getPersonScore(a));
		li.setScore(game.getPersonScore(b));
		System.out.println("使用算术平均值方案:");
		System.out.printf("%s 最后得分: %5.3f %n",zhang.getName(),zhang.getScore());
		System.out.printf("%s 最后得分: %5.3f %n",li.getName(),li.getScore());
		game.setStrategy(new StrategyTwo());//使用策略
		zhang.setScore(game.getPersonScore(a));
		li.setScore(game.getPersonScore(b));
		System.out.println("使用几何平均值:");
		System.out.printf("%s 最后得分: %5.3f %n",zhang.getName(),zhang.getScore());
		System.out.printf("%s 最后得分: %5.3f %n",li.getName(),li.getScore());
		game.setStrategy(new StrategyThree());
		zhang.setScore(game.getPersonScore(a));
		li.setScore(game.getPersonScore(b));
		System.out.println("去掉一个最高分去掉一个最低分:");
		System.out.printf("%s 最后得分: %5.3f %n",zhang.getName(),zhang.getScore());
		System.out.printf("%s 最后得分: %5.3f %n",li.getName(),li.getScore());
		
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
