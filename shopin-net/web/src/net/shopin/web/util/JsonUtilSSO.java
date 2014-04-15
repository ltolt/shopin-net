package net.shopin.web.util;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import net.shopin.view.DistrictVO;
import net.shopin.view.MemberAddressVO;
import net.shopin.view.MemberPersonalInfoVO;
import net.shopin.view.MemberVO;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by IntelliJ IDEA.
 * User: 51ibm
 * Date: 12-12-10
 * Time: 下午3:50
 * To change this template use File | Settings | File Templates.
 */
public class JsonUtilSSO {


    public static MemberVO json2Member(String json) {
        MemberVO vo = new MemberVO();
        JSONObject reg = JSONObject.fromObject(json);
        String result = reg.getString("result");
        if ("-1".equals(result) || !reg.containsKey("member")) {
            return null;
        }
        JSONObject regJson = reg.getJSONObject("member");
        if (regJson.containsKey("sid")) {
            vo.setSid(regJson.getString("sid") == null ? "" : regJson.getString("sid"));
        }
        if (regJson.containsKey("username")) {
            vo.setMemName(regJson.getString("username") == null ? "" : regJson.getString("username"));
        }
        if (regJson.containsKey("email")) {
            vo.setMemEmail(regJson.getString("email") == null ? "" : regJson.getString("email"));
        }
        if (regJson.containsKey("mobile")) {
            vo.setMobile(regJson.getString("mobile") == null ? "" : regJson.getString("mobile"));
        }

        if (regJson.containsKey("password")) {
            vo.setMemPwd(regJson.getString("password") == null ? "" : regJson.getString("password"));
        }
        if (regJson.containsKey("loginTimes")) {
            vo.setLoginTimes(regJson.getString("loginTimes") == null ? "" : regJson.getString("loginTimes"));
        }

        //手机号   加属性，加转换
        vo.setMemStatus("1");
        if (regJson.containsKey("status")) {
            vo.setMemStatus(regJson.getString("status") == null ? "1" : regJson.getString("status"));
        }
        vo.setMemBit("1");
        return vo;
    }

    public static MemberPersonalInfoVO json2MemberInfo(String json) {

//                  private String membersSid;
//    private String birthdate;
//    private String sex;     //1-男,0-女
//    private String stature;//身高
//    private String weight;
//    private String tel;
//    private String interest;
//    private String career;//职业
//    private String earnings;//收入
//    private String address;
        MemberPersonalInfoVO vo = new MemberPersonalInfoVO();
        JSONObject reg = JSONObject.fromObject(json);
        String result = reg.getString("result");
        if ("-1".equals(result) || !reg.containsKey("memberInfo")) {
            return vo;
        }
        JSONObject regJson = reg.getJSONObject("memberInfo");
        if (regJson.containsKey("memberSid")) {
            vo.setMembersSid(regJson.getString("memberSid") == null ? "" : regJson.getString("memberSid"));
        }
        if (regJson.containsKey("birthdate")) {
            vo.setBirthdate(regJson.getString("birthdate") == null ? "" : regJson.getString("birthdate"));
        }
        if (regJson.containsKey("gender")) {
            vo.setSex(regJson.getString("gender") == null ? "" : regJson.getString("gender"));
        }
        if (regJson.containsKey("income")) {
            vo.setEarnings(regJson.getString("income") == null ? "" : regJson.getString("income"));
        }
        if (regJson.containsKey("profession")) {
            vo.setCareer(regJson.getString("profession") == null ? "" : regJson.getString("profession"));
        }
        if (regJson.containsKey("nickName")) {
            vo.setNickName(regJson.getString("nickName") == null ? "" : regJson.getString("nickName"));
        }
        if (regJson.containsKey("realName")) {
            vo.setRealName(regJson.getString("realName") == null ? "" : regJson.getString("realName"));
        }

        return vo;
    }

    public static List<MemberAddressVO> json2MemberAddresses(String json) {
        List<MemberAddressVO> list = new ArrayList<MemberAddressVO>();
        JSONObject reg = JSONObject.fromObject(json);
        String result = reg.getString("result");
        if ("-1".equals(result) || !reg.containsKey("list")) {
            return list;
        }
        JSONArray regJsons = reg.getJSONArray("list");
        for (int i = 0; i < regJsons.size(); i++) {
            MemberAddressVO vo = new MemberAddressVO();
            JSONObject regJson = (JSONObject) regJsons.get(i);
            if (regJson.containsKey("sid")) {
                vo.setSid(regJson.getString("sid") == null ? "" : regJson.getString("sid"));
            }
            if (regJson.containsKey("memberSid")) {
                vo.setMembersSid(regJson.getString("memberSid") == null ? "" : regJson.getString("memberSid"));
            }
            if (regJson.containsKey("provinceSid")) {
                vo.setDeliProvinceSid(regJson.getString("provinceSid") == null ? "" : regJson.getString("provinceSid"));
            }
            if (regJson.containsKey("province")) {
                vo.setProvinceName(regJson.getString("province") == null ? "" : regJson.getString("province"));
            }
            if (regJson.containsKey("city")) {
                vo.setCityName(regJson.getString("city") == null ? "" : regJson.getString("city"));
            }
            if (regJson.containsKey("citySid")) {
                vo.setDeliCitySid(regJson.getString("citySid") == null ? "" : regJson.getString("citySid"));
            }
            if (regJson.containsKey("address")) {
                vo.setAddress(regJson.getString("address") == null ? "" : regJson.getString("address"));
            }
            if (regJson.containsKey("mailCode")) {
                vo.setPostcode(regJson.getString("mailCode") == null ? "" : regJson.getString("mailCode"));
            }
            if (regJson.containsKey("recipientName")) {
                vo.setName(regJson.getString("recipientName") == null ? "" : regJson.getString("recipientName"));
            }
            if (regJson.containsKey("mobile")) {
                String tel = regJson.getString("mobile") != null && (!"".equals(regJson.getString("mobile"))) ? regJson.getString("mobile") : regJson.getString("telephone");
                vo.setMobileTel(tel);
                vo.setTel(tel);
            }

            vo.setFullAddress(vo.getProvinceName() + vo.getCityName() + vo.getAddress());
            list.add(vo);
        }
        return list;
    }


    public static MemberAddressVO json2MemberAddress(String json) {

        MemberAddressVO vo = new MemberAddressVO();
        JSONObject reg = JSONObject.fromObject(json);
        String result = reg.getString("result");
        if ("-1".equals(result) || !reg.containsKey("address")) {
            return null;
        }
        JSONObject regJson = reg.getJSONObject("address");
        if (regJson.containsKey("sid")) {
            vo.setSid(regJson.getString("sid") == null ? "" : regJson.getString("sid"));
        }
        if (regJson.containsKey("memberSid")) {
            vo.setMembersSid(regJson.getString("memberSid") == null ? "" : regJson.getString("memberSid"));
        }
        if (regJson.containsKey("provinceSid")) {
            vo.setDeliProvinceSid(regJson.getString("provinceSid") == null ? "" : regJson.getString("provinceSid"));
        }
        if (regJson.containsKey("province")) {
            vo.setProvinceName(regJson.getString("province") == null ? "" : regJson.getString("province"));
        }
        if (regJson.containsKey("city")) {
            vo.setCityName(regJson.getString("city") == null ? "" : regJson.getString("city"));
        }
        if (regJson.containsKey("citySid")) {
            vo.setDeliCitySid(regJson.getString("citySid") == null ? "" : regJson.getString("citySid"));
        }
        if (regJson.containsKey("address")) {
            vo.setAddress(regJson.getString("address") == null ? "" : regJson.getString("address"));
        }
        if (regJson.containsKey("mailCode")) {
            vo.setPostcode(regJson.getString("mailCode") == null ? "" : regJson.getString("mailCode"));
        }
        if (regJson.containsKey("recipientName")) {
            vo.setName(regJson.getString("recipientName") == null ? "" : regJson.getString("recipientName"));
        }
        if (regJson.containsKey("mobile")) {
            String tel = regJson.getString("mobile") != null && (!"".equals(regJson.getString("mobile"))) ? regJson.getString("mobile") : regJson.getString("telephone");
            vo.setMobileTel(tel);
            vo.setTel(tel);

        }
        vo.setFullAddress(vo.getProvinceName() + vo.getCityName() + vo.getAddress());
        return vo;
    }

    public static List<DistrictVO> json2Provinces(String json) {
        List<DistrictVO> vs = new ArrayList<DistrictVO>();
        JSONObject regs = JSONObject.fromObject(json);
        String results = regs.getString("success");
        if (!"true".equals(results)) {
            return vs;
        }
        String result = regs.getString("data");
        JSONArray regJson = JSONArray.fromObject(result);
        for (int i = 0; i < regJson.size(); i++) {
            JSONObject j = (JSONObject) regJson.get(i);
            DistrictVO vo = new DistrictVO();
            vo.setSid(j.containsKey("sid") ? j.getString("sid") == null ? "" : j.getString("sid") : "");
            vo.setName(j.containsKey("province") ? j.getString("province") == null ? "" : j.getString("province") : "");
            vs.add(vo);
        }
        return vs;
    }

    public static DistrictVO json2Province(String json) {
        DistrictVO vo = new DistrictVO();
        List<DistrictVO> vs = new ArrayList<DistrictVO>();
        JSONObject regs = JSONObject.fromObject(json);
        String results = regs.getString("success");
        if (!"true".equals(results)) {
            return vo;
        }
        String result = regs.getString("data");
        JSONObject regJson = JSONObject.fromObject(result);
        vo.setSid(regJson.containsKey("sid") ? regJson.getString("sid") == null ? "" : regJson.getString("sid") : "");
        vo.setName(regJson.containsKey("province") ? regJson.getString("province") == null ? "" : regJson.getString("province") : "");
        return vo;
    }

    public static DistrictVO json2City(String json) {
        DistrictVO vo = new DistrictVO();
        List<DistrictVO> vs = new ArrayList<DistrictVO>();
        JSONObject regs = JSONObject.fromObject(json);
        String results = regs.getString("success");
        if (!"true".equals(results)) {
            return vo;
        }
        String result = regs.getString("data");
        JSONObject regJson = JSONObject.fromObject(result);
        vo.setSid(regJson.containsKey("sid") ? regJson.getString("sid") == null ? "" : regJson.getString("sid") : "");
        vo.setName(regJson.containsKey("city") ? regJson.getString("city") == null ? "" : regJson.getString("city") : "");
        return vo;
    }

    public static List<DistrictVO> json2Citys(String json) {
        List<DistrictVO> vs = new ArrayList<DistrictVO>();
        JSONObject regs = JSONObject.fromObject(json);
        String results = regs.getString("success");
        if (!"true".equals(results)) {
            return vs;
        }
        String result = regs.getString("data");
        JSONArray regJson = JSONArray.fromObject(result);
        for (int i = 0; i < regJson.size(); i++) {
            JSONObject j = (JSONObject) regJson.get(i);
            DistrictVO vo = new DistrictVO();
            vo.setSid(j.containsKey("sid") ? j.getString("sid") == null ? "" : j.getString("sid") : "");
            vo.setName(j.containsKey("city") ? j.getString("city") == null ? "" : j.getString("city") : "");
            vs.add(vo);
        }
        return vs;
    }
}
