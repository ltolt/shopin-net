package net.shopin.web.conf.tenpayLogConf.test.share;

import net.shopin.web.conf.tenpayLogConf.RequestHandler;
import net.shopin.web.conf.tenpayLogConf.client.TenpayHttpClient;
import net.shopin.web.conf.tenpayLogConf.client.XMLClientResponseHandler;
import net.shopin.web.conf.tenpayLogConf.util.XMLUtil;

/**
 * 财付通收货地址程序演示
 * @author miklchen
 *
 */
public class RecvAddrTest {

	public static void main(String[] args) throws Exception {

		System.out.println("--------------------");

		//创建请求对象
		RequestHandler reqHandler = new RequestHandler(null, null);

		//初始化
		reqHandler.init();

		//设置密钥
		reqHandler.setKey("123456");

		//------------------
		//设置请求参数
		//------------------
		reqHandler.setParameter("sign_type", "md5");
		reqHandler.setParameter("sign_encrypt_keyid", "0");
		reqHandler.setParameter("input_charset", "GBK");
		reqHandler.setParameter("service", "qryrecvaddrinfo");
		reqHandler.setParameter("chnid", "2000000501");
		reqHandler.setParameter("chtype", "0");
		reqHandler.setParameter("id", "68084040");
		reqHandler.setParameter("request_token", "7D1BD6950E7EDF4202505C369D6A9DE0A8EE2424D253BEB2");

		String reqUrl = reqHandler.getRequestURL();

		//创建TenpayHttpClient
		TenpayHttpClient httpClient = new TenpayHttpClient();
		httpClient.setReqContent(reqUrl);
		httpClient.setMethod("POST");

		//远程调用
		if(httpClient.call()) {
			String resContent = httpClient.getResContent();
			System.out.println(resContent);

			//------------------
			//应答处理
			//------------------
			XMLClientResponseHandler resHandler = new XMLClientResponseHandler();
			String charset = XMLUtil.getXMLEncoding(resContent);
			resHandler.setContent(resContent);
			resHandler.setCharset(charset);

			String retcode = resHandler.getParameter("retcode");
			String retmsg = resHandler.getParameter("retmsg");

			if("0".equals(retcode) || "00".equals(retcode)) {
				//处理成功

			} else {
				//处理失败
			}

			System.out.println("retcode:" + retcode);
			System.out.println("retmsg:" + retmsg);

		} else {
			System.out.println(httpClient.getErrInfo());
		}

		System.out.println("--------------------");

	}

}
