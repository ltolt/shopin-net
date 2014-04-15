package net.shopin.web.tenpay;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


/**
 * 即时到帐应答类
 * ============================================================================
 * api说明：
 * getKey()/setKey(),获取/设置密钥
 * getParameter()/setParameter(),获取/设置参数值
 * getAllParameters(),获取所有参数
 * isTenpaySign(),是否财付通签名,true:是 false:否
 * doShow(),显示处理结果
 * getDebugInfo(),获取debug信息
 *
 * ============================================================================
 *
 */
public class PayResponseHandler extends ResponseHandler {

	public PayResponseHandler(HttpServletRequest request,
			HttpServletResponse response) {

		super(request, response);

	}
	
	/**
	 * 说明:
	 *     是否财付通微信扫码签名
	 * @Methods Name isTenpayWXSign
	 * @Create In 2014-1-2 By kongm
	 * @return boolean
	 */
	public boolean isTenpayWXSign(){
		//获取回传参数列表
		String bank_billno = this.getParameter("bank_billno");
		String bank_type = this.getParameter("bank_type");
		String discount = this.getParameter("discount");
		String fee_type = this.getParameter("fee_type");
		String input_charset = this.getParameter("input_charset");
		String notify_id = this.getParameter("notify_id");
		String out_trade_no = this.getParameter("out_trade_no");
		String partner = this.getParameter("partner");
		String product_fee = this.getParameter("product_fee");
		String sign_type = this.getParameter("sign_type");
		String time_end = this.getParameter("time_end");
		String total_fee = this.getParameter("total_fee");
		String trade_mode = this.getParameter("trade_mode");
		String trade_state = this.getParameter("trade_state");
		String transaction_id = this.getParameter("transaction_id");
		String transport_fee = this.getParameter("transport_fee");
		String key = this.getKey();
		String tenpayWXSign = this.getParameter("sign").toUpperCase();
		//组织签名字符串
		StringBuffer sb = new StringBuffer();
		sb.append("bank_billno="+bank_billno + "&");
		sb.append("bank_type="+bank_type + "&");
		sb.append("discount="+discount + "&");
		sb.append("fee_type="+fee_type + "&");
		sb.append("input_charset="+input_charset + "&");
		sb.append("notify_id="+notify_id + "&");
		sb.append("out_trade_no="+out_trade_no + "&");
		sb.append("partner="+partner + "&");
		sb.append("product_fee="+product_fee + "&");
		sb.append("sign_type="+sign_type + "&");
		sb.append("time_end="+time_end + "&");
		sb.append("total_fee="+total_fee + "&");
		sb.append("trade_mode="+trade_mode + "&");
		sb.append("trade_state="+trade_state + "&");
		sb.append("transaction_id="+transaction_id + "&");
		sb.append("transport_fee="+transport_fee + "&");
		sb.append("key=" + key);
		String enc = TenpayUtil.getCharacterEncoding(
				this.getHttpServletRequest(), this.getHttpServletResponse());
		//算出摘要
		String sign = MD5Util.MD5Encode(sb.toString(), enc).toUpperCase();
		//debug信息
		this.setDebugInfo(sb.toString() + " => sign:" + sign +
						" tenpaySign:" + tenpayWXSign);

		return tenpayWXSign.equals(sign);
	}
	
	

	/**
	 * 是否财付通签名
	 * @Override
	 * @return boolean
	 */
	public boolean isTenpaySign() {

		//获取参数
		String cmdno = this.getParameter("cmdno");
		String pay_result = this.getParameter("pay_result");
		String date = this.getParameter("date");
		String transaction_id = this.getParameter("transaction_id");
		String sp_billno = this.getParameter("sp_billno");
		String total_fee = this.getParameter("total_fee");
		String fee_type = this.getParameter("fee_type");
		String attach = this.getParameter("attach");
		String key = this.getKey();
		String tenpaySign = this.getParameter("sign").toLowerCase();

		//组织签名串
		StringBuffer sb = new StringBuffer();
		sb.append("cmdno=" + cmdno + "&");
		sb.append("pay_result=" + pay_result + "&");
		sb.append("date=" + date + "&");
		sb.append("transaction_id=" + transaction_id + "&");
		sb.append("sp_billno=" + sp_billno + "&");
		sb.append("total_fee=" + total_fee + "&");
		sb.append("fee_type=" + fee_type + "&");
		sb.append("attach=" + attach + "&");
		sb.append("key=" + key);

		String enc = TenpayUtil.getCharacterEncoding(
				this.getHttpServletRequest(), this.getHttpServletResponse());
		//算出摘要
		String sign = MD5Util.MD5Encode(sb.toString(), enc).toLowerCase();

		//debug信息
		this.setDebugInfo(sb.toString() + " => sign:" + sign +
				" tenpaySign:" + tenpaySign);

		return tenpaySign.equals(sign);
	}

}
