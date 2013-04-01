package base.framework.util;

import java.util.ArrayList;
import java.util.List;

import org.apache.cxf.binding.corba.wsdl.Array;
import org.dozer.DozerBeanMapper;
import org.dozer.Mapper;

/**
 * @author Administrator
 * dozer单例的wrapper
 *  dozer在同一jvm里使用单例即可 无需重复创建
 *   但Dozer4.0自带DozerBeanMapperSingletonWrapper必须使用dozerbeanmapping.xml做参数初始化 
 *   因此从新实现 
 */
public final class DozerMapper {
	
	private static Mapper instance;
	private DozerMapper(){
		//should't invoke
	}
	
	public static synchronized Mapper getInstance(){
		if(instance == null){
			instance = new DozerBeanMapper(getConfigFile());
		}
		return instance;
	}
	
	private static List getConfigFile(){
		List list = new ArrayList();
		list.add("BeanMapping.xml");
		return list;
	}
	
	
	 /**
		 * copyProperties方法的集合操作
		 * @param <T>
		 * @param src
		 * @param desc
		 * @param clazz
		 */
	public static <T> void copyPropertiesList(List src,List<T> desc,Class<T> clazz){
		for(Object obj : src){
			T t = DozerMapper.getInstance().map(obj, clazz);
			desc.add(t);
		}
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

}
