/**
 * @Probject Name: framework
 * @Path: undJsonParserTest.java
 * @Create By kimi
 * @Create In 2013年9月15日 下午10:05:50
 * TODO
 */
package und;

import com.google.gson.JsonElement;
import com.google.gson.JsonParser;
import com.google.gson.JsonSyntaxException;

import junit.framework.TestCase;

/**
 * @Class Name JsonParserTest
 * @Author kimi
 * @Create In 2013年9月15日
 */
public class JsonParserTest extends TestCase {

	private JsonParser jsonParser;

	@Override
	protected void setUp() throws Exception {
		super.setUp();
		jsonParser = new JsonParser();
	}

	public void testParseInvalidJson() {
		try {
			jsonParser.parse("[[]");
			// fail();
		} catch (JsonSyntaxException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public void testParseUnquotedStringArrayFails() {
		JsonElement element = jsonParser.parse("[a,b,c]");
		assertEquals("a", element.getAsJsonArray().get(0).getAsString());
		assertEquals("b", element.getAsJsonArray().get(1).getAsString());
		assertEquals("c", element.getAsJsonArray().get(2).getAsString());
		assertEquals(3, element.getAsJsonArray().size());
	}

	public void testParseString() {
		String json = "{a:10,b:'c'}";
		JsonElement e = jsonParser.parse(json);
		assertTrue(e.isJsonObject());
		// assertTrue(e.isJsonArray());
		assertEquals(10, e.getAsJsonObject().get("a").getAsInt());
		assertEquals("c", e.getAsJsonObject().get("b").getAsString());
	}

	public void testParseEmptyString() {
		JsonElement e = jsonParser.parse("\"   \"");
		assertTrue(e.isJsonPrimitive());
		assertEquals("   ", e.getAsString());
	}
	
	
	public void testParseEmptyWhitespaceInput() {
	    JsonElement e = jsonParser.parse("     ");
	    assertTrue(e.isJsonNull());
	  }

}
