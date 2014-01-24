/**
 * 
 */
package net.shopin.common;

/**
 * @author Administrator
 *
 */
public class ColoredPoint extends Point {

	private final Color color;
	
	
	public ColoredPoint(int x, int y , Color color) {
		super(x, y);
		this.color = color;
	}


	@Override
	public boolean equals(Object other) {
		boolean result = false;
		if(other instanceof ColoredPoint){
			ColoredPoint that = (ColoredPoint) other;
			result = (that.canEqual(this)&& this.color.equals(that.color)&&super.equals(that));
		}
		return result;
	}
	
	
	
	@Override
	public boolean canEqual(Object other) {
		// TODO Auto-generated method stub
		return (other instanceof ColoredPoint);
	}


	public static void main(String[] args) {
		//陷阱4:
		ColoredPoint cp1 = new ColoredPoint(1, 2, Color.RED);
		ColoredPoint cp2 = new ColoredPoint(1, 2, Color.BLUE);
		System.out.println(cp1.equals(cp2));

	}
	

}
