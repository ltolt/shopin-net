/**
 * @Probject Name: design-pattern
 * @Path: productWesternTrousers.java
 * @Create By k
 * @Create In 2013-8-6 ÉÏÎç12:07:29
 * TODO
 */
package product;

/**
 * @Class Name WesternTrousers
 * @Author k
 * @Create In 2013-8-6
 */
public class WesternTrousers extends Trousers{
	   private int waistSize;
	   private int height;
	   private String name;
	   WesternTrousers(String name,int waistSize,int height){
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
