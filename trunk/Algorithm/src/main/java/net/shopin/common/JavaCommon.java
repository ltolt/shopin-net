/**
 * @Probject Name: Algorithm
 * @Path: net.shopin.common.JavaCommon.java
 * @Create By kongm
 * @Create In 2013-12-26 下午8:17:13
 * TODO
 */
package net.shopin.common;

import java.awt.Container;
import java.awt.Dimension;
import java.awt.Graphics2D;
import java.awt.Image;
import java.awt.MediaTracker;
import java.awt.Rectangle;
import java.awt.RenderingHints;
import java.awt.Robot;
import java.awt.Toolkit;
import java.awt.image.BufferedImage;
import java.io.BufferedOutputStream;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.FileWriter;
import java.io.IOException;
import java.io.OutputStream;
import java.nio.channels.FileChannel;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.imageio.ImageIO;

import com.lowagie.text.Document;
import com.lowagie.text.DocumentException;
import com.lowagie.text.Paragraph;
import com.lowagie.text.pdf.PdfWriter;
import com.sun.image.codec.jpeg.JPEGCodec;
import com.sun.image.codec.jpeg.JPEGEncodeParam;
import com.sun.image.codec.jpeg.JPEGImageEncoder;

/**
 *  java常用代码
 * @Class Name JavaCommon
 * @Author kongm
 * @Create In 2013-12-26
 */
public class JavaCommon {

	/**
	 * @Methods Name main
	 * @Create In 2013-12-26 By kongm
	 * @param args void
	 * @throws IOException 
	 */
	public static void main(String[] args)  {
		//1. 字符串与整型的相互转换
		String a = String.valueOf(2);//
		int i = Integer.parseInt(a);//
		//2.向文件末尾添加内容
		BufferedWriter out = null;
		try {
			out = new BufferedWriter(new FileWriter("test.txt",true));
			out.write("bbb");
			out.flush();
		} catch (IOException e) {
			e.printStackTrace();
		}finally{
			if(out!=null){
				try {
					out.close();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
		
		//3.得到当前方法的名字
		String methodName = Thread.currentThread().getStackTrace()[1].getMethodName();
		System.out.println(methodName);
		
		//4. 转字符串到日期
//		try {
//			Date date = DateFormat.getDateInstance().parse("20131226");
//			System.out.println(date);
//		} catch (ParseException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
		SimpleDateFormat format = new SimpleDateFormat( "dd.MM.yyyy" );  
		try {
			Date date = format.parse( "26.12.2013" );
			System.out.println(date);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
		//6.把java util.Date 转换成 sql.Date
		java.util.Date utilDate = new java.util.Date();
		java.sql.Date sqlDate = new java.sql.Date(utilDate.getTime());
		System.out.println(utilDate + "===" + sqlDate);
		//7.nio快速文件拷贝的使用
		try {
			
			fileCopy(new File("test.txt"), new File("ttt.txt"));
			
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		//8.缩略图的生成
		try {
			createThumbnail("C:\\Users\\Administrator\\Pictures\\1.jpg", 300, 300,100, "suolve1.jpg");
		} catch (InterruptedException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		//9.使用iText jar 生成pdf
		try {
			OutputStream file = new FileOutputStream(new File("test.pdf"));
			Document document = new Document();
			PdfWriter.getInstance(document, file);
			document.add(new Paragraph("hello pdf"));
			document.add(new Paragraph(new Date().toString()));
			document.close();
			file.close();
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (DocumentException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		//9.抓屏实现
		try {
			captureScreen("screen.png");
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
	}
	
	/**
	 * 7.nio快速拷贝
	 * @Methods Name fileCopy
	 * @Create In 2013-12-30 By kongm
	 * @param in
	 * @param out
	 * @throws IOException void
	 */
	public static void fileCopy(File in , File out) throws IOException{
		FileChannel inChannel = new FileInputStream(in).getChannel();
		FileChannel outChannel = new FileOutputStream(out).getChannel();
		try {
			// magic number for Windows, 64Mb - 32Kb)  
			int maxCount = (64*1024*1024) - (32*1024);
			long size = inChannel.size();
			long position = 0;
			while(position < size){
				position += inChannel.transferTo(position, maxCount, outChannel);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			if(inChannel != null){
				inChannel.close();
			}
			if(outChannel != null){
				outChannel.close();
			}
		}
	}
	
	/**
	 *         8.创建图片的缩略图
	 * @Methods Name createThumbnail
	 * @Create In 2013-12-30 By kongm
	 * @param fileName
	 * @param thumbWidth
	 * @param thumbHeight
	 * @param quality
	 * @param outFilename void
	 * @throws InterruptedException 
	 * @throws IOException 
	 */
	public static void createThumbnail(String fileName,int thumbWidth,int thumbHeight, int quality,String outFilename) throws InterruptedException, IOException{
		//load image from filename
		Image image = Toolkit.getDefaultToolkit().getImage(fileName);
        MediaTracker mediaTracker = new MediaTracker(new Container());  
        mediaTracker.addImage(image, 0);  
        mediaTracker.waitForID(0);  
        // use this to test for errors at this point: System.out.println(mediaTracker.isErrorAny());  
     // determine thumbnail size from WIDTH and HEIGHT  
        double thumbRatio = (double)thumbWidth / (double)thumbHeight;  
        int imageWidth = image.getWidth(null);  
        int imageHeight = image.getHeight(null);  
        double imageRatio = (double)imageWidth / (double)imageHeight;  
        if (thumbRatio < imageRatio) {  
            thumbHeight = (int)(thumbWidth / imageRatio);  
        } else {  
            thumbWidth = (int)(thumbHeight * imageRatio);  
        }  
  
        // draw original image to thumbnail image object and  
        // scale it to the new size on-the-fly  
        BufferedImage thumbImage = new BufferedImage(thumbWidth, thumbHeight, BufferedImage.TYPE_INT_RGB);  
        Graphics2D graphics2D = thumbImage.createGraphics();  
        graphics2D.setRenderingHint(RenderingHints.KEY_INTERPOLATION, RenderingHints.VALUE_INTERPOLATION_BILINEAR);  
        graphics2D.drawImage(image, 0, 0, thumbWidth, thumbHeight, null);  
  
        // save thumbnail image to outFilename  
        BufferedOutputStream out = new BufferedOutputStream(new FileOutputStream(outFilename));  
        JPEGImageEncoder encoder = JPEGCodec.createJPEGEncoder(out);  
        JPEGEncodeParam param = encoder.getDefaultJPEGEncodeParam(thumbImage);  
        quality = Math.max(0, Math.min(quality, 100));  
        param.setQuality((float)quality / 100.0f, false);  
        encoder.setJPEGEncodeParam(param);  
        encoder.encode(thumbImage);  
        out.close();  
	}
	
	/**
	 * 9.抓屏程序
	 */
	public static void captureScreen(String filename) throws Exception{
		Dimension screenSize = Toolkit.getDefaultToolkit().getScreenSize();
		Rectangle screenRectangle = new Rectangle(screenSize);
		Robot robot = new Robot();
		BufferedImage image = robot.createScreenCapture(screenRectangle);
		ImageIO.write(image, "png", new File(filename));  
	}

	
	
	
}
