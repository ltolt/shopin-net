package net.shopin.web.conf;

import java.util.HashMap;
import java.util.Map;

/**
 * 系统基础代码配置
 * Created by IntelliJ IDEA.
 * User: user
 * Date: 2010-2-6
 * Time: 14:04:34
 */
public class CodeConf {

    /**
     * 订单状态
     */
    private static Map<String,String> orderStatusMap=
            new HashMap<String,String>();
    /**
     * 发货状态
     */
    private static Map<String,String> deliveryStatusMap=
            new HashMap<String,String>();
    static{
        init();
    }

    private static void init(){
       initOrderStatus();
       initDeliveryStatus();
    }

    private static void initOrderStatus(){
       orderStatusMap.put("-1","作废");
       orderStatusMap.put("0","付款超时");
       orderStatusMap.put("1","正在处理中");
       orderStatusMap.put("2","网银已支付/客服确认");
       orderStatusMap.put("3","客户已经确认收货");
       orderStatusMap.put("4","客户已经确认收货");
    }

    private static void initDeliveryStatus(){
        
    }

    public static String getOrderStatusName(String status){
        return orderStatusMap.get(status);
    }

    public static String getDeliveryStatusName(String status){
        return deliveryStatusMap.get(status);
    }
}
