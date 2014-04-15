package net.shopin.web.controller;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import net.shopin.api.ISecurityService;
import net.shopin.view.MemberAddressVO;
import net.shopin.view.MemberVO;
import net.shopin.web.conf.BankConf;
import net.shopin.web.util.LoadProperties;
import net.shopin.web.util.SSOUtil;
import net.shopin.web.util.SystemConstants;
import net.shopin.web.vo.AddressVO;

import org.apache.commons.httpclient.HttpClient;
import org.apache.commons.httpclient.HttpException;
import org.apache.commons.httpclient.HttpMethod;
import org.apache.commons.httpclient.methods.GetMethod;
import org.apache.commons.lang.StringEscapeUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.shopin.modules.utils.Codec;
import com.shopin.modules.utils.DozerMapper;
import com.sun.jmx.snmp.Timestamp;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.security.MessageDigest;
import java.util.*;
import java.util.regex.Pattern;

/**
 * QQ彩贝登录
 * 
 * @Class Name QQG2LogController
 * @Author huyy
 * @Create In 2013-11-12
 */
@Controller
public class QQG2LogController {
	@Autowired
	ISecurityService securityService;

	
	private static final String MALL_HOME_PAGE_URL = "http://www.shopin.net";

	
	private static final String CHARSET = "utf-8";
	private static final String Version = "1.0";
	private static final String MerchantId = "shopin";
	private static final String ReturnFmt = "json";

	@RequestMapping(value = "/qqG2Login", method = { RequestMethod.GET,
			RequestMethod.POST })
	public String retrun(Model m, HttpServletRequest request,
			HttpServletResponse response) {
		String toUrl = MALL_HOME_PAGE_URL;
		// 验证MD5
		Enumeration params = request.getParameterNames();
		Vector vc = new Vector();
		while (params.hasMoreElements()) {
			vc.add((String) params.nextElement());
		}
		String[] paramArr = (String[]) vc.toArray(new String[1]);
		int paramLen = paramArr.length;
		int tempLen = paramLen - 1;
		int i, j;
		String tempStr = "";
		for (i = 0; i < tempLen; i++) {
			for (j = i + 1; j < paramLen; j++) {
				if (paramArr[i].compareTo(paramArr[j]) > 0) {
					tempStr = paramArr[i];
					paramArr[i] = paramArr[j];
					paramArr[j] = tempStr;
				}
			}
		}
		// 进行md5加密比较
		String rawMd5Str = "";
		for (i = 0; i < paramLen; i++) {
			if (paramArr[i].compareTo("Vkey") != 0) { // 签名串不要Vkey这个参数
				rawMd5Str += request.getParameter(paramArr[i]);
			}
		}
		String md5_1 = (MD5(rawMd5Str + SystemConstants.QQ_FANLI_CONNECT_KEY1)).toLowerCase();
		String md5_2 = (MD5(md5_1 + SystemConstants.QQ_FANLI_CONNECT_KEY2)).toLowerCase();
		String vkey = request.getParameter("Vkey");

		String url = request.getParameter("Url"); // 目标地址
		// 进行联合登录态的设置，
		String acct = request.getParameter("Acct");
		String email = acct + "@shopin.qq.net";
		boolean flag = SSOUtil.validateEmail(email);
		MemberVO memberVO = new MemberVO();
		if (flag) {
			memberVO = SSOUtil.getMemberByEmail(email);
		} else {
			memberVO.setMemEmail(email.toLowerCase());
			memberVO.setMemPwd(Codec.encodeMd5(UUID.randomUUID().toString().substring(28)));
			memberVO.setLoginKey(acct);
			memberVO.setMemStatus("1");
		    memberVO.setMemBit("1");
		    memberVO.setLoginTimes("0");
		    memberVO.setMemName(acct);
		    memberVO.setRegDate(String.valueOf(new Date().getTime()));
			SSOUtil.register(memberVO); // 注册QQ会员
			memberVO = SSOUtil.getMemberByEmail(email);
		}
		if (vkey != null && md5_2.compareTo(vkey) != 0) {
			String uid = UUID.randomUUID().toString();
			securityService.addLoginUser(uid, memberVO);
			saveCookie(response, "userTicket", uid);
			return "redirect:" + toUrl;
		}
		// 设置提示语等信息给用户展示
		String viewinfo = request.getParameter("ViewInfo");
		String[] arr1 = viewinfo.split("&");
		String[] arr2 = {};
		HashMap viewinfoMap = new HashMap();
		int arrLen = arr1.length;
		for (i = 0; i < arrLen; i++) {
			arr2 = arr1[i].split("=");
			if (arr2.length > 1) {
				try {
					viewinfoMap.put(arr2[0],
							URLDecoder.decode(arr2[1], "UTF-8"));
				} catch (UnsupportedEncodingException e) {
					e.printStackTrace();
				}
			}
		}

		String showmsg = (String) viewinfoMap.get("ShowMsg");
		String nickname = (String) viewinfoMap.get("NickName");
		int point = Integer.parseInt((String) viewinfoMap.get("CBPoints"));
		String bonus = (String) viewinfoMap.get("CBBonus");
		// 统计字段，下单后需要回传
		String attach = request.getParameter("Attach");
		saveCookie(response, "attach", attach);
		if (memberVO != null) {
			memberVO.setMemName(showmsg);
			String uid2 = UUID.randomUUID().toString();
			if (viewinfoMap.get("HeadShow") != null
					&& viewinfoMap.get("HeadShow").toString().length() > 0) {
				String HeadShow = (String) viewinfoMap.get("HeadShow");
				String JifenUrl = (String) viewinfoMap.get("JifenUrl");
				String OpenKey = (String) viewinfoMap.get("OpenKey");
				String Ts = request.getParameter("Ts");
				String OpenId = request.getParameter("OpenId");
				saveCookie(response, "CB_log", "CB_log");
				List<AddressVO> addresslist = this.getCbAddress(OpenId,
						OpenKey, Ts);
				if (addresslist != null && addresslist.size() > 0) {
					try {
						SSOUtil.sysChroAddressFromCb(memberVO,addresslist);
					} catch (Exception e) {
						System.out.println("彩贝中同步的地址失败，" + e.getMessage());
						e.printStackTrace();
					}
				} else {
					System.out.println("彩贝中没有可同步的地址");
				}
				memberVO.setHeadShow(HeadShow + "##" + JifenUrl + "##CB_log");
			}
			securityService.addLoginUser(uid2, memberVO);
			saveCookie(response, "userTicket", uid2);
			return "redirect:" + url;
		} else {
			m.addAttribute("error", "账户登陆失败，请重试");
			return "login";
		}
	}

	private void saveCookie(HttpServletResponse response, String key,
			String value) {
		Cookie cookie = new Cookie(key, value);
		cookie.setPath("/");
		cookie.setDomain(SystemConstants.DOMAIN);
		response.addCookie(cookie);
	}

	public String MD5(String s) {
		char hexDigits[] = { '0', '1', '2', '3', '4', '5', '6', '7', '8', '9',
				'A', 'B', 'C', 'D', 'E', 'F' };
		try {
			byte[] btInput = s.getBytes();
			// 获得MD5摘要算法的 MessageDigest 对象
			MessageDigest mdInst = MessageDigest.getInstance("MD5");
			// 使用指定的字节更新摘要
			mdInst.update(btInput);
			// 获得密文
			byte[] md = mdInst.digest();
			// 把密文转换成十六进制的字符串形式
			int j = md.length;
			char str[] = new char[j * 2];
			int k = 0;
			for (int i = 0; i < j; i++) {
				byte byte0 = md[i];
				str[k++] = hexDigits[byte0 >>> 4 & 0xf];
				str[k++] = hexDigits[byte0 & 0xf];
			}
			return new String(str);
		} catch (Exception e) {
			// e.printStackTrace();
			return null;
		}
	}

	public String htmlEncode(String s) {
		return s.replaceAll("&", "&amp;").replaceAll("\"", "&quot;")
				.replaceAll("'", "&#039;").replaceAll("<", "&lt;")
				.replace(">", "&gt;");
	}

	// / MD5加密算法
	private String getLowerMd5(String md5str) {
		String md5 = org.apache.commons.codec.digest.DigestUtils.md5Hex(md5str)
				.toLowerCase();
		return md5;
	}

	public List<AddressVO> getCbAddress(String openId, String openKey,
			String Ts) {
		String s = this.getLowerMd5(CHARSET + MerchantId + openId + openKey
				+ ReturnFmt + Ts + Version + SystemConstants.QQ_API_SECRET);
		HttpClient client = new HttpClient();
		client.setConnectionTimeout(3000);// 设置为延时3秒
		client.setTimeout(3000);
		String url = SystemConstants.QQ_GETADDRESS + "?version=" + Version + "&merchant_id="
				+ MerchantId + "&openid=" + openId + "&openkey=" + openKey
				+ "&charset=" + CHARSET + "&return_fmt=" + ReturnFmt
				+ "&timestamp=" + Ts + "&sign=" + s;
		HttpMethod method = new GetMethod(url);
		try {
			client.executeMethod(method);
			String j = method.getResponseBodyAsString();
			List<AddressVO> addresslist = new ArrayList();
			JSONObject json = JSONObject.fromObject(j);
			if (json.get("ret_msg").equals("ok")) {
				JSONArray shopping_address = (JSONArray) json
						.get("shopping_address");
				for (int i = 0; i < shopping_address.size(); i++) {
					JSONObject shopping_add = shopping_address.getJSONObject(i);
					String province = shopping_add.get("province") != null ? URLDecoder
							.decode(shopping_add.get("province").toString(),
									"UTF-8") : "";
					String city = shopping_add.get("city") != null ? URLDecoder
							.decode(shopping_add.get("city").toString(),
									"UTF-8") : "";
					String dist = shopping_add.get("dist") != null ? URLDecoder
							.decode(shopping_add.get("dist").toString(),
									"UTF-8") : "";
					String address = shopping_add.get("address") != null ? URLDecoder
							.decode(shopping_add.get("address").toString(),
									"UTF-8") : "";
					String post_code = shopping_add.get("post_code") != null ? shopping_add
							.get("post_code").toString() : "";
					String mobile = shopping_add.get("mobile") != null ? shopping_add
							.get("mobile").toString() : "";
					String name = shopping_add.get("name") != null ? URLDecoder
							.decode(shopping_add.get("name").toString(),
									"UTF-8") : "";
					String phone = shopping_add.get("phone") != null ? shopping_add
							.get("phone").toString() : "";
					AddressVO maddress = new AddressVO();
					maddress.setProvince(province);
					maddress.setCity(city);
					maddress.setAddress(address);
					maddress.setMailCode(post_code);
					maddress.setMobile(mobile);
					maddress.setName(name);
					maddress.setTel(phone);
					maddress.setFullAddress(dist);
					addresslist.add(maddress);
					// System.out.println(province+city+dist+address+post_code+mobile+name+phone);
				}
			}
			return addresslist;
		} catch (HttpException e) {
			e.printStackTrace();
			return null;
		} catch (IOException e) {
			e.printStackTrace();
			return null;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
}
