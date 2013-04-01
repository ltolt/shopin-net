package base.framework.util;

import java.text.ParsePosition;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

/**
 * 日期处理工具类.
 * <p>
 * 创建日期：2010-07-01<br>
 * 创建人：Xiyt<br>
 * 修改日期：<br>
 * 修改人：<br>
 * 修改内容：<br>
 * 
 * @author Xiyt
 * @version 1.0
 */
public class DateUtils {

	/**
	 * 静态常量
	 */
	public static final String DATE_PATTON_1 = "yyyy-MM-dd";
	public static final String DATE_PATTON_2 = "yyyy/MM/dd";
	public static final String DATE_PATTON_3 = "yyyyMMdd";
	public static final String DATE_TIME_PATTON_1 = "yyyy-MM-dd HH:mm:ss";
	public static final String DATE_TIME_PATTON_2 = "yyyy/MM/dd HH:mm:ss";
	public static final String DATE_TIME_PATTON_3 = "yyyyMMddHHmmss";

	public static final int C_ONE_SECOND = 1000;
	public static final int C_ONE_MINUTE = 60 * C_ONE_SECOND;
	public static final long C_ONE_HOUR = 60 * C_ONE_MINUTE;
	public static final long C_ONE_DAY = 24 * C_ONE_HOUR;

	

	/**
	 * 转换当前时间为默认格式
	 * 
	 * @return
	 */
	public static String formatDate2Str() {
		return formatDate2Str(new Date());
	}

	/**
	 * 转换指定时间为默认格式
	 * 
	 * @param date
	 * @return
	 */
	public static String formatDate2Str(Date date) {
		return formatDate2Str(date, DATE_TIME_PATTON_1);
	}
	
	/**
	 * 转换当前日期为指定格式
	 * 
	 * @param date
	 * @return
	 */
	public static String formatDate2Str(String format) {
		return formatDate2Str(new Date(), format);
	}

	/**
	 * 转换指定时间为指定格式
	 * 
	 * @param date
	 * @param format
	 * @return
	 */
	public static String formatDate2Str(Date date, String format) {
		if (date == null) {
			return null;
		}

		if (format == null || format.equals("")) {
			format = DATE_TIME_PATTON_1;
		}
		SimpleDateFormat sdf = getSimpleDateFormat(format);
		return sdf.format(date);
	}

	/**
	 * 转换默认格式的时间为Date
	 * 
	 * @param dateStr
	 * @return
	 */
	public static Date formatStr2Date(String dateStr) {
		return formatStr2Date(dateStr, null);
	}

	/**
	 * 转换指定格式的时间为Date
	 * 
	 * @param dateStr
	 * @param format
	 * @return
	 */
	public static Date formatStr2Date(String dateStr, String format) {
		if (dateStr == null) {
			return null;
		}

		if (format == null || format.equals("")) {
			format = DATE_TIME_PATTON_1;
		}
		SimpleDateFormat sdf = getSimpleDateFormat(format);
		return sdf.parse(dateStr, new ParsePosition(0));
	}

	/**
	 * 转换默认格式的时间为指定格式时间
	 * 
	 * @param dateStr
	 * @param defineFormat
	 * @return
	 */
	public static String formatDefault2Define(String dateStr,
			String defineFormat) {
		return formatSource2Target(dateStr, DATE_TIME_PATTON_1, defineFormat);
	}

	/**
	 * 转换源格式的时间为目标格式时间
	 * 
	 * @param dateStr
	 * @param sourceFormat
	 * @param targetFormat
	 * @return
	 */
	public static String formatSource2Target(String dateStr,
			String sourceFormat, String targetFormat) {
		Date date = formatStr2Date(dateStr, sourceFormat);
		return formatDate2Str(date, targetFormat);
	}

	
	/**
	 * 计算当前月份的最大天数
	 * 
	 * @return
	 */
	public static int findMaxDayInMonth() {
		return findMaxDayInMonth(0, 0);
	}

	/**
	 * 计算指定日期月份的最大天数
	 * 
	 * @param date
	 * @return
	 */
	public static int findMaxDayInMonth(Date date) {
		if (date == null) {
			return 0;
		}
		return findMaxDayInMonth(date2Calendar(date));
	}

	/**
	 * 计算指定日历月份的最大天数
	 * 
	 * @param calendar
	 * @return
	 */
	public static int findMaxDayInMonth(Calendar calendar) {
		if (calendar == null) {
			return 0;
		}

		return calendar.getActualMaximum(Calendar.DAY_OF_MONTH);
	}

	/**
	 * 计算当前年某月份的最大天数
	 * 
	 * @param month
	 * @return
	 */
	public static int findMaxDayInMonth(int month) {
		return findMaxDayInMonth(0, month);
	}

	/**
	 * 计算某年某月份的最大天数
	 * 
	 * @param year
	 * @param month
	 * @return
	 */
	public static int findMaxDayInMonth(int year, int month) {
		Calendar calendar = Calendar.getInstance();
		if (year > 0) {
			calendar.set(Calendar.YEAR, year);
		}

		if (month > 0) {
			calendar.set(Calendar.MONTH, month - 1);
		}

		return findMaxDayInMonth(calendar);
	}

	/**
	 * Calendar 转换为 Date
	 * 
	 * @param calendar
	 * @return
	 */
	public static Date calendar2Date(Calendar calendar) {
		if (calendar == null) {
			return null;
		}
		return calendar.getTime();
	}

	/**
	 * Date 转换为 Calendar
	 * 
	 * @param date
	 * @return
	 */
	public static Calendar date2Calendar(Date date) {
		if (date == null) {
			return null;
		}
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(date);
		return calendar;
	}

	/**
	 * 拿到默认格式的SimpleDateFormat
	 * 
	 * @return
	 */
	public static SimpleDateFormat getSimpleDateFormat() {
		return getSimpleDateFormat(null);
	}

	/**
	 * 拿到指定输出格式的SimpleDateFormat
	 * 
	 * @param format
	 * @return
	 */
	public static SimpleDateFormat getSimpleDateFormat(String format) {
		SimpleDateFormat sdf;
		if (format == null) {
			sdf = new SimpleDateFormat(DATE_TIME_PATTON_1);
		} else {
			sdf = new SimpleDateFormat(format);
		}

		return sdf;
	}
	
	/**
	 * 获得当前月份的第一天。
	 * @return 当前月份的第一天。
	 */
	public static java.sql.Date getFirstDayOfMonth() {
		Calendar cal = Calendar.getInstance();
		cal.set(Calendar.DATE, 1);
		return new java.sql.Date(cal.getTime().getTime());
	}
	
	/**
	 * 获得当前月份的第一天并且按照yyyy-MM-dd格式化为字符串
	 * @return 当前月份的第一天按照yyyy-MM-dd格式化的字符串
	 */
	public static String getFirstDayOfMonthAsString(String format) {
		java.sql.Date date= getFirstDayOfMonth();
		if(null != format && format.length()>0){
			return formatDate2Str(date, format);
		}else{
			return formatDate2Str(date);
		}
	}
		
	/**
	 * 获得当前月份的最后第一天。
	 * @return 当前月份的最后第一天。
	 */
	public static java.sql.Date getLastDayOfMonth() {
		Calendar cal= Calendar.getInstance();
		cal.set(Calendar.DATE, 1);
		cal.add(Calendar.MONTH, 1);
		cal.add(Calendar.DATE, -1);
		return new java.sql.Date(cal.getTime().getTime());
	}
	
	/**
	 * 获得当前月份的最后一天并且按照yyyy-MM-dd格式化为字符串
	 * @return 当前月份的最后一天按照yyyy-MM-dd格式化的字符串
	 */
	public static String getLastDayOfMonthAsString(String format) {
		java.sql.Date date= getLastDayOfMonth();
		if(null != format && format.length()>0){
			return formatDate2Str(date, format);
		}else{
			return formatDate2Str(date);
		}
	}

	/**
	 * 计算当天是该年中的第几周
	 * 
	 * @return
	 */
	public static int findWeeksNoInYear() {
		return findWeeksNoInYear(new Date());
	}

	/**
	 * 计算指定日期是该年中的第几周
	 * 
	 * @param date
	 * @return
	 */
	public static int findWeeksNoInYear(Date date) {
		if (date == null) {
			return 0;
		}
		return findWeeksNoInYear(date2Calendar(date));
	}

	/**
	 * 计算指定日历是该年中的第几周
	 * 
	 * @param calendar
	 * @return
	 */
	public static int findWeeksNoInYear(Calendar calendar) {
		if (calendar == null) {
			return 0;
		}
		return calendar.get(Calendar.WEEK_OF_YEAR);
	}

	/**
	 * 计算一年中的第几星期是几号
	 * 
	 * @param year
	 * @param weekInYear
	 * @param dayInWeek
	 * @return
	 */
	public static Date findDateInWeekOnYear(int year, int weekInYear,
			int dayInWeek) {
		Calendar calendar = Calendar.getInstance();
		if (year > 0) {
			calendar.set(Calendar.YEAR, year);
		}

		calendar.set(Calendar.WEEK_OF_YEAR, weekInYear);
		calendar.set(Calendar.DAY_OF_WEEK, dayInWeek);

		return calendar.getTime();
	}

	/**
	 * 相对于当前日期的前几天(days < 0)或者后几天(days > 0)
	 * 
	 * @param days
	 * @return
	 */
	public static Date dayBefore2Date(int days) {
		Date date = new Date();
		return dayBefore2Object(days, null, date);
	}

	/**
	 * 相对于当前日期的前几天(days < 0)或者后几天(days > 0)
	 * 
	 * @param days
	 * @return
	 */
	public static String dayBefore2Str(int days) {
		String string = formatDate2Str();
		return dayBefore2Object(days, null, string);
	}

	/**
	 * 相对于当前日期的前几天(days < 0)或者后几天(days > 0)
	 * 
	 * @param days
	 * @param format
	 * @param instance
	 */
	@SuppressWarnings("unchecked")
	public static <T extends Object> T dayBefore2Object(int days,
			String format, T instance) {
		Calendar calendar = Calendar.getInstance();
		if (days == 0) {
			return null;
		}

		if (format == null || format.equals("")) {
			format = DATE_TIME_PATTON_1;
		}

		calendar.add(Calendar.DATE, days);
		if (instance instanceof Date) {
			return (T) calendar.getTime();
		} else if (instance instanceof String) {
			return (T) formatDate2Str(calendar2Date(calendar), format);
		}
		return null;
	}

	/**
	 * 相对于指定日期的前几天(days < 0)或者后几天(days > 0)
	 * 
	 * @param date
	 * @param days
	 * @return
	 */
	public static Date defineDayBefore2Date(Date date, int days) {
		Date dateInstance = new Date();
		return defineDayBefore2Object(date, days, null, dateInstance);
	}

	/**
	 * 相对于指定日期的前几天(days < 0)或者后几天(days > 0)
	 * 
	 * @param date
	 * @param days
	 * @return
	 */
	public static String defineDayBefore2Str(Date date, int days) {
		String stringInstance = formatDate2Str();
		return defineDayBefore2Object(date, days, null, stringInstance);
	}

	/**
	 * 相对于指定日期的前几天(days < 0)或者后几天(days > 0)
	 * 
	 * @param <T>
	 * @param date
	 * @param days
	 * @param format
	 * @param instance
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public static <T extends Object> T defineDayBefore2Object(Date date,
			int days, String format, T instance) {
		if (date == null || days == 0) {
			return null;
		}

		if (format == null || format.equals("")) {
			format = DATE_TIME_PATTON_1;
		}

		Calendar calendar = date2Calendar(date);
		calendar.add(Calendar.DATE, days);
		if (instance instanceof Date) {
			return (T) calendar.getTime();
		} else if (instance instanceof String) {
			return (T) formatDate2Str(calendar2Date(calendar), format);
		}
		return null;
	}

	/**
	 * 相对于当前日期的前几月(months < 0)或者后几月(months > 0)时间
	 * 
	 * @param months
	 * @return
	 */
	public static Date monthBefore2Date(int months) {
		Date date = new Date();
		return monthBefore2Object(months, null, date);
	}

	/**
	 * 相对于当前日期的前几月(months < 0)或者后几月(months > 0)时间
	 * 
	 * @param months
	 * @return
	 */
	public static String monthBefore2Str(int months) {
		String string = formatDate2Str();
		return monthBefore2Object(months, null, string);
	}

	/**
	 * 相对于当前日期的前几月(months < 0)或者后几月(months > 0)时间
	 * 
	 * @param <T>
	 * @param months
	 * @param format
	 * @param instance
	 */
	@SuppressWarnings("unchecked")
	public static <T extends Object> T monthBefore2Object(int months,
			String format, T instance) {
		if (months == 0) {
			return null;
		}

		if (format == null || format.equals("")) {
			format = DATE_TIME_PATTON_1;
		}
		Calendar calendar = Calendar.getInstance();
		calendar.add(Calendar.MONTH, months);

		if (instance instanceof Date) {
			return (T) calendar.getTime();
		} else if (instance instanceof String) {
			return (T) formatDate2Str(calendar2Date(calendar), format);
		}

		return null;
	}

	/**
	 * 相对于指定日期的前几月(months < 0)或者后几月(months > 0)时间
	 * 
	 * @param date
	 * @param months
	 * @return
	 */
	public static Date defineMonthBefore2Date(Date date, int months) {
		Date dateInstance = new Date();
		return defineMonthBefore2Object(date, months, null, dateInstance);
	}

	/**
	 * 相对于指定日期的前几月(months < 0)或者后几月(months > 0)时间
	 * 
	 * @param date
	 * @param months
	 * @return
	 */
	public static String defineMonthBefore2Str(Date date, int months) {
		String stringInstance = formatDate2Str();
		return defineMonthBefore2Object(date, months, null, stringInstance);
	}

	/**
	 * 相对于指定日期的前几月(months < 0)或者后几月(months > 0)时间
	 * 
	 * @param <T>
	 * @param date
	 * @param months
	 * @param format
	 * @param instance
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public static <T extends Object> T defineMonthBefore2Object(Date date,
			int months, String format, T instance) {
		if (months == 0) {
			return null;
		}

		if (format == null || format.equals("")) {
			format = DATE_TIME_PATTON_1;
		}

		Calendar calendar = date2Calendar(date);
		calendar.add(Calendar.MONTH, months);

		if (instance instanceof Date) {
			return (T) calendar.getTime();
		} else if (instance instanceof String) {
			return (T) formatDate2Str(calendar2Date(calendar), format);
		}

		return null;
	}

	/**
	 * 计算两个日期直接差的天数
	 * 
	 * @param firstDate
	 * @param secondDate
	 * @return
	 */
	public static int caculate2Days(Date firstDate, Date secondDate) {
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(firstDate);
		int dayNum1 = calendar.get(Calendar.DAY_OF_YEAR);
		calendar.setTime(secondDate);
		int dayNum2 = calendar.get(Calendar.DAY_OF_YEAR);
		return Math.abs(dayNum1 - dayNum2);
	}
	/**
	 * 计算两个日期直接差的天数
	 * 
	 * @param firstDate
	 * @param secondDate
	 * @return
	 */
	public static int caculate2Days(String firstString, String secondString) {
		SimpleDateFormat   df   =   new   SimpleDateFormat("yyyy-MM-dd");   
        Date   firstDate=null;   
        Date   secondDate=null;   
        try   {   
            firstDate   =   df.parse(firstString);   
            secondDate=df.parse(secondString);   
        }   
        catch(Exception   e)   {   
            //   日期型字符串格式错误   
        }   
        int   nDay=(int)((secondDate.getTime()-firstDate.getTime())/(24*60*60*1000));   
        return   nDay;   
	}
	/**
	 * 计算两个日期直接差的天数
	 * 
	 * @param firstCalendar
	 * @param secondCalendar
	 * @return
	 */
	public static int caculate2Days(Calendar firstCalendar,
			Calendar secondCalendar) {
		if (firstCalendar.after(secondCalendar)) {
			Calendar calendar = firstCalendar;
			firstCalendar = secondCalendar;
			secondCalendar = calendar;
		}

		long calendarNum1 = firstCalendar.getTimeInMillis();
		long calendarNum2 = secondCalendar.getTimeInMillis();
		return Math.abs((int) ((calendarNum1 - calendarNum2) / C_ONE_DAY));
	}
	
	 //打印两个时间差   -- 用于简单性能测试
	  public static String PrintTimeGap(String str,Date start,Date end){
	 	  if(str==null || "".equals(str)) str = "";
	       long l=end.getTime()-start.getTime();
	 	   long day=l/(24*60*60*1000);
	       long hour=(l/(60*60*1000)-day*24);
	       long min=((l/(60*1000))-day*24*60-hour*60);
	       long s=(l/1000-day*24*60*60-hour*60*60-min*60);
	       long n=(l -day*24*60*60*1000-hour*60*60*1000-min*60*1000-s*1000);
	       return str+ "耗时为 : "+day+"天"+hour+"小时"+min+"分"+s+"秒"+n+"毫秒";
   }
}