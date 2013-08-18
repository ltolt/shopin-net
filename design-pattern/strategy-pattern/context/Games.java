/**
 * 说明:
 *     策略模式中上下文角色
 * @Probject Name: design-pattern
 * @Path: contextGames.java
 * @Create By k
 * @Create In 2013-8-18 下午5:22:15
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
