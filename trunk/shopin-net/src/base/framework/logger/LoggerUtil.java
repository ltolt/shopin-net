/**
 * 说 明     : 日志工具类
 * author: 陆湘星
 * data  : 2011-5-28
 * email : xiangxingchina@163.com
 **/
package base.framework.logger;

import java.util.Date;

import base.framework.constants.PropertiesLoad;
import base.framework.constants.SystemConfig.DebugType;
import base.framework.util.DateUtils;

import com.elong.api.ELogger;

/**
 * log4j具有5种正常级别(Level)。 Level DEBUG 指出细粒度信息事件对调试应用程序是非常有帮助的。 Level INFO 表明
 * 消息在粗粒度级别上突出强调应用程序的运行过程 Level WARN 表明会出现潜在错误的情形 level ERROR
 * 指出虽然发生错误事件，但仍然不影响系统的继续运行。 level FATAL 指出每个严重的错误事件将会导致应用程序的退出。 //自定义 level
 * Stock 跟库存相关 需要同步到数据库日志
 * 
 * @author luxiangxing
 * 
 */
public class LoggerUtil {
	public static final String LOG_FILE_COMMON_LOG = "commonLog";				//普通日志
	public static final String LOG_FILE_EXCEPTION_LOG = "exceptionLog";			//异常日志
	ELogger commonlog = null ;
	ELogger exceptionLog = null ;
	
	public static final String LOG_FILE_LOGGERINFO = "loggerInfo"; // 普通日志
	public static final String LOG_FILE_EXCEPTIONINFO = "exceptionInfo"; // 异常日志
	public static final String LOG_FILE_WSINFO = "wsInfo"; // WS日志
	public static final String LOG_FILE_WSEXCEPTIONINFO = "wsExceptionInfo"; // WS异常日志
	public static final String LOG_FILE_IMPORTIONINFO = "importantInfo"; // 重要
																			// 日志
	public static final String LOG_FILE_IMPORTIONEXCEPTIONINFO = "importantExceptionInfo";// 普通日志
	public static final String LOG_FILE_LOGIN_LOG_INFO = "loginLogInfo";// 登录日志


	private String base_message; // 存储类路径
	private String condMessage; // 存储条件对象

	private static int debug_level = 0;

	private LoggerUtil(String baseMessage) {
		this.base_message = baseMessage;
		commonlog = ELogger.getLogger("commonlog",this.getClass().getName(),false);
		exceptionLog = ELogger.getLogger("exceptionLog",this.getClass().getName(),true);
	}

	private LoggerUtil(String baseMessage, String condMessage) {
		this.base_message = baseMessage;
		this.condMessage = condMessage;
		commonlog = ELogger.getLogger("commonlog",this.getClass().getName(),false);
		exceptionLog = ELogger.getLogger("exceptionLog",this.getClass().getName(),true);
	}

	public static LoggerUtil getLogger(String baseMessage) {
		if (debug_level == 0) {
			String debug = PropertiesLoad.getPropertiesDebugLevel();
			if (debug != null) {
				try {
					debug_level = Integer.valueOf(debug);
				} catch (Exception e) {
				}
			}
		}
		return new LoggerUtil(baseMessage);
	}

	public static LoggerUtil getLogger(String baseMessage, String condMessage) {
		if (debug_level == 0) {
			String debug = PropertiesLoad.getPropertiesDebugLevel();
			if (debug != null) {
				try {
					debug_level = Integer.valueOf(debug);
				} catch (Exception e) {
				}
			}
		}
		return new LoggerUtil(baseMessage, condMessage);
	}

	public void setCondMessage(String condMessage) {
		this.condMessage = condMessage;
	}

	public String getMessage() {
		StringBuffer msg = new StringBuffer();
		if (base_message != null)
			msg.append("\r\n").append("[" + base_message + "]");
		if (condMessage != null)
			msg.append("\r\n").append("[" + condMessage + "]");
		return msg.toString();
	}

	public void printWsResultInfo(String resultJson, Date start) {
		printResultInfo(LOG_FILE_WSINFO, resultJson, start);
	}

	public void printImportantResultInfo(String resultJson, Date start) {
		printResultInfo(LOG_FILE_IMPORTIONINFO, resultJson, start);
	}

	public void printLoginLogInfo(String resultJson,Date start) {
		printResultInfo(LOG_FILE_LOGIN_LOG_INFO, resultJson, start);
	}
	public void printResultInfo(String resultJson, Date start) {
		printResultInfo(LOG_FILE_COMMON_LOG, resultJson, start);
	}

	// --信息
	public void printResultInfo(String logType,String resultJson, Date start) {
		if (debug_level < DebugType.nolog.getValue()) {
			StringBuffer infoStr = new StringBuffer();
			 infoStr.append(getMessage()).append("\r\n");
			if (debug_level <= DebugType.debug.getValue()) {
				int len = 0;
				if (resultJson != null)
					len = resultJson.toString().length();
				infoStr.append("result = " + resultJson + "\r\n返回长度" + len);
			}
			String useTime = DateUtils.PrintTimeGap("", start, new Date());
			infoStr.append("，" + useTime);
			if(logType.equals(LOG_FILE_COMMON_LOG)) commonlog.debug(infoStr.toString());
	   		else{
	   			ELogger eLogger = ELogger.getLogger(logType,this.getClass().getName(),false);
	   			eLogger.debug(infoStr.toString());
	   		}
		}
	}
	
	
	public  void  printException(String msg,Throwable e,Date start){
	   	printException(LOG_FILE_EXCEPTION_LOG, msg, e, start);
    }
	public void printWsException(String msg, Exception e,Date start) {
		printException(LOG_FILE_WSEXCEPTIONINFO, msg, e, start);
	}

	public void printImportantException(String msg, Exception e,Date start) {
		printException(LOG_FILE_IMPORTIONEXCEPTIONINFO, msg, e, start);
	}
	
   public  void  printException(String logType,String msg,Throwable e,Date start){
	   		StringBuffer infoStr = new StringBuffer();
		   infoStr.append(getMessage()).append("\r\n");
		   if(msg!=null && msg.length()>0)  infoStr.append("\r\n" + msg)   ;
			 String useTime = DateUtils.PrintTimeGap("", start, new Date());
			infoStr.append(useTime);
	   		if(logType.equals(LOG_FILE_EXCEPTION_LOG)) exceptionLog.error(infoStr.toString(), e);
	   		else{
	   			ELogger eLogger = ELogger.getLogger(logType,this.getClass().getName(),true);
	   			eLogger.error(infoStr.toString(), e);
	   		}
   }
   

}
