/**
 * @Probject Name: design-pattern
 * @Path: productCowboyTrousers.java
 * @Create By k
 * @Create In 2013-8-6 ����12:06:58
 * TODO
 */
package product;

/**
 * @Class Name CowboyTrousers
 * @Author k
 * @Create In 2013-8-6
 */
public class CowboyTrousers extends Trousers {
	private int waistSize;
	   private int height;
	   private String name;
	   CowboyTrousers(String name,int waistSize,int height){
	       this.name=name;
	       this.waistSize=waistSize;
	       this.height=height;
	   }
	    public int getWaistSize(){
	       return waistSize;
	   }
	   public int getHeight(){
	       return height;
	   }
	   public String getName(){
	       return name;
	   } 

}
