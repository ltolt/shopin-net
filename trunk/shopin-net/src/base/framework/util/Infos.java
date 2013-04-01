/**
 * 说 明  :
 * author: 陆湘星
 * data  : 2012-1-3
 * email : xiangxingchina@163.com
 **/
package base.framework.util;

import java.util.Date;

import base.framework.logger.LoggerUtil;




public class Infos {
	//--------------集成日志信息
	LoggerUtil logger  = null;
	private String action;
	private String method ;
	private   Date start;
	
	
	private String code;
	private String condInfo;
	
	private String logType = LoggerUtil.LOG_FILE_LOGGERINFO;
	
	public Infos(String action,String method){
		this.action=action;
		this.method=method;
		start = new Date();
		logger = LoggerUtil.getLogger("action = "+ action + "  method = " +method);
	}
	
	public Infos(String url,String action,String method){
		this.action=action;
		this.method=method;
		start = new Date();
		logger = LoggerUtil.getLogger("fromUrl = "+url+"  action = "+ action + "  method = " +method);
	}
	public Infos(String url,String action,String method, String condStr){
		this.action=action;
		this.method=method;
		start = new Date();
		String baseStr = "fromUrl = "+url+"  action = "+ action + "  method = " +method;
		logger = LoggerUtil.getLogger(baseStr, condStr);
	}
	
	
	public void setCondMesssage(String condMsg){
		logger.setCondMessage(condMsg);
	}
	
	public String getAction() {
		return action;
	}

	public void setAction(String action) {
		this.action = action;
	}

	public String getMethod() {
		return method;
	}

	public void setMethod(String method) {
		this.method = method;
	}
	
	//打印基本信息
	public  void  printLogInfo(String resultJson){
		if(logType.equals(LoggerUtil.LOG_FILE_LOGGERINFO)){
			logger.printResultInfo(resultJson, start);
		}else if(logType.equals(LoggerUtil.LOG_FILE_WSINFO)){
			logger.printWsResultInfo(resultJson, start);
		}else if(logType.equals(LoggerUtil.LOG_FILE_IMPORTIONINFO)){
			logger.printImportantResultInfo(resultJson, start);
		}else{ //异常情况，暂不重复打印
			
		}
	}
	
	/**
	 * 打印登录日志
	 * @param codeInfo
	 */
	public void printLoginLog(String jsonLog) {
		logger.printLoginLogInfo(jsonLog, start);
	}
	
	public void setInfoSuccess4return(String codeInfo){
		this.code = InfoConstants.CodeInfo.操作成功.getCode();
		if(codeInfo==null || "".equals(codeInfo)) this.condInfo = InfoConstants.CodeInfo.操作成功.getCodeInfo();
		else this.condInfo = codeInfo;
		this.logType = LoggerUtil.LOG_FILE_LOGGERINFO;
	}	
	public void setInfoFail4return(String codeInfo){
		this.code = InfoConstants.CodeInfo.操作失败.getCode();
		if(codeInfo==null || "".equals(codeInfo)) this.condInfo = InfoConstants.CodeInfo.操作失败.getCodeInfo();
		else this.condInfo = codeInfo;
		this.logType = LoggerUtil.LOG_FILE_LOGGERINFO;
	}	

	
	public void setInfo4Exception(String codeInfo,Exception e){
		this.code = InfoConstants.CodeInfo.操作异常.getCode();
		if(codeInfo==null || "".equals(codeInfo)) this.condInfo = InfoConstants.CodeInfo.操作异常.getCodeInfo();
		else this.condInfo = codeInfo;
		logger.printException(codeInfo, e,start);
	}

	//打印ws

	public void setInfoWsSuccess4return(String codeInfo){
		this.code = InfoConstants.CodeInfo.操作成功.getCode();
		if(codeInfo==null || "".equals(codeInfo)) this.condInfo = InfoConstants.CodeInfo.操作成功.getCodeInfo();
		else this.condInfo = codeInfo;
		this.logType = LoggerUtil.LOG_FILE_WSINFO;
	}	
	public void setInfoWsFail4return(String codeInfo){
		this.code = InfoConstants.CodeInfo.操作失败.getCode();
		if(codeInfo==null || "".equals(codeInfo)) this.condInfo = InfoConstants.CodeInfo.操作失败.getCodeInfo();
		else this.condInfo = codeInfo;
		this.logType = LoggerUtil.LOG_FILE_WSINFO;
	}	

	
	public void setInfo4WsException(String codeInfo,Exception e){
		this.code = InfoConstants.CodeInfo.操作异常.getCode();
		if(codeInfo==null || "".equals(codeInfo)) this.condInfo = InfoConstants.CodeInfo.操作异常.getCodeInfo();
		else this.condInfo = codeInfo;
		logger.printWsException(codeInfo, e,start);
	}
	//打印important
	public void setInfoImportantSuccess4return(String codeInfo){
		this.code = InfoConstants.CodeInfo.操作成功.getCode();
		if(codeInfo==null || "".equals(codeInfo)) this.condInfo = InfoConstants.CodeInfo.操作成功.getCodeInfo();
		else this.condInfo = codeInfo;
		this.logType = LoggerUtil.LOG_FILE_IMPORTIONINFO;
	}	
	public void setInfoImportantFail4return(String codeInfo){
		this.code = InfoConstants.CodeInfo.操作失败.getCode();
		if(codeInfo==null || "".equals(codeInfo)) this.condInfo = InfoConstants.CodeInfo.操作失败.getCodeInfo();
		else this.condInfo = codeInfo;
		this.logType = LoggerUtil.LOG_FILE_IMPORTIONINFO;
	}	
	public void setInfo4ImportantException(String codeInfo,Exception e){
		this.code = InfoConstants.CodeInfo.操作异常.getCode();
		if(codeInfo==null || "".equals(codeInfo)) this.condInfo = InfoConstants.CodeInfo.操作异常.getCodeInfo();
		else this.condInfo = codeInfo;
		logger.printImportantException(codeInfo, e, start);
	}
	
	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getCondInfo() {
		return condInfo;
	}

	public void setCondInfo(String condInfo) {
		this.condInfo = condInfo;
	}
	
}
