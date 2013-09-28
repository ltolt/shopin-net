/**
 * @Probject Name: framework
 * @Path: base.framework.junit.MoreAsserts.java
 * @Create By kongm
 * @Create In 2013-9-28 下午2:09:37
 * TODO
 */
package base.framework.junit;
import junit.framework.Assert;
/**
 * @Class Name MoreAsserts
 * @Author kongm
 * @Create In 2013-9-28
 */
/**
 * Handy asserts that we wish were present in {@link Assert} so that we didn't
 * have to write them.
 * 
 * @author Inderjeet Singh
 */
public class MoreAsserts extends Assert {

	public static void assertEquals(int[] expected, int[] target) {
		if (expected == null) {
			assertNull(target);
		}
		assertEquals(expected.length, target.length);
		for (int i = 0; i < expected.length; ++i) {
			assertEquals(expected[i], target[i]);
		}
	}
	
	public static void assertEqualsAndHashCode(Object a, Object b){
		assertTrue(a.equals(b));
		assertTrue(b.equals(a));
		assertEquals(a.hashCode(), b.hashCode());
		assertFalse(a.equals(null));
		assertFalse(a.equals(new Object()));
	}
}
