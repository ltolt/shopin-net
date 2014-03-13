
package com.interface21.context.support;

import java.util.Date;
import java.util.HashMap;
import java.util.Locale;
import java14.java.util.logging.Logger;

import com.interface21.beans.BeansException;
import com.interface21.beans.factory.ListableBeanFactory;
import com.interface21.beans.factory.NoSuchBeanDefinitionException;
import com.interface21.context.*;
import com.interface21.util.StringUtils;


/**
 * Partial implementation of ApplicationContext. Doesn't mandate the
 * type of storage used for configuration, but implements common functionality.
 * <br/>This class uses the <b>template method</b> design pattern, requiring
 * concrete subclasses to implement protected abstract methods.
 * <p/>WHAT DO SUBCLASSES HAVE TO DO?
 * call refresh, i think
 * @author  Rod Johnson
 * @since January 21, 2001
 * @version $Revision: 1.1.1.1 $
 */
public abstract class AbstractApplicationContext implements ApplicationContext {
	
	/** Name of the MessageSource bean in the bean factory */	
	public static final String MESSAGE_SOURCE_BEAN_NAME = "messageSource";
	
	//---------------------------------------------------------------------
	// Instance data
	//---------------------------------------------------------------------
	/** Log4j category used by this class. Available to subclasses. */
	protected final Logger logger = Logger.getLogger(getClass().getName());
	
	/** Parent context */
	private ApplicationContext parent;
	
	/** Helper class used in event publishing */
	private ApplicationEventMulticaster  eventMulticaster = new ApplicationEventMulticasterImpl();
	
	/** We use this to prevent reloading if it's been forbidden in the config itself */
	private boolean loaded;
	
	
	private MessageSource	messageSource;
	
	private long	startupTime;
	
	/** Special bean to handle configuration */
	private ContextOptions contextOptions;
	
	/** Default display name */
	private String displayName = getClass().getName() + ";hc=" + hashCode();
	
	/** Hash table of shared objects, keyed by String key passed
	 * in shared object method calls
	 */
	private HashMap sharedObjects = new HashMap();
	
	//---------------------------------------------------------------------
	// Constructors
	//---------------------------------------------------------------------
	/** Creates a new AbstractApplicationContext */
	public AbstractApplicationContext() {
	}
	
	public AbstractApplicationContext(ApplicationContext parent) {
		this.parent = parent;
	}
	
	//---------------------------------------------------------------------
	// Implementation of ApplicationContext
	//---------------------------------------------------------------------
	/** Friendly name for context
	 * @return a display name for the context
	*/
	public String getDisplayName() {
		return displayName;
	}
	
	/**
	 *  To avoid endless constructor chaining, only concrete classes
	 * take this in their constructor, and then invoke this method
	 */
	protected void setDisplayName(String displayName) {
		this.displayName = displayName;
	}
	
	/** Return the parent context, or null if there is no parent,
	 * and this is the root of the context hierarchy.
	 * @return the parent context, or null if there is no parent
	 */
	public ApplicationContext getParent() {
		return parent;
	}
	
	/**
	 * Subclasses may call this to set parent after constructor.
	 * Note that parent shouldn't be changed: it may only be
	 * set later if necessary.
	 * @param ac parent
	 */
	protected void setParent(ApplicationContext ac) {
		this.parent = ac;
	}

	/** 
	 * Load or reload configuration.
	 * @throws ApplicationContextException if the configuration was invalid or couldn't
	 * be found, or if configuration has already been loaded and reloading is
	 * forbidden
	 * DYNAMIC CLASSLOADER ISSUE...subclass to get classloader!?
	 */
	public final void refresh() throws ApplicationContextException {
		if (contextOptions!= null && !contextOptions.isReloadable())
			throw new ApplicationContextException("Forbidden to reload config");
		
		this.startupTime = System.currentTimeMillis();		
		
		refreshBeanFactory();
		
		try {
			loadOptions();
		}
		catch (BeansException ex) {
			throw new ApplicationContextException("Unexpected error loading context options", ex);
		}						
		
		try {
			this.messageSource = (MessageSource) getBeanFactory().getBean(MESSAGE_SOURCE_BEAN_NAME);
		}
		catch (BeansException ex) {
			logger.config("No MessageSource defined in ApplicationContext: using parent's");
			this.messageSource = this.parent;
			if (this.messageSource == null)
				throw new ApplicationContextException("No MessageSource defined in WebApplicationContext and no parent", ex);
		}
		if ((this.messageSource instanceof NestingMessageSource) && this.parent != null) {
			( (NestingMessageSource) messageSource).setParent(this.parent);
		}
		refreshListeners();				
		configureAllManagedObjects();
	}	// refresh
	
	
	/** BeanFactory must be loaded before this method is called
	 */
	private void loadOptions() throws BeansException {
		if (this.contextOptions == null) {
			// Try to load from bean
			try {
				this.contextOptions = (ContextOptions) getBeanFactory().getBean(OPTIONS_BEAN_NAME);
			}
			catch (NoSuchBeanDefinitionException ex) {
				this.contextOptions = ContextOptions.DEFAULT_OPTIONS;
			}
		}
	}
	
	
	/**
	 * Prototypes need special treatment in getBean
	 * BIT OF  A HACK TO ENSURE THAT ALL OBJECTS ARE CONFIGURED
	 * EVEN IF NEFER GOIT BY NAME
	 * SHOULDN'T REALLY DO THIS TO A PROTOTYPE
	 */
	private void configureAllManagedObjects() throws ApplicationContextException {
		logger.config("Refreshing listeners");
		String[] beanNames = getBeanDefinitionNames();
		logger.fine("Found " + beanNames.length + " listeners in bean factory; names=" + 
		StringUtils.arrayToDelimitedString(beanNames, ",") + "]");
		for (int i = 0; i < beanNames.length; i++) {
			String beanName = beanNames[i];
			try {
				Object bean = getBeanFactory().getBean(beanName);
				configureManagedObject(bean);
			}
			catch (BeansException ex) {
				throw new ApplicationContextException("Couldn't instantiate object with name '" + beanName+ "'", ex);
			}
		}
	}	// refreshListeners

	/**
	 * Add beans that implement listener as listeners
	 * Doesn't affect other listeners, that can be added without being beans
	 */
	private void refreshListeners() throws ApplicationContextException {
		logger.config("Refreshing listeners");
		String[] listenerNames = getBeanDefinitionNames(ApplicationListener.class);
		logger.fine("Found " + listenerNames.length + " listeners in bean factory; names=" + 
			StringUtils.arrayToDelimitedString(listenerNames, ",") + "]");
		for (int i = 0; i < listenerNames.length; i++) {
			String beanName = listenerNames[i];
			try {
				Object bean = getBeanFactory().getBean(beanName);
				ApplicationListener l = (ApplicationListener) bean;
				configureManagedObject(l);
				addListener(l);
				logger.config("Bean listener added: [" + l + "]");
			}
			catch (BeansException ex) {
				throw new ApplicationContextException("Couldn't load config listener with name '" + beanName+ "'", ex);
			}
		}
	}	// refreshListeners
	

	
	/** Publish the given event to all listeners
	 * @param e event to publish. The event may be application-specific,
	 * or a standard framework event
	 */
	public final void publishEvent(ApplicationEvent e) {
		this.eventMulticaster.onApplicationEvent(e);
		if (this.parent != null)
			parent.publishEvent(e);
	}
	
	/**
	 * Return context options. These control reloading etc.
	 * @return context options
	 */
	public final ContextOptions getOptions() {
		return this.contextOptions;
	}
	
	/** Return the timestamp when this context was first loaded
	 * @return the timestamp (ms) when this context was first loaded
	 */
	public final long getStartupDate() {
		return startupTime;
	}
	
	/** 
	 * Add a listener. Any beans that are listeners are
	 * automatically added.
	 */
	protected void addListener(ApplicationListener l) {
		eventMulticaster.addApplicationListener(l);
	}
	
	//---------------------------------------------------------------------
	// Implementation of MessageSource
	//---------------------------------------------------------------------
	/**
	 * Try to resolve the message.Return default message if no message
	 * was found
	 * @param code code to lookup up, such as 'calculator.noRateSet'
	 * @param locale Locale in which to do lookup
	 * @param defaultMessage String to return if the lookup fails
	 * @return a resolved message if the lookup is successful; 
	 * otherwise return the default message passed as a parameter
	 */
	public String getMessage(String code, Locale locale, String defaultMessage) {
		return messageSource.getMessage(code, locale, defaultMessage);
	}
	
	/**
	 * Try to resolve the message. Treat as an error if the message can't
	 * be found.
	 * @param code code to lookup up, such as 'calculator.noRateSet'
	 * @param locale Locale in which to do lookup
	 * @return message
	 * @throws NoSuchMessageException not found in any locale
	 */
	public String getMessage(String code, Locale locale) throws NoSuchMessageException {
		return messageSource.getMessage(code, locale);
	}
	
	
	//---------------------------------------------------------------------
	// Implementation of BeanFactory
	//---------------------------------------------------------------------
	/**
	 * Try to find the bean instance in the hierarchy
	 * @see BeanFactory#getBeanInstance(String)
	 */
	public Object getBean(String name) throws BeansException {
		try {
			Object bean = getBeanFactory().getBean(name);
			configureManagedObject(bean);
			return bean;
		}
		catch (NoSuchBeanDefinitionException ex) {
			// Not found here: let's check parent
			// A more serious exception can just be rethrown
			if (this.parent != null)
				return parent.getBean(name);
		}
		throw new NoSuchBeanDefinitionException(name);
	}


	/**
	 * @see BeanFactory#getBeanInstance(String, Class)
	 */
	public Object getBean(String name, Class requiredType) throws BeansException {
		try {
			Object bean = getBeanFactory().getBean(name, requiredType);
			configureManagedObject(bean);
			return bean;
		}
		catch (NoSuchBeanDefinitionException ex) {
			// Not found here: let's check parent
			// A more serious exception can just be rethrown
			if (this.parent != null)
				return parent.getBean(name, requiredType);
		}
		throw new NoSuchBeanDefinitionException(name);
	}


	
	
	/**
	 * @see ApplicationContext#sharedObject(String)
	 */
	public synchronized Object sharedObject(String key) {
		return sharedObjects.get(key);
	}

	/**
	 * @see ApplicationContext#shareObject(String, Object)
	 */
	public synchronized void shareObject(String key, Object o) {
		logger.info("Set shared object '" + key + "'");
		sharedObjects.put(key, o);
	}
	
	/**
	 * @see ApplicationContext#removeSharedObject(String)
	 */
	public synchronized Object removeSharedObject(String key) {
		logger.info("Removing shared object '" + key + "'");
		Object o = sharedObjects.remove(key);
		if (o == null) {
			logger.warning("Shared object '" + key + "' not present; could not be removed");
		}
		else {
			logger.info("Removed shared object '" + key + "'");
		}
		return o;
		//return sharedObjects.remove(key);
	}
	
	
	/** If the object is context-aware, give it a reference to this object
	 */
	protected void configureManagedObject(Object o) throws ApplicationContextException {
		if (o instanceof ApplicationContextAware) {
			logger.fine("Setting application context on ApplicationContextAware object [" + o + "]");
			ApplicationContextAware aca = (ApplicationContextAware) o;
			if (aca.getApplicationContext() == null) {
				aca.setApplicationContext(this);
			}
		}
	}
	
	//---------------------------------------------------------------------
	// Implementation of ListableBeanFactory
	//---------------------------------------------------------------------
	/**
	 * @see ListableBeanFactory#getBeanDefinitionNames()
	 */
	public String[] getBeanDefinitionNames() {
		return getBeanFactory().getBeanDefinitionNames();
	}


	/**
	 * @see ListableBeanFactory#getBeanDefinitionCount()
	 */
	public int getBeanDefinitionCount() {
		return getBeanFactory().getBeanDefinitionCount();
	}


	/**
	 * @see ListableBeanFactory#getBeanDefinitionNames(Class)
	 */
	public String[] getBeanDefinitionNames(Class type) {
		return getBeanFactory().getBeanDefinitionNames(type);
	}
	

	/** Show information about this context */
	public String toString() {
		StringBuffer sb = new StringBuffer("ApplicationContext: displayName=**" + displayName + "'**; ");
		sb.append("class=[" + getClass().getName() + "]; ");
		sb.append("BeanFactory={" + getBeanFactory() + "}; ");
		sb.append("} MessageSource={" + this.messageSource + "}; ");
		sb.append("ContextOptions={" + this.contextOptions + "}; ");
		sb.append("Startup date=" + new Date(startupTime) + "; ");	
		if (this.parent == null)
			sb.append("ROOT of ApplicationContext hierarchy");	
		else
			sb.append("Parent={" + this.parent + "}");			
		return sb.toString();
	}	// toString
	
	
	//---------------------------------------------------------------------
	// Abstract methods that must be implemented by subclasses
	//---------------------------------------------------------------------
	/** 
	 * Subclasses must implement this method to perform the actual configuration load.
	 * @param servletConfig the app's ServletConfig to use to load the configuration.
	 * (We'll need this if it's inside the WAR.)
	 */
	protected abstract void refreshBeanFactory() throws ApplicationContextException;

	
	/**
	 * Unimplemented interface method. Subclasses must implement this
	 * efficiently, so that it can be called repeatedly without a performance penalty.
	 * @return this application context's default BeanFactory
	 * @see ApplicationContext#getBeanFactory()
	 */
	protected abstract ListableBeanFactory getBeanFactory();		

}	// class AbstractApplicationContext
