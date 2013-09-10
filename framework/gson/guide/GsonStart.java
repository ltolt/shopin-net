/**
 * @Probject Name: framework
 * @Path: guide.GsonStart.java
 * @Create By kongm
 * @Create In 2013-9-10 上午11:57:33
 * TODO
 */
package guide;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;

import javax.swing.event.RowSorterEvent.Type;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonParser;
import com.google.gson.reflect.TypeToken;

/**
 * @Class Name GsonStart
 * @Author kongm
 * @Create In 2013-9-10
 */
public class GsonStart {

	static class Event{
		private String name;
		private String source;
		private Event(String name,String source){
			this.name = name;
			this.source = source;
		}
		@Override
		public String toString() {
			return String.format("Event [name=%s, source=%s]", name, source);
		}
		
	}
	
	
	/**
	 * @Methods Name main
	 * @Create In 2013-9-10 By kongm
	 * @param args void
	 */
	@SuppressWarnings({ "unchecked", "rawtypes" })
	public static void main(String[] args) {
		String json;
		//------------------------primitives Examples
		//------------serialization
		Gson gson = new Gson();
		json = gson.toJson(1);//prints 1
		System.out.println(json);
		json = gson.toJson("abcd");
		System.out.println(json);
		json = gson.toJson(new Long(10));
		System.out.println(json);
		int[] values = { 1 };
		gson.toJson(values);
		System.out.println(json);
		//--------------------deserialization
		int one = gson.fromJson("1", int.class);
		System.out.println(one);
		Integer one1 = gson.fromJson("1", Integer.class);
		System.out.println(one1);
		Boolean f = gson.fromJson("false", Boolean.class);
		System.out.println(f);
		String str = gson.fromJson("\"abc\"", String.class);
		System.out.println(str);
		//-----------------object examples
		BagOfPrimitive obj = new BagOfPrimitive();
		json = gson.toJson(obj);
		System.out.println(json);//--{"value1":1,"value2":"abc"}
		BagOfPrimitive obj2 = new BagOfPrimitive();
		obj2 = gson.fromJson(json, BagOfPrimitive.class);
		System.out.println(obj2);
		//-------------array examples
		int[] ints = {1, 2, 3, 4, 5};
		json = gson.toJson(ints);
		System.out.println(json);
		String[] strings = {"abc", "def", "ghi"};
		json = gson.toJson(strings);
		System.out.println(json);
		//---------deserialization
		int[] ints2 = gson.fromJson("[1,2,3,4,5]", int[].class);
		System.out.println(ints2);
		
		//-------------collections Examples
		
		
		//--------generic type
		Foo<BagOfPrimitive> foo = new Foo<BagOfPrimitive>();
		json = gson.toJson(foo);//may not serialize foo.value correctly
		System.out.println(json);
		
		//------------complex
		//-----------rawcollections example
		Collection collection = new ArrayList();
		collection.add("hello");
		collection.add(1);
		collection.add(new Event("greetings","guest"));
		json = gson.toJson(collection);
		System.out.println(json);
		//-----deserialize
		JsonParser parser = new JsonParser();
		JsonArray array = parser.parse(json).getAsJsonArray();
		String message = gson.fromJson(array.get(0), String.class);
		int number = gson.fromJson(array.get(1), int.class);
		Event event = gson.fromJson(array.get(2), Event.class);
		System.out.printf("Using Gson.fromJson() to get: %s, %d, %s", message, number, event);
		
	}

}
//class Event{
//	  private String name;
//	  private String source;
//	  Event(String name, String source) {
//	    this.name = name;
//	    this.source = source;
//	  }
//}

//----------------generic 
class Foo<T>{
	T value;
}

//--------------------object examples
class BagOfPrimitive{
	private int value1= 1;
	private String value2 = "abc";
	private transient int value3 = 3;
	public BagOfPrimitive() {
		//no-args constructor
		// TODO Auto-generated constructor stub
	}
	
			
}

