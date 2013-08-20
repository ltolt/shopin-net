/**
 * @Probject Name: Effective
 * @Path: chapter2.item5.RightPerson.java
 * @Create By kongm
 * @Create In 2013-8-20 下午2:04:26
 * TODO
 */
package chapter2.item5;

import java.util.Calendar;
import java.util.Date;
import java.util.TimeZone;

/**
 * @Class Name RightPerson
 * @Author kongm
 * @Create In 2013-8-20
 */
public class RightPerson {

	private final Date birthDate;

	public RightPerson(Date birthDate) {
		this.birthDate = birthDate;
	}
	
	private static final Date BOOM_START;
	private static final Date BOOM_END;
	
	static{
		Calendar gmtCal = Calendar.getInstance(TimeZone.getTimeZone("GMT"));
		gmtCal.set(1946,Calendar.JANUARY, 1, 0, 0,0);
		BOOM_START = gmtCal.getTime();
		gmtCal.set(1965, Calendar.JANUARY, 1, 0, 0,0);
		BOOM_END = gmtCal.getTime();
		
	}
	
	public boolean isBabyBoomer(){
		return  birthDate.compareTo(BOOM_START)>=0&&
				birthDate.compareTo(BOOM_END)<=0;
	}
	

}
