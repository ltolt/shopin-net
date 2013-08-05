/**
 * @Desc 具体产品角色
 * @Probject Name: design-pattern
 * @Path: productCowboyUpperClothes.java
 * @Create By k
 * @Create In 2013-8-6 上午12:04:31
 * TODO
 */
package product;

/**
 * @Class Name CowboyUpperClothes
 * @Author k
 * @Create In 2013-8-6
 */
public class CowboyUpperClothes extends UpperClothes {

	   private int chestSize;
	   private int height;
	   private String name;
	   CowboyUpperClothes(String name,int chestSize,int height){
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
