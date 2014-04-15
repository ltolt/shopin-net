package com.shopin.modules.rules;

import org.drools.WorkingMemory;
import org.drools.runtime.StatefulKnowledgeSession;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

/**
 * 使用JBossRules的订单计价类.
 *
 */
public class OrderPricer {

	private DroolsTemplate pricingTemplate;

	/**
	 * 订单运行规则引擎计价的主函数.
	 */
	public void pricing(Order order) {

		StatefulKnowledgeSession wm = pricingTemplate.getSession(order);
		//注入本类,提供各种简便函数供规则中使用
		if(wm.getGlobal("pricer")==null)
			wm.setGlobal("pricer", this);
		wm.fireAllRules();
	}

	/**
	 * 订单打折的简便函数,供规则中使用.
	 */
	public void discount(Order order, double discount) {
        order.setTotalPrice(order.getTotalPrice() * discount / 100);
	}

	public void setPricingTemplate(DroolsTemplate pricingTemplate) {
		this.pricingTemplate = pricingTemplate;
	}

    public static void main(String[] args) {
        ApplicationContext ctx = new ClassPathXmlApplicationContext("applicationContext-drools.xml");
        //ApplicationContext ctx = new FileSystemXmlApplicationContext("D:\\svn\\web\\base\\test\\applicationContext-drools.xml");
        OrderPricer orderPricer =  new OrderPricer();
        orderPricer.pricingTemplate = (DroolsTemplate)ctx.getBean("droolsTemplate");
        Order order = new Order();
        order.setTotalPrice(99);
        orderPricer.pricing(order);
        System.out.println("----"+order.getTotalPrice());
    }

}

