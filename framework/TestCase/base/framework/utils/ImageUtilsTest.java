/**
 * @Probject Name: framework
 * @Path: base.framework.utils.ImageUtilsTest.java
 * @Create By kongm
 * @Create In 2013-7-11 ÏÂÎç5:59:54
 * TODO
 */
package base.framework.utils;

import java.awt.Image;
import java.io.File;
import java.io.IOException;

import javax.imageio.ImageIO;

/**
 * @Class Name ImageUtilsTest
 * @Author kongm
 * @Create In 2013-7-11
 */
public class ImageUtilsTest {

	/**
	 * @Methods Name main
	 * @Create In 2013-7-11 By kongm
	 * @param args void
	 */
	public static void main(String[] args) {
		
//		ImageUtils.pressImage("F:\\testImageUtils.jpg", "/56617ST3B200_1000x500.jpg", 0, 0, 0);
		File file = new File("F:\\56617ST3B200_1000x500.jpg");
		try {
			System.out.println(file.canRead());
			Image img = ImageIO.read(file);
			
			ImageUtils.pressImage("F:\\images.jpg","F:\\56617ST3B200_1000x500.jpg", 0, 0, 0);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
				
		

	}

}
