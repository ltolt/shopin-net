/**
 * 说明:
 *     具体产品角色--
 * @Probject Name: design-pattern
 * @Path: product.concrete.DepositSlip1.java
 * @Create By kongm
 * @Create In 2013-8-13 上午11:24:19
 * TODO
 */
package product.concrete;

import product.DepositSlip;

/**
 * @Class Name DepositSlip1
 * @Author kongm
 * @Create In 2013-8-13
 */
public class DepositSlip1 implements DepositSlip {
	
	String clientNumber;
	String clientName;
	int money;
	
	
	
	
	public DepositSlip1(String clientNumber, String clientName, int money) {
		this.clientNumber = clientNumber;
		this.clientName = clientName;
		this.money = money;
	}

	/* (non-Javadoc)
	 * @see product.DepositSlip#getBankName()
	 */
	@Override
	public String getBankName() {
		// TODO Auto-generated method stub
		return "中国银行";
	}

	/* (non-Javadoc)
	 * @see product.DepositSlip#getClientName()
	 */
	@Override
	public String getClientName() {
		// TODO Auto-generated method stub
		return clientName;
	}

	/* (non-Javadoc)
	 * @see product.DepositSlip#getClientNumber()
	 */
	@Override
	public String getClientNumber() {
		// TODO Auto-generated method stub
		return clientNumber;
	}

	/* (non-Javadoc)
	 * @see product.DepositSlip#getAmountOfMoney()
	 */
	@Override
	public int getAmountOfMoney() {
		// TODO Auto-generated method stub
		return money;
	}

}
