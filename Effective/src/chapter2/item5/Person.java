/**
 * @Probject Name: Effective
 * @Path: chapter2.item5.Person.java
 * @Create By kongm
 * @Create In 2013-8-20 下午1:57:51
 * TODO
 */
package chapter2.item5;

import java.util.Calendar;
import java.util.Date;
import java.util.TimeZone;

/**
 * @Class Name Person
 * @Author kongm
 * @Create In 2013-8-20
 */
public class Person {
	
	private final Date birthDate;
	
	
	



	public Person(Date birthDate) {
		super();
		this.birthDate = birthDate;
	}





	//反面例子,代码每次都会新建Calender 和 DAte对象
	//这些是没有必要的开销、
	//Dont do this
	public boolean isBabyBoomer(){
		//unnecessary allocation of expensive object
		Calendar gmtCal = Calendar.getInstance(TimeZone.getTimeZone("GMT"));
		gmtCal.set(1946,Calendar.JANUARY, 1, 0, 0,0);
		Date boomStart = gmtCal.getTime();
		gmtCal.set(1965, Calendar.JANUARY, 1, 0, 0,0);
		Date boomEnd = gmtCal.getTime();
		return  birthDate.compareTo(boomStart)>=0&&
				boomEnd.compareTo(boomEnd)<=0;
	}
	

}
