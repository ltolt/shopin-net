/**
 * @Desc JavaBeans Pattern 
 * @Probject Name: Effective
 * @Path: chapter2.item2.javabeansNutritionFacts.java
 * @Create By k
 * @Create In 2013-8-6 ÏÂÎç11:54:13
 * TODO
 */
package chapter2.item2.javabeans;

/**
 * @Class Name NutritionFacts
 * @Author k
 * @Create In 2013-8-6
 */
public class NutritionFacts {
	// Parameters initialized to default values (if any)
	private int servingSize = -1; // Required; no default value
	private int servings = -1; // "     " "      "
	private int calories = 0;
	private int fat = 0;
	private int sodium = 0;
	private int carbohydrate = 0;

	public NutritionFacts() {
	}

	// Setters
	public void setServingSize(int val) {
		servingSize = val;
	}

	public void setServings(int val) {
		servings = val;
	}

	public void setCalories(int val) {
		calories = val;
	}

	public void setFat(int val) {
		fat = val;
	}

	public void setSodium(int val) {
		sodium = val;
	}

	public void setCarbohydrate(int val) {
		carbohydrate = val;
	}

	public static void main(String[] args) {
		NutritionFacts cocaCola = new NutritionFacts();
		cocaCola.setServingSize(240);
		cocaCola.setServings(8);
		cocaCola.setCalories(100);
		cocaCola.setSodium(35);
		cocaCola.setCarbohydrate(27);
	}

}
