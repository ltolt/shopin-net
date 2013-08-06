/**
 * @Desc  具体产品
 * @Probject Name: design-pattern
 * @Path: productWesternUpperClothes.java
 * @Create By k
 * @Create In 2013-8-6 上午12:05:59
 * TODO
 */
package product;

/**
 * @Class Name WesternUpperClothes
 * @Author k
 * @Create In 2013-8-6
 */
public class WesternUpperClothes extends UpperClothes {

	 private int chestSize;
	   private int height;
	   private String name;
	   public  WesternUpperClothes(String name,int chestSize,int height){
	       this.name=name;
	       this.chestSize=chestSize;
	       this.height=height;
	   }
	   public int getChestSize(){
	       return chestSize;
	   }
	   public int getHeight(){
	       return height;
	   }
	   public String getName(){
	       return name;
	   } 

}
