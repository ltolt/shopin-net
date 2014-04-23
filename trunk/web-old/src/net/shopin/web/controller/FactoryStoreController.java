package net.shopin.web.controller;

import com.shopin.modules.utils.PageHelper;
import com.shopin.modules.web.view.PageVO;
import net.shopin.api.*;
import net.shopin.exception.TemplateException;
import net.shopin.view.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.Assert;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;

/**
 * @Company www.shopin.cn
 * User: minxr
 * Date: 11-3-15
 * Time: 下午4:48
 * To change this template use File | Settings | File Templates.
 */
@Controller
public class FactoryStoreController {

     @Autowired
    private IProductService productService;

    @Autowired
    private IChannelService channelService;

    @Autowired
    private IBrandService brandService;

    @Autowired
    private IBrandRankService brandRankService;

    @Autowired
    private IPageFieldService pageFiledService;

    @Autowired
    private ISysParameterService sysParameterService;

    @Autowired
    private ISaleRecordService saleRecordService;

    @Autowired
    private IFactoryStoreService factoryStoreService;

    /**
     * 查看更多品牌工厂店页面
     * @param m
     * @return
     * @throws TemplateException
     */
    @RequestMapping("/factory/page/{pageNo}")
    public String factoryViewByPage(@PathVariable("pageNo") int pageNO,Model m ,HttpServletRequest request) throws TemplateException {

           ChannelVO channelVO = channelService.getChannelByName("brandstores");
        ProductQueryVO query = new ProductQueryVO();
        String topBrands = sysParameterService.getSysParameter("PAGE_RANKS").get(channelVO.getName() + "Brand");
        //=====分页相关=======
        PageVO<BrandDisplayVO> page = new PageVO<BrandDisplayVO>();
        page.setPageSize(24);
        page.setPageNo(pageNO);
        page = factoryStoreService.findFactory(page);
        PageHelper pageHelper = new PageHelper(request, "page.ftl", "/factory/page");

        m.addAttribute("page", pageHelper.getPageBreakStr(page));


        //统计分类数量
        m.addAttribute("cates", productService.findCurrentCateList(query));
        //统计品牌数量
        m.addAttribute("brands", productService.findCurrentBrandList(query));
        //获取价格段
        m.addAttribute("prices", productService.findCurrentPriceList(query));
        //按性格获取商品数量
        m.addAttribute("sex", productService.findCurrentSexList(query));
        //折扣列表
        m.addAttribute("discounts", productService.findCurrentDiscountList(query));
        //品牌排行列表
        m.addAttribute("topBrands", brandRankService.getBrandRankList(topBrands, "0"));
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
        m.addAttribute("columns", pageFiledService.findColumnsByChannel(channelVO.getSid()));

        //取得工厂店
//        List<BrandDisplayVO>  factoryStores = factoryStoreService.findFactoryStoresByPage(0,0,"asc");
        m.addAttribute("factorys",page.getList());
        m.addAttribute("startNo",(page.getPageNo()-1)*page.getPageSize());
       return "factorystore/factorymore";
    }



    /**
     * 查看某个工厂店下面子品牌，及产品的相关信息
     * @param id 工厂店id
     * @return
     */
    @RequestMapping("/factory/{id}")
    public String viewByFactory(@PathVariable("id") String id,Model m, HttpServletRequest request) throws TemplateException {

        //如果传递的是无效的id
        if(null == id ||"".equals(id.trim())){
             return "redirect:/";
        }else{
             try{
            Integer.parseInt(id);
            }catch (ClassCastException e){
              return "redirect:/";
            }
        }
        BrandDisplayVO brandDisplayVO = factoryStoreService.findFactoryStoreById(id);
        //如果没有找到相应的工厂店
        if(brandDisplayVO ==null ){
            return "redirect:/";
        }

        //获取品牌
        List<BrandVO> brandVOs = factoryStoreService.findBrandByStoreId(id);
        ChannelVO channelVO = channelService.getChannelByName("brandstores");
        String brandId =brandVOs.get(0).getSid();
        m.addAttribute("brand", brandService.getBrand(brandId));
        ProductQueryVO queryVo = new ProductQueryVO();
        queryVo.setProBrand(brandId);
        PageVO<ProductVO> page = new PageVO<ProductVO>();
        page.setPageSize(20);
        page = productService.findProductPage(page, queryVo);
        m.addAttribute("products", page.getList());
        m.addAttribute("starProducts", saleRecordService.getPopProduct(brandId, 5));
        m.addAttribute("cates", productService.findCurrentCateList(queryVo));
        m.addAttribute("prices", productService.findCurrentPriceList(queryVo));
        m.addAttribute("sex", productService.findCurrentSexList(queryVo));
        m.addAttribute("discounts", productService.findCurrentDiscountList(queryVo));

        PageHelper pageHelper = new PageHelper(request, "page.ftl", "/factory/"+id+"/list-" + brandId);

        m.addAttribute("page", pageHelper.getPageBreakStr(page));
        m.addAttribute("queryVo",queryVo);
        m.addAttribute("columns", pageFiledService.findColumnsByChannel(channelVO.getSid()));
        m.addAttribute("brandVOs",brandVOs);//工厂店下的所有品牌
        m.addAttribute("factory",brandDisplayVO);

      return "factorystore/factory";
    }

    //分页
    @RequestMapping("/factory/{id}/list-{query}/{page}.html")
    public  String viewByFactoryAndPage(@PathVariable("id")String id,@PathVariable("query") String query, @PathVariable("page") int pageNo,HttpServletRequest request, Model m) throws TemplateException {
         //如果传递的是无效的id
        if(null == id ||"".equals(id.trim())){
             return "redirect:/";
        }else{
             try{
            Integer.parseInt(id);
            }catch (ClassCastException e){
              return "redirect:/";
            }
        }
        BrandDisplayVO brandDisplayVO = factoryStoreService.findFactoryStoreById(id);
        //如果没有找到相应的工厂店
        if(brandDisplayVO ==null ){
            return "redirect:/";
        }

        //获取品牌
        List<BrandVO> brandVOs = factoryStoreService.findBrandByStoreId(id);
        ChannelVO channelVO = channelService.getChannelByName("brandstores");
        String brandId =brandVOs.get(0).getSid();
        //-------------------------
         m.addAttribute("brand", brandService.getBrand(brandId));
        ProductQueryVO queryVo = new ProductQueryVO();
        queryVo.setProBrand(brandId);
        PageVO<ProductVO> page = new PageVO<ProductVO>();
        page.setPageSize(20);
        page.setPageNo(pageNo);
        page = productService.findProductPage(page, queryVo);
        m.addAttribute("products", page.getList());
        m.addAttribute("starProducts", saleRecordService.getPopProduct(brandId, 5));
        m.addAttribute("cates", productService.findCurrentCateList(queryVo));
        m.addAttribute("prices", productService.findCurrentPriceList(queryVo));
        m.addAttribute("sex", productService.findCurrentSexList(queryVo));
        m.addAttribute("discounts", productService.findCurrentDiscountList(queryVo));
        PageHelper pageHelper = new PageHelper(request, "page.ftl", "/factory/"+id+"/list-" + brandId);
        m.addAttribute("page", pageHelper.getPageBreakStr(page));
        m.addAttribute("queryVo",queryVo);
        m.addAttribute("columns", pageFiledService.findColumnsByChannel(channelVO.getSid()));
        m.addAttribute("brandVOs",brandVOs);//工厂店下的所有品牌
        m.addAttribute("factory",brandDisplayVO);
      return "factorystore/factory";
    }


}
