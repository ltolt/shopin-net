/**
 * @Probject Name: framework
 * @Path: guide.GsonTest.java
 * @Create By kongm
 * @Create In 2013-9-10 下午8:32:28
 * TODO
 */
package guide;

import java.util.List;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

/**
 * @Class Name GsonTest
 * @Author kongm
 * @Create In 2013-9-10
 */
public class GsonTest {

	static class Bar{
		private int name;

		public int getName() {
			return name;
		}

		public void setName(int name) {
			this.name = name;
		}

		public Bar() {
		}

		@Override
		public String toString() {
			return String.format("Bar [name=%s]", name);
		}
		
		
	}
	
	/**
	 * @Methods Name main
	 * @Create In 2013-9-10 By kongm
	 * @param args void
	 */
	public static void main(String[] args) {
		String json = "{success:true,value:\"1\",'name':'ste',list:[{name:\"kong\"},{name:\"ming\"}]}";
		JsonParser parser = new JsonParser();
		JsonObject obj =  parser.parse(json).getAsJsonObject();
		Gson gson = new GsonBuilder().create();
		String i = gson.fromJson(obj.getAsJsonPrimitive("value"), String.class);
		System.out.println(i);
		boolean flag = gson.fromJson(obj.getAsJsonPrimitive("success"), Boolean.class);
		System.out.println(flag);
		if(flag)
			System.out.println("flag = true");
		else
			System.out.println("flag = false");
		List<Bar> list = gson.fromJson(obj.getAsJsonArray("list"),List.class);
		System.out.println(list);
		
	}

}
