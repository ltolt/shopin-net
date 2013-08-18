/**
 * ËµÃ÷:
 *     
 * @Probject Name: Effective
 * @Path: chapter2.item3SingletonThree.java
 * @Create By k
 * @Create In 2013-8-18 ÏÂÎç11:38:14
 * TODO
 */
package chapter2.item3;

/**
 * @Class Name SingletonThree
 * @Author k
 * @Create In 2013-8-18
 */
public class SingletonThree {

	
	
	private SingletonThree() {
	}
	public static final SingletonThree INSTANCE = new SingletonThree(); 
	
	
	public void leaveTheBuilding() {
		System.out.println("Whoa baby, I'm outta here!");
	}

	private Object readResolve(){
		//return the one true Singlton and let the garbage collector 
		// take care of the singleton impersonator
		return INSTANCE;
	}
	
	/**
	 * @Methods Name main
	 * @Create In 2013-8-18 By k
	 * @param args void
	 */
	public static void main(String[] args) {
		SingletonThree instance = SingletonThree.INSTANCE;
		instance.leaveTheBuilding();
	}

}
