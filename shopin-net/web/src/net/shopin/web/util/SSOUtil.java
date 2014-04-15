package net.shopin.web.util;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import net.shopin.view.MemberAddressVO;
import net.shopin.view.MemberVO;
import net.shopin.web.vo.AddressVO;

/**
 * 调用SSO接口工具类
 * 
 * @Class Name SSOUtil
 * @Author huyy
 * @Create In 2013-11-12
 */
public class SSOUtil {
	/**
	 * 验证Email是否存在
	 * 
	 * @Methods Name validateEmail
	 * @Create In 2013-11-12 By huyy
	 * @param email
	 * @return boolean
	 */
	public static boolean validateEmail(String email) {
		Map paramMap = new HashMap();
		paramMap.put("email", email);
		String webUrl = SystemConstants.SSO_URL + "/queryExists";
		String SSOresult = HttpClientUtilSSO.SSOUrlContent(webUrl, paramMap);
		JSONObject jsonObject = JSONObject.fromObject(SSOresult);
		String result = jsonObject.get("result").toString();
		String isExits = jsonObject.get("isExists").toString();
		if (result != null && !result.equals("") && result.equals("1")) {
			if (isExits != null && !isExits.equals("") && isExits.equals("1")) {
				return true;
			} else {
				return false;
			}
		}
		return false;
	}

	/**
	 * 根据EMAIL查询会员
	 * 
	 * @Methods Name getMemberByEmail
	 * @Create In 2013-11-12 By huyy
	 * @param email
	 * @return MemberVO
	 */
	public static MemberVO getMemberByEmail(String paraEmail) {
		Map paramMap = new HashMap();
		paramMap.put("email", paraEmail);
		String webUrl = SystemConstants.SSO_URL + "/member/getMember";
		String SSOresult = HttpClientUtilSSO.SSOUrlContent(webUrl, paramMap);
		System.out.println(SSOresult);
		JSONObject jsonObject = JSONObject.fromObject(SSOresult);
		String result = jsonObject.get("result").toString();
		List<MemberVO> memberVOlist = new ArrayList<MemberVO>();
		MemberVO memberVO = new MemberVO();
		if (result != null && !result.equals("") && result.equals("1")) {
			String member = jsonObject.getString("member");
			JSONObject jsonObjectMember = JSONObject.fromObject(member);
			String sid = jsonObjectMember.getString("sid");
			String username = jsonObjectMember.getString("username");
			String password = jsonObjectMember.getString("password");
			String email = jsonObjectMember.getString("email");
			String roleSid = jsonObjectMember.getString("roleSid");
			String status = jsonObjectMember.getString("status");
			String delFlag = jsonObjectMember.getString("delFlag");
			if (sid != null && !sid.equals("")) {
				memberVO.setSid(sid);
			}
			if (username != null && !username.equals("")) {
				memberVO.setMemName(username);
			}
			if (password != null && !password.equals("")) {
				memberVO.setMemPwd(password);
			}
			if (email != null && !email.equals("")) {
				memberVO.setMemEmail(email);
			}
			if (status != null && !status.equals("")) {
				memberVO.setMemStatus(status);
			}
			if (delFlag != null && !delFlag.equals("")) {
				memberVO.setMemBit(delFlag);
			}
			if (memberVOlist != null && memberVOlist.size() > 0) {
				memberVO = memberVOlist.get(0);
			}
		}
		return memberVO;
	}
	/**
	 * 注册用户
	 * @Methods Name register
	 * @Create In 2013-11-12 By huyy
	 * @param memberVO void
	 */
	public static String register(MemberVO memberVO){
		Map paramMap = new HashMap();
		paramMap.put("email", memberVO.getMemEmail());
		paramMap.put("password", memberVO.getMemPwd());
		paramMap.put("loginTimes", memberVO.getLoginTimes());
		paramMap.put("status", memberVO.getMemStatus());
		String webUrl = SystemConstants.SSO_URL + "/member/register";
		String SSOresult = HttpClientUtilSSO.SSOUrlContent(webUrl, paramMap);
		return SSOresult;
	}
	/**
	 * QQ彩贝登录
	 * @Methods Name sysChroAddressFromCb
	 * @Create In 2013-11-12 By huyy
	 * @param memberVO
	 * @param addresslist void
	 */
	public static void sysChroAddressFromCb(MemberVO memberVO,List<AddressVO> addresslist){
		Map paramMap = new HashMap();
		paramMap.put("sid",memberVO.getSid());
		paramMap.put("username",memberVO.getMemName());
		paramMap.put("password",memberVO.getMemPwd());
		paramMap.put("email",memberVO.getMemEmail());
		paramMap.put("mobile",memberVO.getMobile());
		paramMap.put("status",memberVO.getMemStatus());
		paramMap.put("loginTimes",memberVO.getLoginTimes());
		JSONArray array=JSONArray.fromObject(addresslist);
		paramMap.put("addressarray",array.toString());
		String webUrl = SystemConstants.SSO_URL + "/sysChroAddressFromCb";
		String SSOresult = HttpClientUtilSSO.SSOUrlContent(webUrl, paramMap);
	}
}
