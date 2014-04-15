package net.shopin.web.util;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.lang.StringUtils;

import net.shopin.view.OrderDetailVO;
import net.shopin.view.OrderVO;

/**
 * Created by IntelliJ IDEA.
 * User: kongming
 * Date: 12-8-10
 * Time: 下午6:47
 * To change this template use File | Settings | File Templates.
 */
public class DataUtil {

    public static String converOrderVOToJson(OrderVO order,String memberEmail){
         StringBuffer sb = new StringBuffer();
            sb.append("{'fromSystem':'WEB','order':{");
            sb.append("'sid':'" +  (order.getOrderId() != null?order.getOrderId():"" )
                    + "','memberSid':'" + (order.getMembersSid() !=null?order.getMembersSid():"")
                    + "','memberEmail':'" + (memberEmail !=null?memberEmail:"")
                           + "','orderNo':'" + (order.getOrderNo()!=null?order.getOrderNo():"")
                           + "','orderStatus':'" + (order.getOrderStatus() != null?order.getOrderStatus():"" )
                           + "','sendCost':'" + (order.getSendCost()!=null?order.getSendCost():"")
                           + "','saleTime':'" + (order.getSaleTime() != null ?order.getSaleTime():"")
                           + "','saleName':'" + (order.getSaleName() != null?order.getSaleName():"")
                           + "','invoiceBit':'" + (order.getInvoiceBit() != null?order.getInvoiceBit():"")
                           + "','invoiceName':'" + (order.getInvoiceName() != null?order.getInvoiceName():"")
                           + "','invoiceDesc':'" + (order.getInvoiceDesc() != null?order.getInvoiceDesc():"")
                           + "','receptName':'" + (order.getReceptName() != null?order.getReceptName():"")
                           + "','receptAddress':'" + (order.getReceptAddress() != null?order.getReceptAddress():"")
                           + "','receptPhone':'" + (order.getReceptPhone() != null?order.getReceptPhone():"")
                           + "','inceptPostcode':'" + (order.getInceptPostcode() != null?order.getInceptPostcode():"")
                           + "','inceptProvinceSid':'" + (order.getInceptProvinceSid() != null?order.getInceptProvinceSid():"")
                           + "','inceptProvince':'" + (order.getInceptProvince() != null?order.getInceptProvince():"")
                           + "','inceptCitySid':'" + (order.getInceptCitySid()!= null?order.getInceptCitySid():"")
                           + "','inceptCity':'" + (order.getInceptCity()!= null?order.getInceptCity():"")
                           + "','inceptArea':'" + (order.getInceptArea()!= null?order.getInceptArea():"")
                           + "','inceptCompany':'" + (order.getInceptCompany()!= null?order.getInceptCompany():"")
                           + "','paymentTypeSid':'" + (order.getPaymentModeSid()!= null?order.getPaymentModeSid():"")
                           + "','paymentTypeDesc':'" + (order.getPaymentModeName()!= null?order.getPaymentModeName():"")
                           + "','paymentPhone':'" + (order.getPaymentPhone() != null?order.getPaymentPhone():"")
                           + "','sendType':'" + (order.getSendType() != null?order.getSendType():"")
                           + "','sendTypeDesc':'" + (order.getSendTypeName() != null?order.getSendTypeName():"")
                           + "','memo':'" + (order.getMemo()!= null?order.getMemo():"")
                           + "','orderRefundIf':'" + (order.getOrderRefunIf() != null?order.getOrderRefunIf():"")
                           + "','orderRefundBit':'" + (order.getOrderRefunBit() != null?order.getOrderRefunBit():"")
                           + "','customerDesc':'" + (order.getCustomerDesc() != null?order.getCustomerDesc():"")
                           + "','orderSourceSid':'" + (order.getOrderSourceSid() != null?order.getOrderSourceSid():"")
                           + "','externalLink':'" + (order.getExternalLinks() != null?order.getExternalLinks():"")
                           + "','saleMoneySum':'" + (order.getSaleMoneySum() != null?order.getSaleMoneySum():"")
                           + "','paytime':'" + (order.getPaytime() != null?order.getPaytime():"")
                           + "','payRealName':'" + (order.getPayRealName() != null?order.getPayRealName():"")
                           + "','payUserName':'" + (order.getPayUserName() != null?order.getPayUserName():"")
                           + "','deliverySid':'" + (order.getDeliverySid() != null?order.getDeliverySid():"")
                           + "','refundFrtBit':'" + (order.getRefundFrtBit() != null?order.getRefundFrtBit():"")
                           + "','refundFrtDirection':'" + (order.getRefundFrtDirection() != null?order.getRefundFrtDirection():"")
                           + "','optUserSid':'" + (order.getOptUserSid() != null?order.getOptUserSid():"")
                           + "','optRealName':'" + (order.getOptRealName() != null?order.getOptRealName():"")
                           + "','ltype':'" + (order.getLtype() != null?order.getLtype():"")
                           + "','ltinfo':'" + (order.getLtinfo() != null?order.getLtinfo():"")
                           + "','optUpdateTime':'" + (order.getOptUpdateTime() != null?order.getOptUpdateTime():"")
                           + "','defaultBank':'" + (order.getDefaultBank() != null?order.getDefaultBank():"")
                           + "','bookFlag':'" + (order.getBookFlag()!=null?order.getBookFlag() : "")
		                   + "','sn':'" + (order.getSn()!=null?order.getSn():"")
		                   + "','fromWebVersion':'1"
                           + "','orderDetails':[" );

            List<OrderDetailVO> orderDetailVOList = order.getOrderDetails();
            if(orderDetailVOList!=null&&orderDetailVOList.size()>0){
			for (int i = 0; i < orderDetailVOList.size(); i++) {

				OrderDetailVO orderDetailVO = orderDetailVOList.get(i);

				sb.append("{'sid':'"
						+ "','proSid':'" + (orderDetailVO.getProSid()!=null?orderDetailVO.getProSid():"")
						+ "','proDetailSid':'" + (orderDetailVO.getProDetailSid()!=null?orderDetailVO.getProDetailSid():"")
						+ "','proSku':'" + (orderDetailVO.getProSku()!=null?orderDetailVO.getProSku():"")
						+ "','productName':'" + (handleSingleQuotation(orderDetailVO.getProName()))
						+ "','proSize':'" + (orderDetailVO.getProSize()!=null?orderDetailVO.getProSize():"")
						+ "','proColor':'" + (orderDetailVO.getProColor()!=null?orderDetailVO.getProColor():"")
						+ "','proColorName':'" + (orderDetailVO.getProColorName()!=null?orderDetailVO.getProColorName():"")
						+ "','proPicture':'" + (orderDetailVO.getProPicture()!=null?orderDetailVO.getProPicture():"")
						+ "','proPrice':'" + (orderDetailVO.getProPrice()!=null?orderDetailVO.getProPrice():"")
						+ "','salePrice':'" + (orderDetailVO.getSalePrice()!=null?orderDetailVO.getSalePrice():"")
						+ "','saleSum':'" + (orderDetailVO.getSaleSum()!=null?orderDetailVO.getSaleSum():"")
						+ "','storeSum':'" + (orderDetailVO.getStoreSum()!=null?orderDetailVO.getStoreSum():"")
						+ "','refundNum':'" + (orderDetailVO.getRefundNum()!=null?orderDetailVO.getRefundNum():"")
						+ "','brandSid':'" + (orderDetailVO.getBrandSid()!=null?orderDetailVO.getBrandSid():"")
						+ "','brandName':'" + (orderDetailVO.getBrandName()!=null?orderDetailVO.getBrandName():"")
						+ "','originalPrice':'" + (orderDetailVO.getOriginalPrice()!=null?orderDetailVO.getOriginalPrice():"")
						+ "','currentPrice':'" + (orderDetailVO.getCurrentPrice()!=null?orderDetailVO.getCurrentPrice():"")
						+ "','promotionPrice':'" + (orderDetailVO.getPromotionPrice()!=null?orderDetailVO.getPromotionPrice():"")
						+ "','shopPrice':'" + (orderDetailVO.getShopPrice()!=null?orderDetailVO.getShopPrice():"")
						+ "','memo':'" + (orderDetailVO.getMemo()!=null?orderDetailVO.getMemo():"")
						+ "','positionId':'" + (orderDetailVO.getPositionId()!=null?orderDetailVO.getPositionId():"")
						+ "','allowrefundnum':'" + (orderDetailVO.getAllowRefunNum()!=null?orderDetailVO.getAllowRefunNum():"")
						+ "','refundCausebyinner':'" + (orderDetailVO.getRefunCausebyinner()!=null?orderDetailVO.getRefunCausebyinner():"")
						+"','quickBuyBit':'" + (orderDetailVO.getQuickBuyBit()!=null?orderDetailVO.getQuickBuyBit():"0")
						+ "','channelId':'1'}");

				if (i != orderDetailVOList.size() - 1) {

					sb.append(',');
				}

			}
			sb.append("]}}");
		}
		else{
			sb.append("]}}");
		}

           return  sb.toString();

    }
    
    /**
     * 向oms传送json串时，如果内容里面包含单引号  会破坏整个json的结构，处理单引号的问题
     * @return
     */
    public static String handleSingleQuotation(String originalValue){
    	String result = null;
    	if (StringUtils.isEmpty(originalValue)) {
    		result = "";
		}else if(!originalValue.contains("'")) {
			result = originalValue;
		}else {
			result = originalValue.replaceAll("'", "\\\\'");
		}
    	return result;
    }

public static void main(String[] args) {
	OrderVO ordervo = new OrderVO();
	OrderDetailVO odv = new OrderDetailVO();
	odv.setProName("2323");
	List<OrderDetailVO> details = new ArrayList<OrderDetailVO>();
	details.add(odv);
	ordervo.setOrderDetails(details);
	System.out.println(converOrderVOToJson(ordervo, ""));
}

}
