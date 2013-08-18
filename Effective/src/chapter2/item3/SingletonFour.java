/**
 * @Probject Name: Effective
 * @Path: chapter2.item3SingletonFour.java
 * @Create By k
 * @Create In 2013-8-18 обнГ11:42:42
 * TODO
 */
package chapter2.item3;

/**
 * @Class Name SingletonFour
 * @Author k
 * @Create In 2013-8-18
 */
public enum SingletonFour {
	INSTANCE;
	
	public void leaveTheBuilding() {
		System.out.println("Whoa baby, I'm outta here!");
	}
	
	public static void main(String[] args) {
		SingletonFour instance = SingletonFour.INSTANCE;
		instance.leaveTheBuilding();
	}
	

}
