/**
 * 说明:
 *     具体产品角色
 * @Probject Name: design-pattern
 * @Path: product.concrete.SealOne.java
 * @Create By kongm
 * @Create In 2013-8-13 上午11:28:44
 * TODO
 */
package product.concrete;

import java.awt.BasicStroke;
import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics2D;
import java.awt.Image;
import java.awt.geom.Ellipse2D;
import java.awt.geom.Rectangle2D;
import java.awt.image.BufferedImage;

import product.Seal;

/**
 * @Class Name SealOne
 * @Author kongm
 * @Create In 2013-8-13
 */
public class SealOne implements Seal {
	
	BufferedImage image;
	Graphics2D g;
	
	
	

	public SealOne() {
		image = new BufferedImage(100,100, BufferedImage.TYPE_INT_RGB);
		g = image.createGraphics();
		g.setColor(Color.white);
		Rectangle2D rect = new Rectangle2D.Double(0,0,100,100);
		g.fill(rect);
		g.setColor(Color.red);
		BasicStroke bs = new BasicStroke(3f, BasicStroke.CAP_SQUARE, BasicStroke.JOIN_ROUND);
		Ellipse2D ellipse = new Ellipse2D.Double(5,6,80,80);
		g.setStroke(bs);
		g.draw(ellipse);
		g.setFont(new Font("宋体",Font.BOLD,14));
		g.drawString("中国银行", 16, 50);
	}




	/* (non-Javadoc)
	 * @see product.Seal#getImage()
	 */
	@Override
	public Image getImage() {
		// TODO Auto-generated method stub
		return image;
	}

}
