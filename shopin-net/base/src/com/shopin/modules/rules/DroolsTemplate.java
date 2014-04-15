package com.shopin.modules.rules;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.drools.runtime.StatefulKnowledgeSession;
import org.drools.runtime.rule.FactHandle;
import org.drools.KnowledgeBase;
import org.drools.KnowledgeBaseFactory;
import org.drools.io.ResourceFactory;
import org.drools.builder.KnowledgeBuilder;
import org.drools.builder.KnowledgeBuilderFactory;
import org.drools.builder.ResourceType;
import org.springframework.context.ResourceLoaderAware;
import org.springframework.core.io.Resource;
import org.springframework.core.io.ResourceLoader;
import org.springframework.core.io.support.ResourcePatternResolver;
import org.springframework.core.io.support.ResourcePatternUtils;

public class DroolsTemplate implements ResourceLoaderAware {

	private static final Log log = LogFactory.getLog(DroolsTemplate.class);

	private StatefulKnowledgeSession session;

	private Resource dslFile;

	private ResourceLoader resourceLoader;

	private KnowledgeBase ruleBase;

	private String[] ruleFiles;

    /**
	 * 返回RuleBase当前的WorkingMemory,并注入相关事实.
	 *
	 * @param assertObjects 注入的事实,变长参数支持多种输入方式.
	 */
	public StatefulKnowledgeSession getSession(Object... assertObjects) {
		if (session == null)
			session = getRuleBase().newStatefulKnowledgeSession();

		for (Object object : assertObjects) {
			assertObject(session, object);
		}
		return session;
	}

	/**
	 * 从RuleBase生成新的WorkingMemory,并注入相关事实. 生成新的WorkingMemory,而不是当前WorkingMemory,主要用于动态增减规则.
	 *
	 * @param assertObjects 注入的事实,变长参数支持多种输入方式.
	 */
	public StatefulKnowledgeSession getNewSession(Object... assertObjects) {
		StatefulKnowledgeSession knowledgeSession = getRuleBase().newStatefulKnowledgeSession();
		for (Object object : assertObjects) {
			assertObject(knowledgeSession, object);
		}
		return knowledgeSession;
	}

	/**
	 * 往knowledgeSession中注入事实的函数,如果knowledgeSession中已存在该事实,进行更新.
	 */
	public void assertObject(StatefulKnowledgeSession knowledgeSession, Object element) {
		if (element == null)
			return;

		FactHandle fact = knowledgeSession.getFactHandle(element);
		if (fact == null) {
			knowledgeSession.insert(element);
		} else {
			knowledgeSession.update(fact, element);
		}
	}

	private KnowledgeBase getRuleBase() {

		if (ruleBase == null)
			try {
				compileRuleBase();
			} catch (Exception e) {
				log.error(e.getMessage(), e);
			}
		return ruleBase;
	}

	/**
	 * 根据ruleFiles编译RuleBase.
	 */
	private void compileRuleBase() throws Exception {
        KnowledgeBuilder kbuilder = KnowledgeBuilderFactory.newKnowledgeBuilder();
		ruleBase = KnowledgeBaseFactory.newKnowledgeBase(); 
		if (ruleFiles != null) {
			// 读入DRL
			ResourcePatternResolver resolver = ResourcePatternUtils.getResourcePatternResolver(resourceLoader);
			for (String rulePattern : ruleFiles) {
				Resource[] rules = resolver.getResources(rulePattern);
				for (Resource ruleFile : rules) {
					kbuilder.add(ResourceFactory.newUrlResource(ruleFile.getURL()),ResourceType.DRL);
				}
			}
			ruleBase.addKnowledgePackages(kbuilder.getKnowledgePackages());
		} else
			log.warn("DroolsTemplate didn't set the rule files");
	}

	public void setDslFile(Resource dslFile) {
		this.dslFile = dslFile;
	}

	public void setResourceLoader(ResourceLoader resourceLoader) {
		this.resourceLoader = resourceLoader;
	}

	public void setRuleFiles(String[] ruleFiles) {
		this.ruleFiles = ruleFiles;
	}

}

