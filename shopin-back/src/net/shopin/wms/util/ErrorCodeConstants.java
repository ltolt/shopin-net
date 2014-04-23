package net.shopin.wms.util;
/**
 * 说明:
 * @author guansq
 * @date 2012-12-10 下午02:56:48
 * @modify 
 */
public class ErrorCodeConstants {
	public enum ErrorCode {
		/**
		 * 错误编码规范：
		 * 长度：7位 00 0 00 00
		 * 含义：
		 * 		12位：系统，订单系统是21
		 * 		3位：消息等级，默认为1
		 * 		45位：模块，oms_core(01) oms_sdc(02) oms_admin(03) oms_erp(04)
		 * 		67位：具体错误
		 * 		系统异常：2110001-2110099
		 */
		/*21100***/
		SYSTEM_ERROR("2110001", "系统运行异常！"), 
		PARAM_ERROR("2110002", "参数不正确！"), 
		RESULT_IS_NULL_ERROR("2110003", "查询结果为空！"),
		DUPLICATE_KEY_ERROR("2110004", "主键已存在！"),
		UNDER_STOCK_ERROR("2110101", "库存不足！"),
		CALL_SSD_ERROR_URL("2110005", "调用SSD系统异常！"),
		NEED_REFUND_APPLY_ERROR("2110102", "未申请退货，不能退货！"),
		REFUND_SUM_BIG_THEN_APPLY_SUM_ERROR("2110103", "实际退货数量大于申请退货数量！"),
		REFUND_SUM_BIG_THEN_SALE_SUM_ERROR("2110104", "退货数量大于购买数量！"),
		REFUND_STATUS_NOT_RIGHT_ERROR("2110105", "不能取消退货单，退货单已处理或已作废！"),
		CANCEL_ORDER_ERROR("2110106","取消订单失败,订单不能取消!"),
		CALL_POS_RO_ERROR("2110006", "调用POS-RO系统异常！"),
		PRICE_CHEANGE_ERROR("2110107", "价格有变化，修改订单失败！");
		
		private String errorCode;
		private String memo;
		private ErrorCode() {};
		private ErrorCode(String errorCode, String memo) {
			this.errorCode = errorCode;
			this.memo = memo;
		}
		public String getErrorCode() {
			return errorCode;
		}
		public void setErrorCode(String errorCode) {
			this.errorCode = errorCode;
		}
		public String getMemo() {
			return memo;
		}
		public void setMemo(String memo) {
			this.memo = memo;
		}
	}
}
