/**
 * @Probject Name: Algorithm
 * @Path: net.shopin.interviewTestStackOverFlow.java
 * @Create By kongm
 * @Create In 2014-1-17 上午11:01:58
 * TODO
 */
package net.shopin.interview;

/**
 * @Class Name TestStackOverFlow
 * @Author kongm
 * @Create In 2014-1-17
 */
public class TestStackOverFlow {

	/**
	 * 测试java stack 溢出 
	 * @Methods Name main
	 * @Create In 2014-1-17 By kongm
	 * @param args void
	 */
	public static void main(String[] args) {
		Recur r = new Recur();
		r.doit(1000);
	}

}
class Recur{
	
	public int doit(int v){
		if(v == 1){
			return 1;
		}else{
			return doit(v - 1) + doit(v - 2);
		}
	}
	
}