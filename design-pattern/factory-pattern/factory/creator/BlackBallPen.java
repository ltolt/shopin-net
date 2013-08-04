/**
 * @Probject Name: design-pattern
 * @Path: factory.creatorBlackBallPen.java
 * @Create By k
 * @Create In 2013-8-4 обнГ11:38:22
 * TODO
 */
package factory.creator;

import factory.product.BlackPenCore;
import factory.product.PenCore;

/**
 * @Class Name BlackBallPen
 * @Author k
 * @Create In 2013-8-4
 */
public class BlackBallPen extends BallPen {

	/* (non-Javadoc)
	 * @see factory.creator.BallPen#getPenCore()
	 */
	@Override
	public PenCore getPenCore() {
		return new BlackPenCore();
	}

}
