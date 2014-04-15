package com.shopin.modules.orm.hibernate;

import javax.persistence.GenerationType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.MappedSuperclass;

/**
 * Created by IntelliJ IDEA.
 * User: yanwt
 * Date: 2009-7-30
 * Time: 11:35:02
 */
@MappedSuperclass
public abstract class IdEntity {

	protected Long sid;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	public Long getSid() {
		return sid;
	}

	public void setSid(Long id) {
		this.sid = id;
	}
}