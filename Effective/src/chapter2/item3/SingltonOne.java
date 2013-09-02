/**
 * 说明:
 *     单例模式第一种方式
 * @Probject Name: Effective
 * @Path: chapter2.item3SingltonOne.java
 * @Create By k
 * @Create In 2013-8-18 下午11:18:52
 * TODO
 */
package chapter2.item3;

/**
 * @Class Name SingltonOne
 * @Author k 
 * @Create In 2013-8-18
 */
public class SingltonOne {
	
	public static final SingltonOne INSTANCE = new SingltonOne();
	
	private SingltonOne(){
		
	}
	public void leaveTheBuilding() {
		System.out.println("Whoa baby, I'm outta here!");
	}
	public static void main(String[] args)  {
		SingltonOne instance = SingltonOne.INSTANCE;
		instance.leaveTheBuilding();
	}
	
	
	
	
	
	
	
	
	

}
