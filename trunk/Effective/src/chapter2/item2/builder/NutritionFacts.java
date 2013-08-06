/**
 * @Desc  builder模式--构建器模式
 * @Probject Name: Effective
 * @Path: chapter2.item2.builderNutritionFacts.java
 * @Create By k
 * @Create In 2013-8-6 下午10:59:18
 * TODO
 */
package chapter2.item2.builder;

/**
 * @Class Name Nutr2itionFacts
 * @Author k
 * @Create In 2013-8-6
 */
public class NutritionFacts {

	private final int servingSize;
	private final int servings;
	private final int calories;
	private final int fat;
	private final int sodium;
	private final int carbohydrate;

	public static class Builder {
		// required param
		private final int servingSize;
		private final int servings;
		// Optional parameters - initialized to default values
		private int calories = 0;
		private int fat = 0;
		private int carbohydrate = 0;
		private int sodium = 0;
		public Builder(int servingSize, int servings){
			this.servingSize = servingSize;
			this.servings = servings;
		}
		public Builder calories(int val){
			calories = val;
			return this;
		}
		public Builder fat(int val) {
			fat = val;
			return this;
		}

		public Builder carbohydrate(int val) {
			carbohydrate = val;
			return this;
		}

		public Builder sodium(int val) {
			sodium = val;
			return this;
		}
		public NutritionFacts build(){
			return new NutritionFacts(this);
		}
	}
	
	private NutritionFacts(Builder builder){
		servingSize = builder.servingSize;
		servings = builder.servings;
		calories = builder.calories;
		fat = builder.fat;
		sodium = builder.sodium;
		carbohydrate = builder.carbohydrate;
	}

	
	
	public static void main(String[] args) {
		NutritionFacts n = new NutritionFacts.Builder(240,8)
							.calories(100).sodium(35).carbohydrate(27).build();
		System.out.println(n);
		StringBuilder builder = new StringBuilder();
		
	}



	@Override
	public String toString() {
		return String
				.format("NutritionFacts :{servingSize:'%s', servings:'%s', calories:'%s', fat:'%s', sodium:'%s', carbohydrate:'%s}",
						servingSize, servings, calories, fat, sodium,
						carbohydrate);
	}
	
	
	
}
