package com.interface21.beans;

/**
 * Created by k on 2014/5/4 0004.
 */
/**
 * The central interface of the Java beans infrastructure.
 * Interface to be implemented by classes that can manipulate
 * Java beans.
 * <br/>Implementing classes have the ability to get and set
 * property values (individually or in bulk), get property descriptors
 * and query the readability and writability of properties.
 * <p/>Supports <b>nested properties</b> enabling the setting of properties
 * on subproperties to an unlimited depth.
 * <br/>If a property update causes an exception, a PropertyVetoException will
 * be thrown. Bulk updates continue after exceptions are encountered, throwing an exception
 * wrapping <B>all</B> exceptions encountered during the update.
 * <br/>BeanWrapper implementations can be used repeatedly, with their "target" or wrapped
 * object changed.
 * <br/>This interface supports the ability to add standard Java beans API
 * PropertyChangeListeners and VetoableChangeListeners. VetoableChangeListeners
 * can veto individual property changes.
 * @author Rod Johnson
 * @since 13 April 2001
 * @version 1.1
 */
public interface BeanWrapper {
    /**
     * Path separator for nested properties.
     * Follows normal Java conventions:
     * getFoo().getBar() would be
     * foo.bar
     */
    String NESTED_PROPERTY_SEPARATOR = ".";



}
