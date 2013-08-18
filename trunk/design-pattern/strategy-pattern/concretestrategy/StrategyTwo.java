/**
 * 说明:
 *     具体策略
 * @Probject Name: design-pattern
 * @Path: concretestrategyStrategyTwo.java
 * @Create By k
 * @Create In 2013-8-18 下午5:14:37
 * TODO
 */
package concretestrategy;

import strategy.ComputableStrategy;

/**
 * @Class Name StrategyTwo
 * @Author k
 * @Create In 2013-8-18
 */
public class StrategyTwo implements ComputableStrategy {

	/* (non-Javadoc)
	 * @see strategy.ComputableStrategy#computeScore(double[])
	 */
	@Override
	public double computeScore(double[] a) {
		double score = 0, multi = 1;
		int n = a.length;
		for(int i = 0;i<a.length;i++){
			multi = multi*a[i];
		}
		score = Math.pow(multi, 1.0/n);
		return score;
	}
	
	public static void main(String[] args) {
		double[] a = {1,2,3};
		StrategyTwo s = new StrategyTwo();
		double result = s.computeScore(a);
		System.out.println(result);
	}
	

}
