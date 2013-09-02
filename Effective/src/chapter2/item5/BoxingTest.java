/**
 * @Probject Name: Effective
 * @Path: chapter2.item5BoxingTest.java
 * @Create By k
 * @Create In 2013-9-3 ионГ12:35:34
 * TODO
 */
package chapter2.item5;

/**
 * @Class Name BoxingTest
 * @Author k
 * @Create In 2013-9-3
 */
public class BoxingTest {

	/**
	 * @Methods Name main
	 * @Create In 2013-9-3 By k
	 * @param args void
	 */
	public static void main(String[] args) {
		long start = System.currentTimeMillis();
		Long sum = 0L;
		for(long i = 0;i < Integer.MAX_VALUE;i++){
			sum += i;
		}
		long end = System.currentTimeMillis();
		System.out.println("cost time " + (end - start ) +  "ms "  + sum);
		
		long sum1 = 0l;
		start = System.currentTimeMillis();
		for(long i = 0;i < Integer.MAX_VALUE;i++){
			sum1 += i;
		}
		end = System.currentTimeMillis();
		System.out.println("cost time :" + (end - start ) + "ms" + sum1);
		
	}

}
