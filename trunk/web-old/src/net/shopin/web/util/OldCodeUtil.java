package net.shopin.web.util;

import net.shopin.view.OrderVO;

import java.util.HashMap;
import java.util.Map;

/**
 * 基础代码工具类,
 * User: Suhaibo
 * Date: 2010-2-6
 * Time: 14:31:21
 */
public class OldCodeUtil {

    private static final int MEMBER_ADDRESS_LIMIT=5;

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

    /**
     * 退货状态
     */
    private static Map<String,String> refundStatusMap=
            new HashMap<String,String>();
    
    static{
        init();
    }

    private static void init(){
       initOrderStatus();
       initDeliveryStatus();
       initRefundStatus();
    }

    /**
     * 初始化订单状态
     * -1 作废0 付款超时 1 草稿
     * 2 网银已支付/客服确认（货到付款）
     * 3 客户收货确认4 货到付款收货确认（财务确认收款）
     *   发货单的发货状态:(开始默认是草稿:0,都收齐是可以发货：2)-1：作废
     * 0:草稿  1:全部导购提货(没有调拨单的情况，
     *           这个状态直接变成可以发货状态直接为2)
     * 2:可以发货(货品全部到齐)  3:已经发货(已输入快递单号，并打印快递单)
     */
    private static void initOrderStatus(){
       orderStatusMap.put("-1","作废");
       orderStatusMap.put("0","付款超时");
       orderStatusMap.put("1","等待付款");
       orderStatusMap.put("2-1","正在配货");
       orderStatusMap.put("2","正在配货");
       orderStatusMap.put("20","正在配货");
       orderStatusMap.put("21","正在配货");
       orderStatusMap.put("22","正在配货");
       orderStatusMap.put("23","等待收货");
       orderStatusMap.put("3","完成");
       orderStatusMap.put("4","完成");
    }

    /**
     * 初始化订单发货状态
     */
    private static void initDeliveryStatus(){
       deliveryStatusMap.put("-1","作废");
       deliveryStatusMap.put("0","草稿");
       deliveryStatusMap.put("1","全部导购提货");
       deliveryStatusMap.put("2","可以发货");
       deliveryStatusMap.put("3","已经发货");
    }

    /**
     * 初始化订单退货状态
     * -1作废 0 草稿 1 打印退货单 3 退货入收银 4 导购确认收货
     */
    private static void initRefundStatus(){
       refundStatusMap.put("-1","作废");
       refundStatusMap.put("0","等待收货");
       refundStatusMap.put("1","收到退货商品");
       refundStatusMap.put("3","办理退货中");
       refundStatusMap.put("4","退货完成");
    }

    public static int getMemberAddressLimit(){
        return  MEMBER_ADDRESS_LIMIT;
    }

    public static String getRefundStatusName(String status){
        return refundStatusMap.get(status);
    }

    /**
     * 获得订单状态
     * @param orderStatus
     * @param deliveryStatus
     * @return
     */
    public static String getOrderClientStatus(String orderStatus,String deliveryStatus){
       if(orderStatus==null||"".equals(orderStatus)){
            return "";
       }
       String status=orderStatus;
       if("2".equals(status)){
            status=status+(deliveryStatus==null?"0":deliveryStatus);
       }
       return status;
    }

    /**
     * 获得订单状态
     * @param orderStatus
     * @param deliveryStatus
     * @return
     */
    public static String getOrderClientStatus(OrderVO order){
       return  getOrderClientStatus(order.getOrderStatus(),order.getDeliveryStatus());
    }

    /**
     * 获得订单状态数字
     * @param order
     * @return
     */
    public static String getOrderNumberStatus(OrderVO order){
        String status=getOrderClientStatus(order);
        if("2-1".equals(status)||"2".equals(status)
                ||"20".equals(status)){
            status="2";
        }else if("21".equals(status)||"22".equals(status)){
            status="3";
        }else if("23".equals(status)){
            status="4";
        }else if("3".equals(status)||"4".equals(status)){
            status="5";
        }
        return status;
    }

    /**
     * 获得订单状态名称
     * @param orderStatus      订单状态
     * @param deliveryStatus   发货状态
     * @return
     */
    public static String getOrderStatusName(String orderStatus,String deliveryStatus){
        String status=getOrderClientStatus(orderStatus,deliveryStatus);
        return orderStatusMap.get(status);
    }

    /**
     * 获得订单状态名称
     * @param order   订单
     * @return
     */
    public static String getOrderStatusName(OrderVO order){
      return  getOrderStatusName(order.getOrderStatus(),order.getDeliveryStatus());
    }

    /**
     * 获得发货状态名称
     * @param status  发货状态
     * @return
     */
    public static String getDeliveryStatusName(String status){
        return deliveryStatusMap.get(status);
    }

    /**
     * 获得发货状态名称
     * @param status  发货状态
     * @return
     */
    public static String getDeliveryStatusName(OrderVO order){
        return deliveryStatusMap.get(order.getDeliveryStatus());
    }
}
