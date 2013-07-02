package com.oreilly.hh;

import java.io.Serializable;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;

import org.hibernate.Hibernate;
import org.hibernate.HibernateException;
import org.hibernate.usertype.UserType;

/**
 * Manages persistence for the {@link SourceMedia} typesafe enumeration.
 */
public class SourceMediaType implements UserType {

    /**
     * Indicates whether objects managed by this type are mutable.
     *
     * @return <code>false</code>, since enumeration instances are immutable
     *         singletons.
     */
    public boolean isMutable() {
        return false;
    }

    /**
     * Return a deep copy of the persistent state, stopping at
     * entities and collections.
     *
     * @param value the object whose state is to be copied.
     * @return the same object, since enumeration instances are singletons.
     */
    public Object deepCopy(Object value) {
        return value;
    }

    /**
     * Compare two instances of the class mapped by this type for persistence
     * "equality".
     *
     * @param x first object to be compared.
     * @param y second object to be compared.
     * @return <code>true</code> iff both represent the same SourceMedia type.
     * @throws ClassCastException if x or y isn't a {@link SourceMedia}.
     */
    public boolean equals(Object x, Object y) {
        // We can compare instances, since SourceMedia are immutable singletons
        return (x == y);
    }

    /**
     * Determine the class that is returned by {@link #nullSafeGet}.
     *
     * @return {@link SourceMedia}, the actual type returned
     * by {@link #nullSafeGet}.
     */
    public Class returnedClass() {
        return SourceMedia.class;
    }

    /**
     * Determine the SQL type(s) of the column(s) used by this type mapping.
     *
     * @return a single VARCHAR column.
     */
    public int[] sqlTypes() {
        // Allocate a new array each time to protect against callers changing
        // its contents.
        int[] typeList = new int[1];
        typeList[0] = Types.VARCHAR;
        return typeList;
    }

    /**
     * Retrieve an instance of the mapped class from a JDBC {@link ResultSet}.
     *
     * @param rs the results from which the instance should be retrieved.
     * @param names the columns from which the instance should be retrieved.
     * @param owner the entity containing the value being retrieved.
     * @return the retrieved {@link SourceMedia} value, or <code>null</code>.
     * @throws SQLException if there is a problem accessing the database.
     */
    public Object nullSafeGet(ResultSet rs, String[] names, Object owner)
        throws SQLException
    {
        // Start by looking up the value name
        String name = (String) Hibernate.STRING.nullSafeGet(rs, names[0]);
        if (name == null) {
            return null;
        }
        // Then find the corresponding enumeration value
        try {
            return SourceMedia.valueOf(name);
        }
        catch (IllegalArgumentException e) {
            throw new HibernateException("Bad SourceMedia value: " + name, e);
        }
    }

    /**
     * Write an instance of the mapped class to a {@link PreparedStatement}, 
     * handling null values.
     *
     * @param st a JDBC prepared statement.
     * @param value the SourceMedia value to write.
     * @param index the parameter index within the prepared statement at which
     *        this value is to be written.
     * @throws SQLException if there is a problem accessing the database.
     */
    public void nullSafeSet(PreparedStatement st, Object value, int index)
        throws SQLException
    {
        String name = null;
        if (value != null)
            name = ((SourceMedia)value).toString();
        Hibernate.STRING.nullSafeSet(st, name, index);
    }

    /**
     * Reconstruct an object from the cacheable representation. At the very least this
     * method should perform a deep copy if the type is mutable. (optional operation)
     *
     * @param cached the object to be cached
     * @param owner the owner of the cached object
     * @return a reconstructed object from the cachable representation
     */
    public Object assemble(Serializable cached, Object owner) {
        return cached;
    }

    /**
     * Transform the object into its cacheable representation. At the very least this
     * method should perform a deep copy if the type is mutable. That may not be enough
     * for some implementations, however; for example, associations must be cached as
     * identifier values. (optional operation)
     *
     * @param value the object to be cached
     * @return a cachable representation of the object
     */
    public Serializable disassemble(Object value) {
        return (Serializable)value;
    }

    /**
     * Get a hashcode for an instance, consistent with persistence "equality".
     * @param x the instance whose hashcode is desired.
     */
    public int hashCode(Object x) {
        return x.hashCode();
    }

    /**
     * During merge, replace the existing (target) value in the entity we are merging to
     * with a new (original) value from the detached entity we are merging. For immutable
     * objects, or null values, it is safe to simply return the first parameter. For
     * mutable objects, it is safe to return a copy of the first parameter. For objects
     * with component values, it might make sense to recursively replace component values.
     *
     * @param original the value from the detached entity being merged
     * @param target the value in the managed entity
     * @return the value to be merged
     */
    public Object replace(Object original, Object target, Object owner) {
        return original;
    }
}
