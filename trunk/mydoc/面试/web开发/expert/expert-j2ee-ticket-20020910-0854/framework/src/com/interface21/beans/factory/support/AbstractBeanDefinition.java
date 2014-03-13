package com.interface21.beans.factory.support;

import java.util.EventListener;
import java.util.LinkedList;
import java.util.List;
import java14.java.util.logging.Logger;

import com.interface21.beans.PropertyValues;

/** 
* Used to support polymorphism. All BeanDefinitions have a map
* containing their properties. However, the differ in how their
* class is defined, and concrete subclasses provide this information.
* This BeanDefinition base class supports adding listeners (PropertyChangeListener or
* VetoableChangeListener) to be notified on property changes.
* @author Rod Johnson
*/
public abstract class AbstractBeanDefinition implements BeanDefinition {

	/**
	* Create a logging category that is available
	* to subclasses. 
	*/
	protected final Logger logger = Logger.getLogger(getClass().getName());
	
	private boolean singleton;
	
	/** Property map */
	private PropertyValues pvs;

	/** List of event listeners in ListenerRegistration objects */
	private List listeners = new LinkedList();

	/** Struct */
	protected class ListenerRegistration {
		private String methodName;
		private EventListener listener;

		private ListenerRegistration(String methodName, EventListener l) {
			this.methodName = methodName;
			this.listener = l;
		}

		private ListenerRegistration(EventListener l) {
			this(null, l);
		}

		public String getPropertyName() {
			return methodName;
		}

		public EventListener getListener() {
			return listener;
		}
	} // inner class ListenerRegistration

	/** Creates new BeanDefinition
	 * @param map properties of the bean
	 */
	protected AbstractBeanDefinition(PropertyValues pvs, boolean singleton) {
		this.pvs = pvs;
		this.singleton = singleton;
	}
	
	protected AbstractBeanDefinition() {
		this.singleton = true;
	}
	
	public final boolean isSingleton() {
		return singleton;
	}
	
	public void setPropertyValues(PropertyValues pvs) {
		this.pvs = pvs;
	}

	public PropertyValues getPropertyValues() {
		return pvs;
	}

	/** Add a PropertyChangeListener */
	public void addListener(EventListener l) {
		listeners.add(new ListenerRegistration(l));
	}

	public void addListener(String methodName, EventListener l) {
		listeners.add(new ListenerRegistration(methodName, l));
	}

	protected List getListeners() {
		return listeners;
	}
} // class BeanDefinition