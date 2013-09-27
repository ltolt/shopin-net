/**
 * @Probject Name: framework
 * @Path: extend.CommentsTest.java
 * @Create By kongm
 * @Create In 2013-9-16 下午5:28:32
 * TODO
 */
package extend;

import java.util.Arrays;
import java.util.List;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;

import junit.framework.TestCase;

/**
 * @Class Name CommentsTest
 * @Author kongm
 * @Create In 2013-9-16
 */
public final class CommentsTest extends TestCase {
	
	public void testParseComments(){
		 String json = "[\n"
			        + "  // this is a comment\n"
			        + "  \"a\",\n"
			        + "  /* this is another comment */\n"
			        + "  \"b\",\n"
			        + "  # this is yet another comment\n"
			        + "  \"c\"\n"
			        + "]";
		 System.out.println(json);
/*		 [
		  // this is a comment
		  "a",
		   this is another comment 
		  "b",
		  # this is yet another comment
		  "c"
		]
*/
		 List<String> abc = new Gson().fromJson(json,  new TypeToken<List<String>>() {}.getType());	
		 assertEquals(Arrays.asList("a","b","c"),abc );
		 System.out.println(abc);
	}
	

}
