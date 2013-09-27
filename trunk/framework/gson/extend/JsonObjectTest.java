/**
 * @Probject Name: framework
 * @Path: extend.JsonObjectTest.java
 * @Create By kongm
 * @Create In 2013-9-16 下午5:48:25
 * TODO
 */
package extend;

import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonPrimitive;

import junit.framework.TestCase;

/**
 * @Class Name JsonObjectTest
 * @Author kongm
 * @Create In 2013-9-16
 */
public class JsonObjectTest extends TestCase {

	public void testAddingAndRemovingObjectProperties(){
		JsonObject json = new JsonObject();
		String propertyName = "property";
		System.out.println(json.has(propertyName));
		System.out.println(json.get(propertyName));
		JsonPrimitive primitive  = new JsonPrimitive("blah");
		json.add(propertyName, primitive);
		System.out.println(json.get(propertyName));
		JsonElement element  = json.remove(propertyName);
		assertEquals(primitive, element);
	}
	
	
	
}
