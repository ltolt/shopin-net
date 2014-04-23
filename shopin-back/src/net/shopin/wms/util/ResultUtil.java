package net.shopin.wms.util;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import net.shopin.wms.util.ErrorCodeConstants.ErrorCode;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

/**
 * 说明:
 * @author guansq
 * @date 2013-5-29 下午02:18:58
 * @modify 
 */
public class ResultUtil {
	/**
	 * 说明：
	 *      
	 * @Create In 2013-8-15 By jingpeng
	 * @param success
	 * @param memo
	 * @return String
	 */
	public static String createCommonVisibleResult(String success, String memo) {
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("success", success);
		resultMap.put("memo", memo);
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd HH:mm:ss").create();
		String json = gson.toJson(resultMap);
		return json;
	}
	public static String createSuccessResult() {
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("success", "true");
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd HH:mm:ss").create();
		String json = gson.toJson(resultMap);
		return json;
	}
	
	public static String createSuccessResult(Object obj) {
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("success", "true");
		resultMap.put("obj", obj);
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd HH:mm:ss").create();
		String json = gson.toJson(resultMap);
		return json;
	}
	
	public static String createSuccessResultPage(Object obj) {
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("success", "true");
		resultMap.put("result", obj);
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd HH:mm:ss").create();
		String json = gson.toJson(resultMap);
		return json;
	}
	
	
	public static String createSuccessResult(List list) {
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("success", "true");
		resultMap.put("list", list);
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd HH:mm:ss").create();
		String json = gson.toJson(resultMap);
		return json;
	}
	
	public static String createSuccessResultJson(List list) {
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("success", "true");
		resultMap.put("result", list);
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd HH:mm:ss").create();
		String json = gson.toJson(resultMap);
		return json;
	}
	
	public static String createSuccessResult(Page page) {
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("success", "true");
		resultMap.put("page", page);
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd HH:mm:ss").create();
		String json = gson.toJson(resultMap);
		return json;
	}
	
	public static String createFailureResult(String errorCode, String memo) {
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("success", "false");
		resultMap.put("errorCode", errorCode);
		resultMap.put("memo", memo);
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd HH:mm:ss").create();
		String json = gson.toJson(resultMap);
		return json;
	}
	
	public static String createFailureResult(Exception e) {
		String json = "";
		String exceptionMethod = e.getClass().getName();
		if("com.shopin.core.framework.exception.ShopinException".equals(exceptionMethod)) {
			String[] errorArray = e.getMessage().trim().split("_");
			json = ResultUtil.createFailureResult(errorArray[0], errorArray[1]);
		} else if("java.lang.NumberFormatException".equals(exceptionMethod) 
				|| "java.lang.NullPointerException".equals(exceptionMethod)) {
			json = ResultUtil.createFailureResult(ErrorCode.PARAM_ERROR.getErrorCode(), e.toString());
		} else if("org.springframework.dao.DuplicateKeyException".equals(exceptionMethod)) {
			json = ResultUtil.createFailureResult(ErrorCode.DUPLICATE_KEY_ERROR.getErrorCode(), e.toString());
		} else {
			json = ResultUtil.createFailureResult(ErrorCode.SYSTEM_ERROR.getErrorCode(), e.toString());
		}
		return json;
	}
}
