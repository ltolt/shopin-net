/**
 * @Probject Name: ESI
 * @Path: net.shopin.esi.utilDirectoryFilter.java
 * @Create By kongm
 * @Create In 2014-2-12 下午2:33:27
 * TODO
 */
package net.shopin.esi.util;

import java.io.File;
import java.io.FilenameFilter;

/**
 * @Class Name DirectoryFilter
 * @Author kongm
 * @Create In 2014-2-12
 */
public class DirectoryFilter implements FilenameFilter {

	String name;
	
	
	
	public DirectoryFilter(String name) {
		this.name = name;
	}



	/* (non-Javadoc)
	 * @see java.io.FilenameFilter#accept(java.io.File, java.lang.String)
	 */
	public boolean accept(File dir, String name) {
		//测试指定的文件是否应该包含在某一个文件列表中
		String f = new File(name).getName();
		if(f.contains(name) || f.equals(name)){
			return true;
		}
		return false;
	}

}
