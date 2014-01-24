/**
 * 
 */
package net.shopin.common;

import java.util.HashSet;

/**
 * @author kongm
 * equals方法陷阱
 */
public class Point {

	private  int x;
	private  int y;
	
	public Point(int x,int y){
		this.x = x;
		this.y = y;
	}

	public int getX() {
		return x;
	}

	public int getY() {
		return y;
	}
	
	
	
	public void setX(int x) {
		this.x = x;
	}

	public void setY(int y) {
		this.y = y;
	}

	/**
	 * 错误1:
	 * 		定义错误的equals方法签名
	 *      是Object equals的一中变化了的重载
	 *      
	 * @param other
	 * @return
	 */
//	public boolean equals(Point other){
//		return (this.getX() == other.getX()) && (this.getY() == other.getY());
//	}
	
	/**
	 * 1.方法签名正确
	 * 3.陷阱3 建立在可变域上的equals定义
	 */
	@Override
	public boolean equals(Object other){
		boolean result = false;
		if(other instanceof Point){
			Point that = (Point) other;
			result = (that.canEqual(this) && this.getX() == that.getX()) && (this.getY() == that.getY());
		}
		return result;
	}
	
	/**
	 *  陷阱2 重载了equals但是没有同时重载hashcode
	 *  如果两个对象根据equals(Object)方法是相等的，
	 *  那么在这两个对象上调用hashCode方法应该产生同样的值
	        在Java中，hashCode和equals需要一起被重定义是众所周知的。
	        此外，hashCode只可以依赖于equals依赖的域来产生值      
	 */
	@Override
	public int hashCode(){
		return (41*(41 + getX()) + getY());
	}
	
	public boolean canEqual(Object other){
		return (other instanceof Point);
	}
	
	
	public static void main(String[] args) {
		//1.错误1的演示
		Point p1 = new Point(1, 2);
		Point p2 = new Point(1, 2);
		Point q = new Point(2,3);
		System.out.println(p1.equals(p2));//true
		System.out.println(p1.equals(q));//false
		//将point放入容器 问题出现
		//hashset 操作的是泛型 调用的是object的equals方法
		HashSet<Point> set = new HashSet<Point>();
		set.add(p1);
		System.out.println(set.contains(p1));
		//问题:当hash依赖于可变化域时 当对象状态改变时会对容器不可见
		p1.setX(22);
		System.out.println(set.contains(p1));
		//问题的症结
		Object p2a = p2;
		System.out.println(set.contains(p2a));
		System.out.println(p1.equals(p2a));//false
		//陷阱4:
		ColoredPoint cp1 = new ColoredPoint(1, 2, Color.RED);
		ColoredPoint cp2 = new ColoredPoint(1, 2, Color.BLUE);
		System.out.println(cp1.equals(cp2));
		Point p3= new Point(1,2);
		System.out.println(p3.equals(cp1));
		System.out.println(cp1.equals(p3));
		//最终版本 引入canequals 方法
		Point pA = new Point(1, 1){
			@Override public int getY(){
				return 2;
			}
		};
		System.out.println(p3.equals(pA));
	}
}
