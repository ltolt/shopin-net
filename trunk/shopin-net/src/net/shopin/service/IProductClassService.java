package net.shopin.service;

import java.util.List;

public interface IProductClassService {
	
    String getListClassForGrid();
	
	List getAllProductClasses();

	String getAllProductClassesJson(); 
	
	String getChildProductClassJson(Integer fatherNodeSid);
}
