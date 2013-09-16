/**
 * 说 明  :
 * author: 陆湘星
 * data  : 2012-1-8
 * email : xiangxingchina@163.com
 **/
package base.upload;

import java.io.IOException;
import java.util.Date;
import java.util.Iterator;
import java.util.Map.Entry;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import constants.Constants;

import util.DateUtil;
import util.httpclient.HttpClient;

public class ActionServlet extends HttpServlet {

	private static final long serialVersionUID = -7255448991054296046L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		Date start = new Date();
		String action = req.getParameter("action");
		String method = req.getParameter("_method");
		method = "POST";
		String url = "http://172.16.103.147:7081/oms_core" + "/refundApply/fileuploadLocal";
		String params = request2params(req);
		HttpClient client = new HttpClient(url);
		client.setParams(params);
		String jsonResult = "";
		if (method != null && !"".equals(method)
				&& !"GET".equals(method.toUpperCase()))
			jsonResult = client.getPostResult();
		else
			jsonResult = client.getGetResult();
		resp.setContentType("application/x-json; charset=UTF-8");
		resp.getWriter().print(jsonResult);
		debugInfo(start, url, method, params, jsonResult);
	}

	public String request2params(HttpServletRequest req) {
		StringBuffer param = new StringBuffer();
		int i = 0;
		Iterator<Entry<String, String[]>> iterator = req.getParameterMap()
				.entrySet().iterator();
		while (iterator.hasNext()) {
			Entry<String, String[]> entry = (Entry<String, String[]>) iterator
					.next();
			if (!entry.getKey().equals("action")) {
				i++;
				if (i == 1)
					param.append("").append(entry.getKey()).append("=");
				else
					param.append("&").append(entry.getKey()).append("=");
				if (entry.getValue() instanceof String[]) {
					param.append(((String[]) entry.getValue())[0]);
				} else {
					param.append(entry.getValue());
				}
			}
		}
		// param.append("&roleSids=" +
		// req.getSession().getAttribute("roleSids"));
		// param.append("&keys=" + req.getSession().getAttribute("keys"));
		return param.toString();
	}

	private void debugInfo(Date start, String action, String method,
			String params, String jsonResult) {
		if (Integer.valueOf(Constants.SETTING_DEBUG) < 3) {
			Logger logger = Logger.getLogger(this.getClass().getName());
			StringBuffer msg = new StringBuffer();

			msg.append("\r\n").append("{").append("action = " + action);
			if (method != null)
				msg.append("\r\n").append("{").append("?_method = " + method);
			msg.append("}\r\n");
			msg.append("params = {").append(params).append("}\r\n");
			msg.append("jsonResult = {").append(jsonResult).append("}\r\n");
			String useTime = DateUtil.PrintTimeGap("", start, new Date());
			msg.append(useTime).append("\r\n");

			logger.info(msg);

		}
	}

	public boolean validateLogin(HttpServletRequest request) {
		boolean flag = false;
		String username = (String) request.getSession()
				.getAttribute("username");
		if (username != null && !"".equals(username.trim())) {
			flag = true;
		}
		return flag;
	}
}
