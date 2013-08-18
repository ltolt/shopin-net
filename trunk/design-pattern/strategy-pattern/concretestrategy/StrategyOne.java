/**
 * 说明:
 *    具体策略实现具体的算法
 * @Probject Name: design-pattern
 * @Path: concretestrategyStrategyOne.java
 * @Create By k
 * @Create In 2013-8-18 下午5:12:33
 * TODO
 */
package concretestrategy;

import strategy.ComputableStrategy;

/**
 * @Class Name StrategyOne
 * @Author k
 * @Create In 2013-8-18
 */
public class StrategyOne implements ComputableStrategy {

	/* (non-Javadoc)
	 * @see strategy.ComputableStrategy#computeScore(double[])
	 */
	@Override
	public double computeScore(double[] a) {
		double score = 0,sum= 0;
		for(int i =0;i<a.length;i++){
			sum += a[i];
		}
		score = sum/a.length;
		return score;
	}

}
