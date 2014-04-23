/**
 * @Probject Name: shopin-back-demo
 * @Path: net.shopin.back.mapperBrandMapper.java
 * @Create By wangdg
 * @Create In 2013-5-13 上午10:14:32
 * TODO
 */
package net.shopin.back.mapper;



import java.util.List;

import net.shopin.back.entity.cond.BrandCond;
import net.shopin.back.entity.po.Brand;
import net.shopin.back.entity.vo.BrandVO;

import com.framework.IAbstractDAO;
import com.framework.persistence.ShoppinMapper;

/**
 * @Class Name BrandMapper
 * @Author wangdg
 * @Create In 2013-5-13
 */
@ShoppinMapper
public interface BrandMapper extends IAbstractDAO<BrandCond, Brand, BrandVO>{

	
}
