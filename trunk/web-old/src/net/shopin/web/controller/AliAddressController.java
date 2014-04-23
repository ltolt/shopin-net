package net.shopin.web.controller;

import net.shopin.api.ICartService;
import net.shopin.api.IFreightService;
import net.shopin.api.IMemberService;
import net.shopin.api.ISecurityService;
import net.shopin.view.MemberAddressVO;
import net.shopin.view.MemberVO;
import net.shopin.web.conf.BankConf;
import net.shopin.web.conf.aliLogConf.AlipayConfig;
import net.shopin.web.conf.aliLogConf.AlipayNotify;
import net.shopin.web.conf.aliLogConf.AlipayService;
import net.shopin.web.userShare.Payment;
import net.shopin.web.util.LoadProperties;
import org.dom4j.DocumentException;
import org.jdom.Document;
import org.jdom.Element;
import org.jdom.JDOMException;
import org.jdom.input.SAXBuilder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.StringReader;
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
public class AliAddressController {
    @Autowired
    IMemberService memberService;
    @Autowired
    ISecurityService securityService;
    @Autowired
    private ICartService cartService;
    @Autowired
    BankConf bankConf;
    @Autowired
    private IFreightService freightService;

    @RequestMapping(value = "/aliAddress", method = {RequestMethod.GET, RequestMethod.POST})
    public String toAli(HttpServletRequest request, @RequestParam("forward") String forward, @CookieValue(value = "shopin_sid", required = false) String cartId, @CookieValue(value = "aliToken", required = true) String aliToken, Model m) {
        AlipayConfig.partner = bankConf.getPartner();
        AlipayConfig.key = bankConf.getKey();

//        String return_url = "http://1.202.151.98/aliAddressReturn/" + cartId + "/";
        String return_url = LoadProperties.readValue("ALIPAY_ADDRESS_URL") + cartId + "/";
        if (request.getParameter("validate_address") != null && !"".equals(request.getParameter("validate_address"))) {
            return_url.substring(0, return_url.indexOf("?"));
        }
        if (forward == null || "".equals(forward)) {
            return_url = return_url + "index.html";
        } else {
            forward = forward.replace("/", "-");
            return_url = return_url + forward;
        }
//        return_url=return_url.substring(0, return_url.indexOf("?"));
        AlipayConfig.return_url = return_url;

        String url = AlipayService.user_logistics_address_query(aliToken);
        m.addAttribute("url", url);
        return "toAlipayLog";
    }


    @RequestMapping(value = "/aliAddressReturn/{cart}/{toUrl}", method = {RequestMethod.GET, RequestMethod.POST})
    public String retrun(@PathVariable("cart") String cart, @PathVariable("toUrl") String toUrl, Model m, HttpServletRequest request, HttpServletResponse response) {
        //获取支付宝GET过来反馈信息
        Map<String, String> params = new HashMap<String, String>();
        Map requestParams = request.getParameterMap();
        for (Iterator iter = requestParams.keySet().iterator(); iter.hasNext();) {
            String name = (String) iter.next();
            String[] values = (String[]) requestParams.get(name);
            String valueStr = "";
            for (int i = 0; i < values.length; i++) {
                valueStr = (i == values.length - 1) ? valueStr + values[i]
                        : valueStr + values[i] + ",";
            }
            //乱码解决，这段代码在出现乱码时使用。如果mysign和sign不相等也可以使用这段代码转化
//            try {
//                valueStr = new String(valueStr.getBytes("ISO-8859-1"), "UTF-8");
//            } catch (UnsupportedEncodingException e) {
//                e.printStackTrace();
//            }
            //request.getParameter("real_name")
            params.put(name, valueStr);
        }

        //计算得出通知验证结果
        boolean verify_result = AlipayNotify.verify(params);

        if (verify_result) {//验证成功
            //请在这里加上商户的业务逻辑程序代码

            //——请根据您的业务逻辑来编写程序（以下代码仅作参考）——
            //获取支付宝的通知返回参数，可参考技术文档中页面跳转同步通知参数列表
            //支付宝用户id
            String user_id = request.getParameter("user_id");
            //用户选择的收货地址
            String receive_address = request.getParameter("receive_address");
//            if (request.getParameter("receive_address") != null) {
//                try {
//                    receive_address = new String(receive_address.getBytes("ISO-8859-1"), "UTF-8");
//                } catch (UnsupportedEncodingException e) {
//                    e.printStackTrace();
//                }
//            }
            //获取支付宝的通知返回参数，可参考技术文档中页面跳转同步通知参数列表

            //对receive_address做XML解析，获得各节点信息
            if (receive_address != null && !"".equals(receive_address)) {
                saveAddress(receive_address, cart);
            }

        } else {
            System.out.println("验证失败");
        }

//        m.addAttribute("order.receptName","test");
//        m.addAttribute("validate_address", "true");
        if (toUrl.equals("index")) {
            return "redirect:" + "/index.html";
        } else {
            toUrl = toUrl.replace("-", "/") + ".html";
            return "redirect:" + toUrl;
        }
    }


    private void saveAddress(String resultXml, String cart) {
        SAXBuilder builder = new SAXBuilder();
        Document doc = null;
        try {
            doc = builder.build(new StringReader(resultXml));
        } catch (JDOMException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
        Element root = doc.getRootElement();
        String address = root.getChildText("address");
        String city = root.getChildText("city");
        String area = root.getChildText("area");
        String fullname = root.getChildText("fullname");
        String mobile_phone = root.getChildText("mobile_phone");
        String phone = root.getChildText("phone");
        String post = root.getChildText("post");
        String prov = root.getChildText("prov");
        String address_code = root.getChildText("address_code");

        MemberAddressVO vo = new MemberAddressVO();
        vo.setAddress(address);
        vo.setCityName(city);
        vo.setProvinceName(prov);
        vo.setPostcode(post);
        vo.setTel(mobile_phone);
        vo.setMobileTel(mobile_phone);
        vo.setName(fullname);
        vo.setFullAddress(getFullAddress(vo));
        String cityId = "";
        if (city.replace("市", "").equals(prov)) {
            cityId = freightService.getCityId(area);
        } else {
            cityId = freightService.getCityId(city.replace("市", ""));
        }
        if (cityId != null && !"".equals(cityId)) {
            vo.setDeliCitySid(cityId);
            cartService.saveCartAddress(cart, vo);
        }
//        memberService.saveAddress(vo);
    }

    private String getFullAddress(MemberAddressVO addressVO) {
        String fullAddress = "";
        fullAddress += addressVO.getAddress();
        String cityName = addressVO.getCityName() == null ? "" : addressVO.getCityName();
        String provinceName = addressVO.getProvinceName() == null ? "" : addressVO.getProvinceName();
        if (fullAddress.indexOf(cityName) < 0) {
            fullAddress = cityName + fullAddress;
        }
        if (!provinceName.equals(cityName)
                && fullAddress.indexOf(provinceName) < 0) {
            fullAddress = provinceName + fullAddress;
        }
        return fullAddress;
    }
}