/**
 * @Desc ����ģʽ�о��幹���߽�ɫ
 * @Probject Name: design-pattern
 * @Path: factory.creatorRedBallPen.java
 * @Create By k
 * @Create In 2013-8-4 ����11:36:06
 * TODO
 */
package factory.creator;

import factory.product.PenCore;
import factory.product.RedPenCore;

/**
 * @Class Name RedBallPen
 * @Author k
 * @Create In 2013-8-4
 */
public class RedBallPen extends BallPen {

	/* (non-Javadoc)
	 * @see factory.creator.BallPen#getPenCore()
	 */
	@Override
	public PenCore getPenCore() {
		return new RedPenCore();
	}

}
