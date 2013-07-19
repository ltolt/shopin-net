/**
 * @Probject Name: petclinic
 * @Path: net.shopin.pet.model.BaseEntity.java
 * @Create By kongm
 * @Create In 2013-7-19 ÏÂÎç3:49:02
 * TODO
 */
package net.shopin.pet.model;

import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.MappedSuperclass;

/**
 * ËµÃ÷:
 *   Simple JavaBean domain object with an id property. 
 *   Used as a base class for objects needing this property.
 * @Class Name BaseEntity
 * @Author kongm
 * @Create In 2013-7-19
 */
@MappedSuperclass
public class BaseEntity {
	    @Id
	    @GeneratedValue(strategy = GenerationType.IDENTITY)
	    protected Integer id;


	    public void setId(Integer id) {
	        this.id = id;
	    }

	    public Integer getId() {
	        return id;
	    }

	    public boolean isNew() {
	        return (this.id == null);
	    }

}
