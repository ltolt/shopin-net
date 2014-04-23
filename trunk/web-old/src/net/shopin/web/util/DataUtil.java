package net.shopin.web.util;

import net.shopin.view.OrderDetailVO;
import net.shopin.view.OrderVO;

import java.util.List;

/**
 * Created by IntelliJ IDEA.
 * User: kongming
 * Date: 12-8-10
 * Time: 下午6:47
 * To change this template use File | Settings | File Templates.
 */
public class DataUtil {

    public static String converOrderVOToJson(OrderVO order){
         StringBuffer sb = new StringBuffer();
            sb.append("{'order':{");
            sb.append("'orderId':'" +  (order.getOrderId() != null?order.getOrderId():"" )
                    + "','membersSid':'" + (order.getMembersSid() !=null?order.getMembersSid():"")
                           + "','orderNo':'" + (order.getOrderNo()!=null?order.getOrderNo():"")
                           + "','sendCost':'" + (order.getSendCost()!=null?order.getSendCost():"")
                           + "','orderStatus':'" + (order.getOrderStatus() != null?order.getOrderStatus():"" )
                           + "','orderClientStatus':'" + (order.getOrderClientStatus() != null ? order.getOrderClientStatus():"")
                           + "','orderStatusName':'" + (order.getOrderStatusName()!=null?order.getOrderStatusName():"")
                           + "','deliveryStatus':'" + (order.getDeliveryStatus() != null ?order.getDeliveryStatus():"")
                           + "','deliveryStatusName':'" + (order.getDeliveryStatusName() != null ? order.getDeliveryStatusName():"")
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
                           + "','paymentModeSid':'" + (order.getPaymentModeSid()!= null?order.getPaymentModeSid():"")
                           + "','paymentModeName':'" + (order.getPaymentModeName()!= null?order.getPaymentModeName():"")
                           + "','paymentPhone':'" + (order.getPaymentPhone() != null?order.getPaymentPhone():"")
                           + "','sendType':'" + (order.getSendType() != null?order.getSendType():"")
                           + "','sendTypeName':'" + (order.getSendTypeName() != null?order.getSendTypeName():"")
                           + "','memo':'" + (order.getMemo()!= null?order.getMemo():"")
                           + "','quickBuyFlag':'" + (order.getQuickBuyFlag() != null?order.getQuickBuyFlag():"")
                           + "','orderRefunIf':'" + (order.getOrderRefunIf() != null?order.getOrderRefunIf():"")
                           + "','orderRefunBit':'" + (order.getOrderRefunBit() != null?order.getOrderRefunBit():"")
                           + "','customerDesc':'" + (order.getCustomerDesc() != null?order.getCustomerDesc():"")
                           + "','orderSourceSid':'" + (order.getOrderSourceSid() != null?order.getOrderSourceSid():"")
                           + "','externalLinks':'" + (order.getExternalLinks() != null?order.getExternalLinks():"")
                           + "','saleMoneySum':'" + (order.getSaleMoneySum() != null?order.getSaleMoneySum():"")
                           + "','saleTotalSum':'" + (order.getSaleTotalSum() != null?order.getSaleTotalSum():"")
                           + "','saleTotalQty':'" + (order.getSaleTotalQty() != null?order.getSaleTotalQty():"")
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
                           + "','orderSource':'" + (order.getOrderSource() != null?order.getOrderSource():"")
                           + "','defaultBank':'" + (order.getDefaultbank() != null?order.getDefaultbank():"")
		                   + "','orderDetails':[" );

            List<OrderDetailVO> orderDetailVOList = order.getOrderDetails();
            if(orderDetailVOList!=null&&orderDetailVOList.size()>0){
			for (int i = 0; i < orderDetailVOList.size(); i++) {

				OrderDetailVO orderDetailVO = orderDetailVOList.get(i);

				sb.append("{'proSid':'" + (orderDetailVO.getProSid() != null ? orderDetailVO.getProSid():"")
						+ "','proDetailSid':'" + (orderDetailVO.getProDetailSid()!=null?orderDetailVO.getProDetailSid():"")
						+ "','proSku':'" + (orderDetailVO.getProSku()!=null?orderDetailVO.getProSku():"")
						+ "','proName':'" + (orderDetailVO.getProName()!=null?orderDetailVO.getProName():"")
						+ "','proSize':'" + (orderDetailVO.getProSize()!=null?orderDetailVO.getProSize():"")
						+ "','proColor':'" + (orderDetailVO.getProColor()!=null?orderDetailVO.getProColor():"")
						+ "','proColorName':'" + (orderDetailVO.getProColorName()!=null?orderDetailVO.getProColorName():"")
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
						+ "','memo':'" + (orderDetailVO.getMemo()!=null?orderDetailVO.getMemo():"")
						+ "','positionId':'" + (orderDetailVO.getPositionId()!=null?orderDetailVO.getPositionId():"")
						+ "','allowRefunNum':'" + (orderDetailVO.getAllowRefunNum()!=null?orderDetailVO.getAllowRefunNum():"")
						+ "','refunCausebyinner':'" + (orderDetailVO.getRefunCausebyinner()!=null?orderDetailVO.getRefunCausebyinner():"")
						+ "','channelId':'"+ "1" +"'}");

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



}
