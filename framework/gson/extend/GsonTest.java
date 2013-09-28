/**
 * @Probject Name: framework
 * @Path: extend.GsonTest.java
 * @Create By kongm
 * @Create In 2013-9-28 下午2:14:27
 * TODO
 */
package extend;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonNull;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.google.gson.JsonPrimitive;
import com.google.gson.JsonSyntaxException;

import base.framework.junit.MoreAsserts;
import junit.framework.TestCase;

/**
 * @Class Name GsonTest
 * @Author kongm
 * @Create In 2013-9-28
 */
public final class GsonTest extends TestCase {

	// 1.JsonNull TestCase
	@SuppressWarnings("deprecation")
	public void testEqualsAndHashcode() {
		MoreAsserts.assertEqualsAndHashCode(new JsonNull(), new JsonNull());
		MoreAsserts.assertEqualsAndHashCode(new JsonNull(), JsonNull.INSTANCE);
		MoreAsserts.assertEqualsAndHashCode(JsonNull.INSTANCE,
				JsonNull.INSTANCE);
	}

	public void testDeepCopy() {
		@SuppressWarnings("deprecation")
		JsonElement e;
		JsonNull a = new JsonNull();
	}

	// unit test for the JsonObject
	public void testAddingAndRemovingObjectProperties() {
		JsonObject jsonObj = new JsonObject();
		String propertyName = "property";
		System.out.println(jsonObj.has(propertyName));// false
		System.out.println(jsonObj.get(propertyName));// null
		JsonPrimitive value = new JsonPrimitive("blah");
		jsonObj.add(propertyName, value);
		System.out.println(jsonObj.get(propertyName));
		System.out.println(jsonObj);
		assertEquals(value, jsonObj.get(propertyName));
		JsonElement element = jsonObj.remove(propertyName);
		System.out.println(element);

	}

	public void testAddingNullPropertyValue() {
		String propertyName = "property";
		JsonObject jsonObj = new JsonObject();
		jsonObj.add(propertyName, null);
		System.out.println(jsonObj.has(propertyName));
		System.out.println(jsonObj);
		JsonElement element = jsonObj.get(propertyName);
		System.out.println(element);
		assertNotNull(element);
		assertTrue(element.isJsonNull());
	}

	public void testAddingNullOrEmptyPropertyName() {
		JsonObject jsonObj = new JsonObject();

		try {
			jsonObj.add(null, JsonNull.INSTANCE);
			// Fails a test with the given message.
			fail("Should not allow null property names.");
		} catch (NullPointerException e) {
		}
		jsonObj.add("", JsonNull.INSTANCE);
		System.out.println(jsonObj);
		jsonObj.add("   \t", JsonNull.INSTANCE);
		System.out.println(jsonObj);
	}

	public void testAddingBooleanProperties() {
		String propertyName = "property";
		JsonObject jsonObj = new JsonObject();
		jsonObj.addProperty(propertyName, true);
		System.out.println(jsonObj);
		System.out.println(jsonObj.has(propertyName));
		JsonElement element = jsonObj.get(propertyName);
		System.out.println(element.getAsBoolean());
	}

	public void testAddingStringProperties() {
		String propertyName = "property";
		String value = "blah";

		JsonObject jsonObj = new JsonObject();
		jsonObj.addProperty(propertyName, value);
		System.out.println(jsonObj);
		System.out.println(jsonObj.has(propertyName));
		assertEquals(value, jsonObj.get(propertyName).getAsString());
	}

	public void testAddingCharacterProperties() {
		String propertyName = "property";
		char value = 'a';

		JsonObject jsonObj = new JsonObject();
		jsonObj.addProperty(propertyName, value);
		assertTrue(jsonObj.has(propertyName));
		System.out.println(jsonObj);
		JsonElement jsonElement = jsonObj.get(propertyName);
		assertNotNull(jsonElement);
		assertEquals(String.valueOf(value), jsonElement.getAsString());
		assertEquals(value, jsonElement.getAsCharacter());
	}

	/**
	 * From bug report http://code.google.com/p/google-gson/issues/detail?id=182
	 */
	public void testPropertyWithQuotes() {
		JsonObject jsonObj = new JsonObject();
		jsonObj.add("a\"b", new JsonPrimitive("c\"d"));
		String json = new Gson().toJson(jsonObj);
		System.out.println(json);
	}

	public void testWritePropertyWithEmptyStringName() {
		JsonObject jsonObj = new JsonObject();
		jsonObj.add("", new JsonPrimitive(true));
		assertEquals("{\"\":true}", new Gson().toJson(jsonObj));
		System.out.println(new Gson().toJson(jsonObj));
	}

	public void testReadPropertyWithEmptyStringName() {
		JsonObject jsonObj = new JsonParser().parse("{\"\":true}")
				.getAsJsonObject();
		System.out.println(jsonObj.get("").getAsBoolean());
		JsonObject jsonObj1 = new JsonParser().parse("{\"success\":true}")
				.getAsJsonObject();
		System.out.println(jsonObj1.get("success").getAsBoolean());

		try {
			JsonObject jsonObj2 = new JsonParser().parse(
					"sss{\"success\":true}}").getAsJsonObject();
		} catch (JsonSyntaxException e) {
		}
	}

	public void testEqualsOnEmptyObject() {
		MoreAsserts.assertEqualsAndHashCode(new JsonObject(), new JsonObject());
		MoreAsserts.assertEqualsAndHashCode(new Integer(1), new Integer(1));
	}

	public void testEqualsNonEmptyObject() {
		JsonObject a = new JsonObject();
		JsonObject b = new JsonObject();
		assertEquals(a, a);
		a.add("foo", new JsonObject());
		assertFalse(a.equals(b));
		assertFalse(b.equals(a));
		b.add("foo", new JsonObject());
		MoreAsserts.assertEqualsAndHashCode(a, b);
		a.add("bar", new JsonObject());
		System.out.println(a);
	}

	public void testDeepCopy1() {
		JsonObject original = new JsonObject();
		JsonArray firstEntry = new JsonArray();
		original.add("key", firstEntry);
		System.out.println(original);
	}

	// unit test for jsonprimitive
	public void testBoolean() {
		JsonPrimitive primitive = new JsonPrimitive(Boolean.TRUE);
		assertTrue(primitive.isBoolean());
		System.out.println(primitive.getAsBoolean());
		// Extra support for booleans
		primitive = new JsonPrimitive(1);
		System.out.println(primitive.isBoolean());
		// string true
		primitive = new JsonPrimitive("true");
		System.out.println(primitive.getAsBoolean());
		primitive = new JsonPrimitive("TrUe");
		System.out.println(primitive.getAsBoolean());

	}

	public void testParsingStringAsBoolean() {
		JsonPrimitive primitive = new JsonPrimitive("tRUE");
		System.out.println(primitive.isBoolean());
		System.out.println(primitive.getAsBoolean());
	}

	public void testParsingStringAsNumber() {
		JsonPrimitive json = new JsonPrimitive("1");
		System.out.println(json.isNumber());
		System.out.println(json.getAsDouble());
		assertEquals(1D, json.getAsDouble(), 0.00001);
		assertEquals(1F, json.getAsFloat(), 0.00001);
		assertEquals(1, json.getAsInt());
		assertEquals(1L, json.getAsLong());
		System.out.println(json.getAsDouble());

	}

	public void testStringsAndChar() {
		JsonPrimitive json = new JsonPrimitive("abc");
		assertTrue(json.isString());
		System.out.println(json);
		assertEquals('a', json.getAsCharacter());
		assertEquals("abc", json.getAsString());
	}

	public void testByteEqualsShort() {
		JsonPrimitive p1 = new JsonPrimitive(new Byte((byte) 10));
		JsonPrimitive p2 = new JsonPrimitive(new Short((short) 10));
		assertEquals(p1, p2);
		assertEquals(p1.hashCode(), p2.hashCode());

	}

	public void testValidJsonOnToString() throws Exception {
		JsonPrimitive json = new JsonPrimitive("Some\nEscaped\nValue");
		System.out.println(json);

	}

	public void testEquals() {
		MoreAsserts.assertEqualsAndHashCode(new JsonPrimitive("A"),
				new JsonPrimitive("A"));
		MoreAsserts.assertEqualsAndHashCode(new JsonPrimitive(true),
				new JsonPrimitive(true));
		MoreAsserts.assertEqualsAndHashCode(new JsonPrimitive(5L),
				new JsonPrimitive(5L));
		MoreAsserts.assertEqualsAndHashCode(new JsonPrimitive('a'),
				new JsonPrimitive('a'));
		MoreAsserts.assertEqualsAndHashCode(new JsonPrimitive(Float.NaN),
				new JsonPrimitive(Float.NaN));
		MoreAsserts.assertEqualsAndHashCode(new JsonPrimitive(
				Float.NEGATIVE_INFINITY), new JsonPrimitive(
				Float.NEGATIVE_INFINITY));
		MoreAsserts.assertEqualsAndHashCode(new JsonPrimitive(
				Float.POSITIVE_INFINITY), new JsonPrimitive(
				Float.POSITIVE_INFINITY));
		MoreAsserts.assertEqualsAndHashCode(new JsonPrimitive(Double.NaN),
				new JsonPrimitive(Double.NaN));
		MoreAsserts.assertEqualsAndHashCode(new JsonPrimitive(
				Double.NEGATIVE_INFINITY), new JsonPrimitive(
				Double.NEGATIVE_INFINITY));
		MoreAsserts.assertEqualsAndHashCode(new JsonPrimitive(
				Double.POSITIVE_INFINITY), new JsonPrimitive(
				Double.POSITIVE_INFINITY));
		assertFalse(new JsonPrimitive("a").equals(new JsonPrimitive("b")));
		assertFalse(new JsonPrimitive(true).equals(new JsonPrimitive(false)));
		assertFalse(new JsonPrimitive(0).equals(new JsonPrimitive(1)));
	}

	// unit case for jsonarray
	public void testEqualsOnEmptyArray() {
		MoreAsserts.assertEqualsAndHashCode(new JsonArray(), new JsonArray());
	}

}
