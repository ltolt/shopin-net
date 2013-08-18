/**
 * @Probject Name: design-pattern
 * @Path: concretestrategyStrategyThree.java
 * @Create By k
 * @Create In 2013-8-18 обнГ5:18:30
 * TODO
 */
package concretestrategy;

import java.util.Arrays;

import strategy.ComputableStrategy;

/**
 * @Class Name StrategyThree
 * @Author k
 * @Create In 2013-8-18
 */
public class StrategyThree implements ComputableStrategy {

	/* (non-Javadoc)
	 * @see strategy.ComputableStrategy#computeScore(double[])
	 */
	@Override
	public double computeScore(double[] a) {
		if(a.length<=2)
			return 0;
		double score = 0,sum = 0;
		Arrays.sort(a);
		for(int i = 0;i<a.length-1;i++){
			sum = sum + a[i];
		}
		score = sum / (a.length - 2);
		return score;
	}

}
