package base.framework.utils;

import java.util.Calendar;
import java.util.Date;

public class Dateutil {

	
	public static void main(String[] args) {
		long time =  new Date().getTime();
		System.out.println(time/1000);
		Calendar.getInstance();
	}
	
}
