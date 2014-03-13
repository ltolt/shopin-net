
package com.interface21.beans;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import com.interface21.util.StringUtils;

/**
 * Default implementation of PropertyValues.
 * Allows simple manipulation of properties,
 * and provides constructors to support deep copy
 * and construction from a Map.
 * @author  Rod Johnson
 * @since 13 May 2001
 * @version $Id: MutablePropertyValues.java,v 1.1.1.1 2002/08/01 12:52:02 Rod Johnson Exp $
 */
public class MutablePropertyValues implements PropertyValues {
	
	//---------------------------------------------------------------------
	// Instance data
	//---------------------------------------------------------------------
	/** List of PropertyValue objects
	 */
	private List	propertyValuesList;
	
	//---------------------------------------------------------------------
	// Constructors
	//---------------------------------------------------------------------
	/** Creates a new empty MutablePropertyValues object.
	 * PropertyValue objects can be added with the
	 * addPropertyValue() method.
	 */
	public MutablePropertyValues() {
		propertyValuesList = new ArrayList(10);
	}
	
	/** Deep copy constructor. Guarantees PropertyValue references
	 * are independent, although it can't deep copy objects currently
	 * referenced by individual PropertyValue objects
	 */
	public MutablePropertyValues(PropertyValues other) {
		PropertyValue[] pvs = other.getPropertyValues();
		propertyValuesList = new ArrayList(pvs.length);
		for (int i = 0; i < pvs.length; i++)
			addPropertyValue(new PropertyValue(pvs[i].getName(), pvs[i].getValue()));
	}
	
	/** Construct a new PropertyValues object from a Map.
	 * @param map Map with property values keyed by property name,
	 * which must be a String
	 */
	public MutablePropertyValues(Map map) {
		Set keys = map.keySet();
		propertyValuesList = new ArrayList(keys.size());
		Iterator itr = keys.iterator(); 
		while (itr.hasNext()) {
			String key = (String) itr.next();
			addPropertyValue(new PropertyValue(key, map.get(key)));
		}
	}
	
	//---------------------------------------------------------------------
	// Public methods
	//---------------------------------------------------------------------
	/** Add a PropertyValue object
	 * @param pv PropertyValue object to add
	 */
	public void addPropertyValue(PropertyValue pv) {
		propertyValuesList.add(pv);
	}		
	
	/** Return an array of the PropertyValue objects
	 * held in this object.
	 * @return an array of the PropertyValue objects
	 * held in this object.
 	*/
	public PropertyValue[] getPropertyValues() {
		return (PropertyValue[]) propertyValuesList.toArray(new PropertyValue[0]);
	}
	
	/** Is there a propertyValue object for this property?
	 * @param propertyName name of the property we're interested in
	 *@return whether there is a propertyValue object for this property?
	 */
	public boolean contains(String propertyName) {
		return getPropertyValue(propertyName) != null;
	}
	
	public PropertyValue getPropertyValue(String propertyName) {
		for (int i = 0; i < propertyValuesList.size(); i++) {
			PropertyValue pv = (PropertyValue) propertyValuesList.get(i);
			if (pv.getName().equals(propertyName))
				return pv;
		}
		return null;
	}
	
	/** Modify a PropertyValue object held in this object 
	 * Indexed from 0 */
	public void setPropertyValueAt(PropertyValue pv, int i) {
		propertyValuesList.set(i, pv);
	}
	
	public String toString() {
		PropertyValue[] pvs = getPropertyValues();
		StringBuffer sb = new StringBuffer("MutablePropertyValues: length=" + pvs.length + "; ");
		sb.append(StringUtils.arrayToDelimitedString(pvs, ","));
		return sb.toString();
	}
	
}	// class MutablePropertyValues
