package net.shopin.web.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;

import javax.servlet.http.HttpServletRequest;

import net.shopin.api.IProductService;
import net.shopin.api.IStoreBrandService;
import net.shopin.exception.TemplateException;
import net.shopin.view.BrandVO;
import net.shopin.view.ProductQueryVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Description:Channel Controller((仓储关联品牌控制类))
 * User: guansq
 * Date: 2012-1-13
 */
@Controller
public class StoreBrandController {
	@Autowired
	private IStoreBrandService storeBrandService;
	@Autowired
    private IProductService productService;
	
	/**
     * 进入频道页
     *
     * @param page
     * @param m
     * @param request
     * @return
     */
    @RequestMapping(value = "/store/storeBrand-{channelId}", method = RequestMethod.GET)
    public String index(@PathVariable("channelId") String channelId, Model m, HttpServletRequest request) throws TemplateException {
    	List<BrandVO> topBrandList = storeBrandService.findBrandsInChannel(Integer.parseInt(channelId));
    	m.addAttribute("topBrands", topBrandList);
    	
    	Map<String, List<BrandVO>> map = new TreeMap<String, List<BrandVO>>();
    	List<BrandVO> list = productService.findCurrentBrandList(new ProductQueryVO());
        for (int i = 0; i < list.size(); i++) {
            BrandVO brand = list.get(i);
            if (brand.getSpell() != null && !"".equals(brand.getSpell())) {
                String key = brand.getSpell().toUpperCase().substring(0, 1);
                List<BrandVO> brands = null;
                if (map.containsKey(key)) {
                    brands = map.get(key);
                    brands.add(brand);
                    map.put(key, brands);
                } else {
                    brands = new ArrayList<BrandVO>();
                    brands.add(brand);
                    map.put(key, brands);
                }
            }
        }
        m.addAttribute("allbrands", map);
        
    	return "channel/storeBrand";
    }
}
