/**
 * ˵��:
 *     ����ģʽ�������Ľ�ɫ
 * @Probject Name: design-pattern
 * @Path: contextGames.java
 * @Create By k
 * @Create In 2013-8-18 ����5:22:15
 * TODO
 */
package context;

import strategy.ComputableStrategy;

/**
 * @Class Name Games
 * @Author k
 * @Create In 2013-8-18
 */
public class Games {

	ComputableStrategy strategy;
	
	public void setStrategy(ComputableStrategy strategy){
		this.strategy = strategy;
	}
	
	public double getPersonScore(double[] a){
		if(strategy != null)
			return strategy.computeScore(a);
		else
			return 0;
	}
	
	
}
