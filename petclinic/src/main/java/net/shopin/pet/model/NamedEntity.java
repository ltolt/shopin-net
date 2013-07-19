/**
 * @Probject Name: petclinic
 * @Path: net.shopin.pet.model.NamedEntity.java
 * @Create By kongm
 * @Create In 2013-7-19 ÏÂÎç4:28:38
 * TODO
 */
package net.shopin.pet.model;

import javax.persistence.Column;
import javax.persistence.MappedSuperclass;

/**
 * @Class Name NamedEntity
 * @Author kongm
 * @Create In 2013-7-19
 */
@MappedSuperclass
public class NamedEntity extends BaseEntity{

	/**
	 * Simple JavaBean domain object adds a name property to <code>BaseEntity</code>. Used as a base class for objects
     * needing these properties.
	 */
	

    @Column(name = "name")
    private String name;


    public void setName(String name) {
        this.name = name;
    }

    public String getName() {
        return this.name;
    }

    @Override
    public String toString() {
        return this.getName();
    }

}
