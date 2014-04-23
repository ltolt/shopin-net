package net.shopin.web.controller;

import net.shopin.api.IMemberService;
import net.shopin.api.ISecurityService;
import net.shopin.view.MemberVO;
import net.shopin.web.conf.BankConf;
import net.shopin.web.userShare.Payment;
import org.apache.commons.lang.StringEscapeUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.UUID;
import java.util.regex.Pattern;

/**
 * Created by IntelliJ IDEA.
 * User: lqw
 * Date: 2010-5-10
 * Time: 12:45:28
 */
@Controller
public class QQLogController {
    @Autowired
    IMemberService memberService;
    @Autowired
    ISecurityService securityService;
    @Autowired
    BankConf bankConf;
    /*
    * 定义双方约定的加密key,具体的值再接入时双方约定填入即可。
    * key等商家开发好后，提供此cgi的url给QQ返利，然后QQ返利系统自动生成key分配给商家。
    */
    private final static String QQ_FANLI_CONNECT_KEY1 = "(*IOH(*#9jde8RIJUd$%#ldiou37d6(89jeld[0jdui"; // TODO:这里填写约定的key1
    private final static String QQ_FANLI_CONNECT_KEY2 = "4dsdd%[()*(*DJKi*pleU^783hjidiou37d$%#0joda"; // TODO:这里填写约定的key2
    /*
    * 判断一个字符串是否是数字格式
    */
    private final static Pattern NumbericRegexp = Pattern.compile("^\\d*$");
    /*
    * 定义商家自己站点的首页地址，用于参数验证失败或者md5验证失败的时候跳转到首页
    */
    private final static String MALL_HOME_PAGE_URL = "/index.html";


    @RequestMapping(value = "/qqLogin", method = {RequestMethod.GET, RequestMethod.POST})
    public String retrun(Model m, HttpServletRequest req, HttpServletResponse resp) {
//        String partner = bankConf.getPartner(); //partner合作伙伴id（必须填写）
//        String key = bankConf.getKey(); //partner 的对应交易安全校验码（必须填写）
        String toUrl = MALL_HOME_PAGE_URL;
        /*
        * 第一步，获取各个参数的值并验证参数的正确性，若参数不合法，则写log后跳转到商家自己的首页
        */
        String acct = req.getParameter("acct");
        if (isNullOrEmpty(acct)) {
            return "redirect:" + toUrl;
        }

        String attach = req.getParameter("attach");
        if (isNullOrEmpty(attach)) {
            attach = "";
        }

        String clubinfo = req.getParameter("clubinfo");
        if (isNullOrEmpty(clubinfo) || !isNumeric(clubinfo)) {
            return "redirect:" + toUrl;
        }

        String viewinfo = req.getParameter("viewinfo");
        if (isNullOrEmpty(viewinfo)) {
            viewinfo = "";
        }

        String url = req.getParameter("url");
        if (isNullOrEmpty(url)) {
            url = MALL_HOME_PAGE_URL;
        }

        String ts = req.getParameter("ts");
        if (isNullOrEmpty(ts)) {
            return "redirect:" + toUrl;
        }

        String vkey = req.getParameter("vkey");
        if (isNullOrEmpty(vkey) || vkey.length() != 32) {
            return "redirect:" + toUrl;
        }

        // region 验证md5,若md5验证失败，则跳转到商家站点首页
        // md5的计算结果统一返回小写的

        String rawMD5String = acct + attach + clubinfo + ts + url + viewinfo;

        String md5_1 = getLowerMd5(rawMD5String + QQ_FANLI_CONNECT_KEY1, 32);

        String md5_2 = getLowerMd5(md5_1 + QQ_FANLI_CONNECT_KEY2, 32);

        if (!md5_2.equals(vkey)) {
            // 如果vkey检测不通过，那么5秒后就跳转到商家首页
            return "redirect:" + toUrl;
        }
        /*
        * TODO:第三步,进行联合vip和联合登录态的设置，这里由于跟各个商家的实现不同都会不一样，商家可以填充这里的逻辑, 示例代码只给出伪码表示
        */
        String email = acct + "@shopin.qq.net";
        boolean flag = memberService.validateLogin(acct);
        MemberVO memberVO = new MemberVO();
        if (!flag) {
            //已注册过支付宝会员，直接登录
            memberVO = memberService.getMemberByKey(acct);
        } else {
            memberVO.setMemEmail(email);
            memberVO.setMemPwd(UUID.randomUUID().toString().substring(28));
            memberVO.setLoginKey(acct);
            memberService.register(memberVO); //注册QQ会员
            memberVO = memberService.getMemberByKey(acct);
        }

        if (memberVO != null) {
            viewinfo = StringEscapeUtils.escapeHtml(URLDecoder.decode(viewinfo).replace("&nbsp;", " "))
                    .replace(" ", "&nbsp;");
            memberVO.setMemName(viewinfo);

            String uid2 = UUID.randomUUID().toString();
            securityService.addLoginUser(uid2, memberVO);
            Cookie cookie = new Cookie("userTicket", uid2);
            cookie.setPath("/");
            cookie.setDomain("shopin.net");
            resp.addCookie(cookie);
            return "redirect:" + url;
        } else {
            m.addAttribute("error", "账户登陆失败，请重试");
            return "login";
        }

        // TODO:若是联合VIP，则根据clubinfo的值赠送对应的商家会员资格
//        if ("100".equals(clubinfo)) {
//            // 财付通的支付方式过来，商家这里对其他支付方式等进行屏蔽处理逻辑
//        } else {
//            // 其他的联合vip处理或者忽略（若不接入联合vip）
//
//        }

    }


    private boolean isNumeric(String str) {
        return NumbericRegexp.matcher(str).matches();
    }

    // / <summary>
    // / MD5加密算法
    // / </summary>
    // / <param name="md5str">要加密的字符串</param>
    // / <param name="type">16还是32位加密</param>
    // / <returns>Asp md5加密结果</returns>

    private String getLowerMd5(String md5str, int type) {
        String md5 = org.apache.commons.codec.digest.DigestUtils.md5Hex(md5str)
                .toLowerCase();
        if (type == 16) {
            return md5.substring(8, 24);
        } else if (type == 32) {
            return md5;
        }
        return "";
    }

    /*
    * 字符串是否为空或空白
    */

    private boolean isNullOrEmpty(String str) {
        return str == null || str.trim().length() == 0;
    }


}