package net.shopin.service;

import java.util.List;

public interface IProductClassService {
	
	
	List getAllProductClasses();

	String getAllProductClassesJson(); 
	
	String getChildProductClassJson(Integer fatherNodeSid);
}
