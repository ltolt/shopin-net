import org.jdom.Document;
import org.jdom.Element;
import org.jdom.input.SAXBuilder;

import java.io.File;
import java.net.URL;
import java.util.List;

/**
 * Created by IntelliJ IDEA.
 * User: yanwt
 * Date: 2009-12-10
 * Time: 12:57:01
 */
public class MyXMLReader {
    public static void main(String arge[]) {
        try {
            SAXBuilder builder = new SAXBuilder();
            Document doc = builder.build(new File("e:\\order.xml")); 
            //Document doc = builder.build(new URL("http://210.73.90.18/merchant/order/order_ack_list.jsp？"));
            /**
             * 参数如下：
             * 1.v_mid商户编号从配置文件中读取，参考付款确认的controller
             * 2.v_ymd格式为yyyymmdd，取当前日期
             * 3.v_pstatus支付状态为1
             * 4.v_macv_mac=hmac_md5(text , key)；其中text是上述参数值按如下顺序拼串的结果：v_mid + v_ymd +v_pstatus，key为双方约定的密钥。
             * 5.v_datetype日期查询模式为1
             * */
            Element root = doc.getRootElement();
            Element messagehead = root.getChild("messagehead");
            System.out.println(messagehead.getChildText("status"));     //响应状态
            System.out.println(messagehead.getChildText("statusdesc")); //响应状态描述
            System.out.println(messagehead.getChildText("mid"));        //商户编号
            System.out.println(messagehead.getChildText("ymd"));        //查询日期
            System.out.println(messagehead.getChildText("count"));      //订单数量
            Element messagebody = root.getChild("messagebody");
            List orders = messagebody.getChildren();
            int count = Integer.parseInt(messagehead.getChildText("count"));
            for (int i = 0; i < count; i++) {
                Element order = (Element) orders.get(i);
                System.out.println(order.getChildText("orderindex"));
                System.out.println(order.getChildText("oid"));      //订单编号
                System.out.println(order.getChildText("pmode"));    //支付方式
                System.out.println(order.getChildText("pstatus"));  //支付状态
                System.out.println(order.getChildText("pstring"));  //支付结果说明
                System.out.println(order.getChildText("amount"));   //订单金额
                System.out.println(order.getChildText("moneytype"));//订单币种
                System.out.println(order.getChildText("sign"));     //数字签名 参与签名的数据（v_oid+v_pstatus+v_amount+v_moneytype）
                /**
                 * 业务逻辑如下：
                 * 先验证sign是否正确
                 * 1.如果支付状态是1，订单状态是未付款则更新订单状态为付款状态和支付方式。
                 * 2.如果支付状态是1，订单状态是已付款则不处理该订单。
                 * 3.
                 *
                */
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
