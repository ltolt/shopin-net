package net.shopin.web.conf.aliLogConf;
import java.io.IOException;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.dom4j.Document;
import org.dom4j.DocumentException;
import org.dom4j.Node;
import org.dom4j.io.SAXReader;

/* *
 *类名：AlipayService
 *功能：支付宝各接口构造类
 *详细：构造支付宝各接口请求参数
 *版本：3.2
 *修改日期：2011-03-17
 *说明：
 *以下代码只是为了方便商户测试而提供的样例代码，商户可以根据自己网站的需要，按照技术文档编写,并非一定要使用该代码。
 *该代码仅供学习和研究支付宝接口使用，只是提供一个参考。
 */

public class AlipayService {

    /**
     * 支付宝提供给商户的服务接入网关URL(旧)
     */
    private final static String ALIPAY_GATEWAY_OLD = "https://www.alipay.com/cooperate/gateway.do?";

    /**
     * 支付宝提供给商户的服务接入网关URL(新)
     */
    private static final String ALIPAY_GATEWAY_NEW = "https://mapi.alipay.com/gateway.do?";


    /**
     * 构造快捷登录接口
     * @param encrypt_key 防钓鱼时间戳
     * @param exter_invoke_ip 买家本地电脑的IP地址
     * @return 表单提交HTML信息
     */
    public static String alipay_auth_authorize(String anti_phishing_key, String exter_invoke_ip) {
        Map<String, String> sParaTemp = new HashMap<String, String>();

        sParaTemp.put("service", "alipay.auth.authorize");
        sParaTemp.put("target_service", "user.auth.quick.login");
        sParaTemp.put("partner", AlipayConfig.partner);
        sParaTemp.put("return_url", AlipayConfig.return_url);
        sParaTemp.put("_input_charset", AlipayConfig.input_charset);
        sParaTemp.put("anti_phishing_key", anti_phishing_key);
        sParaTemp.put("exter_invoke_ip", exter_invoke_ip);

        String strButtonName = "支付宝快捷登录";

        return AlipaySubmit.buildForm(sParaTemp, ALIPAY_GATEWAY_NEW, "get", strButtonName);
    }

    /**
     * 构造快捷登录物流地址查询接口
     * @param token 授权令牌
     * @return 表单提交HTML信息
     */
    public static String user_logistics_address_query(String token) {
        Map<String, String> sParaTemp = new HashMap<String, String>();

        sParaTemp.put("service", "user.logistics.address.query");
        sParaTemp.put("partner", AlipayConfig.partner);
        sParaTemp.put("return_url", AlipayConfig.return_url);
        sParaTemp.put("_input_charset", AlipayConfig.input_charset);
        sParaTemp.put("token", token);

        String strButtonName = "使用支付宝收货地址";

        return AlipaySubmit.buildForm(sParaTemp, ALIPAY_GATEWAY_NEW, "get", strButtonName);
    }

    /**
     * 用于防钓鱼，调用接口query_timestamp来获取时间戳的处理函数
     * 注意：远程解析XML出错，与服务器是否支持SSL等配置有关
     * @return 时间戳字符串
     * @throws IOException
     * @throws DocumentException
     * @throws MalformedURLException
     */
    public static String query_timestamp() throws MalformedURLException,
                                                        DocumentException, IOException {

        //构造访问query_timestamp接口的URL串
        String strUrl = ALIPAY_GATEWAY_NEW + "service=query_timestamp&partner=" + AlipayConfig.partner;
        StringBuffer result = new StringBuffer();

        SAXReader reader = new SAXReader();
        Document doc = reader.read(new URL(strUrl).openStream());

        List<Node> nodeList = doc.selectNodes("//alipay/*");

        for (Node node : nodeList) {
            // 截取部分不需要解析的信息
            if (node.getName().equals("is_success") && node.getText().equals("T")) {
                // 判断是否有成功标示
                List<Node> nodeList1 = doc.selectNodes("//response/timestamp/*");
                for (Node node1 : nodeList1) {
                    result.append(node1.getText());
                }
            }
        }

        return result.toString();
    }
}
