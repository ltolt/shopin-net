/**
 * @Probject Name: design-pattern
 * @Path: factory.creatorBlueBallPen.java
 * @Create By k
 * @Create In 2013-8-4 обнГ11:37:40
 * TODO
 */
package factory.creator;

import factory.product.BluePenCore;
import factory.product.PenCore;

/**
 * @Class Name BlueBallPen
 * @Author k
 * @Create In 2013-8-4
 */
public class BlueBallPen extends BallPen {

	/* (non-Javadoc)
	 * @see factory.creator.BallPen#getPenCore()
	 */
	@Override
	public PenCore getPenCore() {
		return new BluePenCore();
	}

}
