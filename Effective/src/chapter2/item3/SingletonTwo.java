/**
 * @Probject Name: Effective
 * @Path: chapter2.item3SingletonTwo.java
 * @Create By k
 * @Create In 2013-8-18 ÏÂÎç11:33:43
 * TODO
 */
package chapter2.item3;

/**
 * @Class Name SingletonTwo
 * @Author k
 * @Create In 2013-8-18
 */
public class SingletonTwo {
	
	

	private SingletonTwo() {
	}
	
	private static final SingletonTwo INSTANCE = new SingletonTwo();
	
	public static SingletonTwo getInstance(){
		return INSTANCE;
	}

	
	public void leaveTheBuilding() {
		System.out.println("Whoa baby, I'm outta here!");
	}

	/**
	 * @Methods Name main
	 * @Create In 2013-8-18 By k
	 * @param args void
	 */
	public static void main(String[] args) {
		SingletonTwo instance = SingletonTwo.getInstance();
		instance.leaveTheBuilding();
	}

}
