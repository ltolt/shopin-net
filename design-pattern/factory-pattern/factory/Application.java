/**
 * @Probject Name: design-pattern
 * @Path: factoryApplication.java
 * @Create By k
 * @Create In 2013-8-4 下午11:40:36
 * TODO
 */
package factory;

import factory.creator.BallPen;
import factory.creator.BlackBallPen;
import factory.creator.BlueBallPen;
import factory.creator.RedBallPen;
import factory.product.PenCore;

/**
 * @Class Name Application
 * @Author k
 * @Create In 2013-8-4
 */
public class Application {

	/**
	 * @Methods Name main
	 * @Create In 2013-8-4 By k
	 * @param args void
	 */
	public static void main(String[] args) {
		PenCore pencore;
		BallPen ballpen = new BlueBallPen();
		pencore = ballpen.getPenCore();
		pencore.writeWord("你好很高兴认识你");
		ballpen = new RedBallPen();
		pencore = ballpen.getPenCore();
		pencore.writeWord("how are u");
		ballpen = new BlackBallPen();
		pencore = ballpen.getPenCore();
		pencore.writeWord("nice to meet u");

	}

}
