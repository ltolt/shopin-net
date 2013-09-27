/**
 * @Probject Name: framework
 * @Path: extend.SourceRead.java
 * @Create By kongm
 * @Create In 2013-9-27 上午11:11:24
 * TODO
 */
package extend;

import com.google.gson.JsonNull;
import com.google.gson.JsonPrimitive;

/**
 * {@code gson source code read }}
 * @Class Name SourceRead
 * @Author kongm
 * @Create In 2013-9-27
 */
public class SourceRead {

	/**
	 * @Methods Name main
	 * @Create In 2013-9-27 By kongm
	 * @param args void
	 */
	public static void main(String[] args) {
		//1.All instances of JsonNull have the same hash code since they are indistinguishable
		System.out.println(JsonNull.class.hashCode());
		System.out.println(JsonNull.class.hashCode());
   		/**2.
		   * All instances of JsonNull are the same
		   */
		JsonNull jn1 = JsonNull.INSTANCE;
		JsonNull jn2 = JsonNull.INSTANCE;
		System.out.println(jn1);
		System.out.println(jn1 == jn2);
		
		JsonPrimitive jp = new JsonPrimitive(false);
		//3 Boolean parseBoolean 
		boolean bool = Boolean.parseBoolean("yes");
		System.out.println(bool);
		bool = Boolean.parseBoolean("TRUE");
		System.out.println(bool);
		
	}

}
