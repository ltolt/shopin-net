/**
 * 说明:
 *     策略模式中的策略角色
 *     定义抽象算法标识
 * @Probject Name: design-pattern
 * @Path: strategyComputableStrategy.java
 * @Create By k
 * @Create In 2013-8-18 下午5:11:31
 * TODO
 */
package strategy;

/**
 * @Class Name ComputableStrategy
 * @Author k
 * @Create In 2013-8-18
 */
public interface ComputableStrategy {

	double computeScore(double[] a);
	
}
