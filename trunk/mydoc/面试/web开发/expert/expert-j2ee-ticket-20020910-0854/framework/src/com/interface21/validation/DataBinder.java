package com.interface21.validation;

import java.beans.PropertyChangeListener;
import java.beans.PropertyDescriptor;
import java.beans.VetoableChangeListener;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java14.java.util.logging.Logger;

import javax.servlet.ServletException;

import com.interface21.beans.*;


/**
 * To servlet requests what BeanWrapper is to beans
 * Slightly unusual, as it _is_ an exception
 * Supports property change listeners and vetoable change listeners
 * @author Rod Johnson
 * @version
 */
public class DataBinder extends BindException {
	
	public static final String MISSING_FIELD_ERRORCODE_SUFFIX = "Required";
	
	/**
	* Create a logging category
	*/
	protected static final Logger logger = Logger.getLogger(DataBinder.class.getName());
	
	
	public DataBinder(Object target, String objName) {
		super(target, objName);
	}
	
//	public MultiDataBinder(Object target) {
//		super(target);
//	}
//	
//	public MultiDataBinder(Object target, VetoableChangeListener vtc) {
//		this(target);
//		bw.setEventPropagationEnabled(true);
//		bw.addVetoableChangeListener(vtc);
//	}
	
	
	// ADD NAME PARAMETER
	
	/**
	 * Adds to last bean wrapper
	 */
	public void addVetoableChangeListener(VetoableChangeListener vtl) {
		getLastBeanWrapper().setEventPropagationEnabled(true);
		getLastBeanWrapper().addVetoableChangeListener(vtl);
	}
	
	public void addPropertyChangeListener(PropertyChangeListener pcl) {
		getLastBeanWrapper().setEventPropagationEnabled(true);
		getLastBeanWrapper().addPropertyChangeListener(pcl);
	}
	
	// MULTIPLE ERRORS on same field?!?
	
	/**
	 * Binds to current
	 */
	public void bind(PropertyValues pvs, String[] requiredFields) throws ServletException {
		// Check for missing fields
		if (requiredFields != null) {
			for (int i = 0; i < requiredFields.length; i++) {
				PropertyValue pv = pvs.getPropertyValue(requiredFields[i]);
				if (pv == null || "".equals(pv.getValue())) {
					logger.fine("Required field '" + requiredFields[i] + "' is missing or empty");
					addFieldError(new FieldError(lastObjectName(),requiredFields[i], "", requiredFields[i] + MISSING_FIELD_ERRORCODE_SUFFIX, "Field '" + requiredFields[i] + "' is required"));
				}
			}
		}
		bind(pvs);
	}
	
	
	// WHAT ABOUT FILTER METHOD?
	
	/** 
	 * Create a new command object. Invoked on each incoming request, before
	 * either the handleCommand() or handleInvalidRequest() method is invoked (depending on the
	 * result of the binding operation). The incoming request is passed to this method
	 * in case values in the request (such as session data) should cause prepopulation of
	 * the new command object. Otherwise, a new instance of the commandClass object can
	 * simply be instantiated.
	 * @param request incoming request in case we want to look at its state
	 * @return a CommandWrapper object containing the command object and necessary information
	 * about how the framework should process it (such as whether the framework should
	 * attempt to bind request parameters onto it)
	 * @throws ServletException if
	 */
	public void bind(PropertyValues pvs) throws ServletException {
		
		try {			
			// Set 0 or more vetoable change listeners
			//addVetoableChangeListeners(bw);
			
			// Bind request parameters onto params
			// We ignore unknown properties
			getLastBeanWrapper().setPropertyValues(pvs, true, null);
		}
		catch (PropertyVetoExceptionsException ex) {
			ErrorCodedPropertyVetoException[] exs = ex.getPropertyVetoExceptions();
			for (int i = 0; i < exs.length; i++) {
				addFieldError(new FieldError(lastObjectName(), exs[i].getPropertyChangeEvent().getPropertyName(), exs[i].getPropertyChangeEvent().getNewValue(), exs[i].getErrorCode(), exs[i].getLocalizedMessage()));
			}
		}
		catch (BeansException ex) {
			throw new ServletException("Fatal exception trying to bind", ex);
		} 
	}
	
	
	/**
	 * 
	 */
	public Map close() throws BindException {
		if (hasErrors()) {
			throw this;
		}
		return getModel();
	}
	
}
