/**
 * 说明:
 *     抽象产品角色--存款明细
 * @Probject Name: design-pattern
 * @Path: product.DepositSlip.java
 * @Create By kongm
 * @Create In 2013-8-13 上午11:19:04
 * TODO
 */
package product;

/**
 * @Class Name DepositSlip
 * @Author kongm
 * @Create In 2013-8-13
 */
public interface DepositSlip {
	
	String getBankName();
	String getClientName();
	String getClientNumber();
	int getAmountOfMoney();
	

}
