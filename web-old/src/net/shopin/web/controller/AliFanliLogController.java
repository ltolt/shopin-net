package net.shopin.web.controller;

import net.shopin.api.IMemberService;
import net.shopin.api.ISecurityService;
import net.shopin.view.MemberVO;
import net.shopin.web.conf.BankConf;
import net.shopin.web.conf.aliLogConf.AlipayNotify;
import net.shopin.web.userShare.Payment;
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
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.UUID;

/**
 * Created by IntelliJ IDEA.
 * User: lqw
 * Date: 2010-5-10
 * Time: 12:45:28
 */
@Controller
public class AliFanliLogController {


//    @RequestMapping(value = "/aliLogintest", method = {RequestMethod.GET, RequestMethod.POST})
    public String toLogin(@RequestParam("forward") String forward, Model m,HttpServletRequest request,HttpServletResponse response) {
        String a_id = request.getParameter("a_id");      //合作商家为chanet指定的标识
        String rd = request.getParameter("rd");      //COOKIE生存周期
        String url = request.getParameter("url");     //广告主banner目标地址
        String info = request.getParameter("info");     // chanetinfo记录在cookie中，便于订单跟踪
        rd = rd == null || rd.equals("") ? "0" : rd;

        String merchant_domain = "shopin.net";

        if (url == null || info == null){
            //out.print("<html><head><script language=\"javascript\"> alert('LPMS: Parameter Error'); history.go(-1);</script></head></html>");
        }else {
            response.setHeader("P3P", "CP=\"NOI DEVa TAIa OUR BUS UNI\"");
            Cookie ltinfo = new Cookie("LTINFO", info);
            ltinfo.setPath("/");
            ltinfo.setDomain(merchant_domain);//添加广告主域名
            if (Integer.parseInt(rd) != 0) ltinfo.setMaxAge(60 * 60 * 24 * Integer.parseInt(rd));
            Cookie ltype = new Cookie("LTYPE", a_id);
            ltype.setPath("/");
            ltype.setDomain(merchant_domain);//添加广告主域名
            if (Integer.parseInt(rd) != 0) ltype.setMaxAge(60 * 60 * 24 * Integer.parseInt(rd));
            response.addCookie(ltinfo);
            response.addCookie(ltype);
        }
        return "aliFanli";
    }

}