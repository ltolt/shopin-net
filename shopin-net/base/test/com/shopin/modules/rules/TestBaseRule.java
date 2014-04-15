package com.shopin.modules.rules;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.drools.WorkingMemory;
import org.drools.runtime.StatefulKnowledgeSession;

/**
 * Created by IntelliJ IDEA.
 * User: yanwt
 * Date: 2009-8-21
 * Time: 13:25:52
 */
public class TestBaseRule {
    public static void main(String[] args) {
        ApplicationContext ctx = new ClassPathXmlApplicationContext("applicationContext-drools.xml");
        DroolsTemplate droolsTemplate = (DroolsTemplate)ctx.getBean("droolsTemplate");
        Account account = new Account();
        account.setBalance(90);
        droolsTemplate.getSession(account).fireAllRules();
    }
}
