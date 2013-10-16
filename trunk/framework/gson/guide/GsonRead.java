/**
 * @Probject Name: framework
 * @Path: guideGsonRead.java
 * @Create By kimi
 * @Create In 2013年10月11日 上午12:10:07
 * TODO
 */
package guide;

import java.io.IOException;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.TypeAdapter;
import com.google.gson.stream.JsonReader;
import com.google.gson.stream.JsonToken;
import com.google.gson.stream.JsonWriter;

/**
 * @Class Name GsonRead
 * @Author kimi
 * @Create In 2013年10月11日
 */
public class GsonRead {

	/**
	 * @Methods Name main
	 * @Create In 2013年10月11日 By kimi
	 * @param args void
	 */
	public static void main(String[] args) {
		
		Gson gson = new GsonBuilder().registerTypeAdapter(Goo.class, new TypeAdapter<Goo>() {

			@Override
			public Goo read(JsonReader in) throws IOException {
				if(in.peek() == JsonToken.NULL){
					in.nextNull();
					return null;
				}
				
				return null;
			}

			@Override
			public void write(JsonWriter arg0, Goo arg1) throws IOException {
				// TODO Auto-generated method stub
				
			}
			
		}).create();
		
		
		
		
		
		
		
		
		
		
		
		

	}

}
class Goo{
	
	int x;
	int y;
	Goo(){
		this.x = 0;
		this.y = 0;
	}
	
}
