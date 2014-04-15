package com.shopin.modules.utils;

import java.util.ArrayList;
import java.util.List;

import org.dozer.DozerBeanMapper;
import org.dozer.Mapper;

/**
 * dozer单例的wrapper.
 * 
 * dozer在同一jvm里使用单例即可,无需重复创建.
 * 但Dozer4.0自带的DozerBeanMapperSingletonWrapper必须使用dozerBeanMapping.xml作参数初始化,因此重新实现.
 */
public final class DozerMapper {

	private static Mapper instance;

	private DozerMapper() {
		//shoudn't invoke.
	}

    public static synchronized Mapper getInstance() {
		if (instance == null) {
			instance = new DozerBeanMapper(getConfigFile());
		}
		return instance;
	}

    private static List getConfigFile() {
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
	public static <T> void copyPropertiesList(List src,
				List<T> desc, Class<T> clazz){
		for(Object obj : src){
			T t = (T) DozerMapper.getInstance().map(obj, clazz);
			desc.add(t);
		}
	}
}
