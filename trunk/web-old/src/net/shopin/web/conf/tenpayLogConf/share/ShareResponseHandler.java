package net.shopin.web.conf.tenpayLogConf.share;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.shopin.web.conf.tenpayLogConf.ResponseHandler;

/**
 * 共享登录应答类
 * ============================================================================
 * api说明：
 * getKey()/setKey(),获取/设置密钥
 * getParameter()/setParameter(),获取/设置参数值
 * getAllParameters(),获取所有参数
 * isTenpaySign(),是否财付通签名,true:是 false:否
 * doShow(),显示处理结果
 * getDebugInfo(),获取debug信息
 *
 * ============================================================================
 *
 */
public class ShareResponseHandler extends ResponseHandler {

	public ShareResponseHandler(HttpServletRequest request,
			HttpServletResponse response) throws UnsupportedEncodingException {
		super(request, response);
	}

}
