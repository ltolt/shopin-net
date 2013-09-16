/**
 * 说 明     : 日期工具类
 * author: 陆湘星
 * data  : 2011-5-25
 * email : xiangxingchina@163.com
 **/
package util;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

public class DateUtil {
	// 格式化日期为字符串 "yyyy-MM-dd   hh:mm"
	public static String formatDateTime(Date basicDate) {
		return formatDateTime(basicDate, "yyyy-MM-dd hh:mm:ss");
	}

	public static String formatDateTime(Date basicDate, String strFormat) {
		SimpleDateFormat df = new SimpleDateFormat(strFormat);
		return df.format(basicDate);
	}

	// 格式化日期为字符串 "yyyy-MM-dd   hh:mm"
	public static String formatDateTime(String basicDate, String strFormat) {
		SimpleDateFormat df = new SimpleDateFormat(strFormat);
		Date tmpDate = null;
		try {
			tmpDate = df.parse(basicDate);
		} catch (Exception e) {
			// 日期型字符串格式错误
		}
		return df.format(tmpDate);
	}

	public static Date formatDateTimeToDate(String basicDate, String strFormat) {
		SimpleDateFormat df = new SimpleDateFormat(strFormat);
		Date tmpDate = null;
		try {
			tmpDate = df.parse(basicDate);
		} catch (Exception e) {
			// 日期型字符串格式错误
		}
		return tmpDate;
	}

	// 当前日期加减n天后的日期，返回String (yyyy-mm-dd)
	public static String nDaysAftertoday(int n) {
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		Calendar rightNow = Calendar.getInstance();
		// rightNow.add(Calendar.DAY_OF_MONTH,-1);
		rightNow.add(Calendar.DAY_OF_MONTH, +n);
		return df.format(rightNow.getTime());
	}

	// 当前日期加减n天后的日期，返回String (yyyy-mm-dd)
	public static Date nDaysAfterNowDate(int n) {
		Calendar rightNow = Calendar.getInstance();
		// rightNow.add(Calendar.DAY_OF_MONTH,-1);
		rightNow.add(Calendar.DAY_OF_MONTH, +n);
		return rightNow.getTime();
	}

	// 给定一个日期型字符串，返回加减n天后的日期型字符串
	public static String nDaysAfterOneDateString(String basicDate, int n) {
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		Date tmpDate = null;
		try {
			tmpDate = df.parse(basicDate);
		} catch (Exception e) {
			// 日期型字符串格式错误
		}
		long nDay = (tmpDate.getTime() / (24 * 60 * 60 * 1000) + 1 + n)
				* (24 * 60 * 60 * 1000);
		tmpDate.setTime(nDay);

		return df.format(tmpDate);
	}

	// 给定一个日期型字符串，返回加减秒的日期型字符串
	public static String nDaysAfterOneTimeString(String basicDate, int n) {
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		Date tmpDate = null;
		try {
			tmpDate = df.parse(basicDate);
		} catch (Exception e) {
			// 日期型字符串格式错误
		}
		long nDay = tmpDate.getTime() + new Long((long) n) * 1000;
		tmpDate.setTime(nDay);

		return df.format(tmpDate);
	}

	// 给定一个日期，返回加减n天后的日期
	public Date nDaysAfterOneDate(Date basicDate, int n) {
		long nDay = (basicDate.getTime() / (24 * 60 * 60 * 1000) + 1 + n)
				* (24 * 60 * 60 * 1000);
		basicDate.setTime(nDay);

		return basicDate;
	}

	// 计算两个日期相隔的天数
	public int nDaysBetweenTwoDate(Date firstDate, Date secondDate) {
		int nDay = (int) ((secondDate.getTime() - firstDate.getTime()) / (24 * 60 * 60 * 1000));
		return nDay;
	}

	// 计算两个日期相隔的天数
	public int nDaysBetweenTwoDate(String firstString, String secondString) {
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		Date firstDate = null;
		Date secondDate = null;
		try {
			firstDate = df.parse(firstString);
			secondDate = df.parse(secondString);
		} catch (Exception e) {
			// 日期型字符串格式错误
		}
		int nDay = (int) ((secondDate.getTime() - firstDate.getTime()) / (24 * 60 * 60 * 1000));
		return nDay;
	}

	// 打印两个时间差 -- 用于简单性能测试
	public static String PrintTimeGap(String str, Date start, Date end) {
		if (str == null || "".equals(str))
			str = "";
		long l = end.getTime() - start.getTime();
		long day = l / (24 * 60 * 60 * 1000);
		long hour = (l / (60 * 60 * 1000) - day * 24);
		long min = ((l / (60 * 1000)) - day * 24 * 60 - hour * 60);
		long s = (l / 1000 - day * 24 * 60 * 60 - hour * 60 * 60 - min * 60);
		long n = (l - day * 24 * 60 * 60 * 1000 - hour * 60 * 60 * 1000 - min
				* 60 * 1000 - s * 1000);
		return str + "耗时为 : " + day + "天" + hour + "小时" + min + "分" + s + "秒"
				+ n + "毫秒";
	}
}
