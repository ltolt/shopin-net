package net.shopin.web.conf.tenpayLogConf.client;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.Iterator;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import net.shopin.web.conf.tenpayLogConf.util.HttpClientUtil;

/**
 * 返回script内容后台应答类<br/>
 * ========================================================================<br/>
 * api说明：<br/>
 * getKey()/setKey(),获取/设置密钥<br/>
 * getContent() / setContent(), 获取/设置原始内容<br/>
 * getParameter()/setParameter(),获取/设置参数值<br/>
 * getAllParameters(),获取所有参数<br/>
 * isTenpaySign(),是否财付通签名,true:是 false:否<br/>
 * getDebugInfo(),获取debug信息<br/>
 *
 * ========================================================================<br/>
 *
 */
public class ScriptClientResponseHandler extends ClientResponseHandler {

	protected void doParse() throws UnsupportedEncodingException {

		Pattern pattern = Pattern.compile("window.location.href.*=.*(http://.*|https://.*)['|\"]");
		Matcher matcher = pattern.matcher(this.getContent());

		if(matcher.find()) {
			//获取url
			String url = matcher.group(1);

			String queryString = HttpClientUtil.getQueryString(url);
			Map m = HttpClientUtil.queryString2Map(queryString);
			if(null != m && !m.isEmpty()) {
				String charset = this.getCharset();
				Iterator it = m.keySet().iterator();
				while(it.hasNext()) {
					String k = (String) it.next();
					String v = (String) m.get(k);
					this.setParameter(k, URLDecoder.decode(v, charset));
				}
			}

			return;
		}

		this.setParameter("pay_result", "99");
		this.setParameter("pay_info", "返回包格式错误，请检查协议是否改变！");

	}

}
