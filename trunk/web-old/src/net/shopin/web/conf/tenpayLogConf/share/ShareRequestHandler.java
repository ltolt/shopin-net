package net.shopin.web.conf.tenpayLogConf.share;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.shopin.web.conf.tenpayLogConf.RequestHandler;
import net.shopin.web.conf.tenpayLogConf.util.TenpayUtil;

/**
 * 共享登录请求类
 * ============================================================================
 * api说明：
 * init(),初始化函数，默认给一些参数赋值，如cmdno,date等。
 * getGateURL()/setGateURL(),获取/设置入口地址,不包含参数值
 * getKey()/setKey(),获取/设置密钥
 * getParameter()/setParameter(),获取/设置参数值
 * getAllParameters(),获取所有参数
 * getRequestURL(),获取带参数的请求URL
 * doSend(),重定向到财付通支付
 * getDebugInfo(),获取debug信息
 *
 * ============================================================================
 *
 */
public class ShareRequestHandler extends RequestHandler  {

	public ShareRequestHandler(HttpServletRequest request,
			HttpServletResponse response) {
		super(request, response);

		this.setGateUrl("https://www.tenpay.com/cgi-bin/v1.0/service_gate.cgi");
	}

	public void init() {
		//签名类型
		this.setParameter("sign_type", "md5");

		//默认为0,该接口目前只是0
		//对于商户：使用和支付时一样的key，可以登录财付通商户系统修改。
		//对应财付通用户：使用中介支付key，可以登录财付通修改。
		this.setParameter("sign_encrypt_keyid", "0");

		//字符编码 GBK, UTF-8
		this.setParameter("input_charset", "GBK");

		//服务名称：login
		this.setParameter("service", "login");

		//财付通分配的合作方标志，可以是商户号、财付通账户。
		this.setParameter("chnid", "");

		//chnid类型。0:商户号 1:财付通帐号
		this.setParameter("chtype", "0");

		//登录成功之后的目的URL
		this.setParameter("redirect_url", "");

		//自定义参数
		this.setParameter("attach", "");

		//时间戳
		this.setParameter("tmstamp", TenpayUtil.getUnixTime(new Date()) + "");

		//签名
		this.setParameter("sign", "");

	}



}
