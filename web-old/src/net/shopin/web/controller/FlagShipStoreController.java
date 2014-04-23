package net.shopin.web.controller;

import com.shopin.modules.utils.PageHelper;
import com.shopin.modules.web.view.PageVO;
import net.shopin.api.*;
import net.shopin.exception.TemplateException;
import net.shopin.view.*;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;

/**
 * @Company:www.shopin.net User: minxr
 * Date: 11-8-29
 * Time: 下午1:09
 */
@Controller
@RequestMapping(value = "/shipStore")
public class FlagShipStoreController {
    protected final Logger log = LoggerFactory.getLogger(getClass());
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
    private IFlagShipStorerService flagShipStoreService;

    /**
     * 分页显示
     * @param pageNO
     * @param m
     * @param request
     * @return
     * @throws TemplateException
     */
    @RequestMapping("/page/{pageNo}")
    public String flagShipStoreList(@PathVariable("pageNo") int pageNO,Model m ,HttpServletRequest request) throws TemplateException {
        ChannelVO channelVO = channelService.getChannelByName("brandstores");
        ProductQueryVO query = new ProductQueryVO();
        String topBrands = sysParameterService.getSysParameter("PAGE_RANKS").get(channelVO.getName() + "Brand");
        //=====分页相关=======
        PageVO<FlagShipStoreVO> page = new PageVO<FlagShipStoreVO>();
        page.setPageSize(24);
        page.setOrder("asc");
        page.setPageNo(pageNO);
        page = flagShipStoreService.queryFlagShipStoreVOs(page);
        PageHelper pageHelper = new PageHelper(request, "page.ftl", "/shipStore/page");

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
        m.addAttribute("flagshipstores",page.getList());
        m.addAttribute("startNo",(page.getPageNo()-1)*page.getPageSize());
        return "flagshipstore/shipStoremore";
    }

    @RequestMapping("/{id}")
    public String viewFlagShipStore(@PathVariable("id") String id,Model m, HttpServletRequest request) throws TemplateException {
          //如果传递的是无效的id
        if(null == id ||"".equals(id.trim())){
             return "redirect:/channel/brandstores.html";
        }else{
             try{
            Integer.parseInt(id);
            }catch (ClassCastException e){
              return "redirect:/channel/brandstores.html";
            }
        }

        FlagShipStoreVO flagShipStoreVO = flagShipStoreService.getFlagShipStoreById(Integer.parseInt(id));
        if(flagShipStoreVO ==null){
           return "redirect:/channel/brandstores.html";
        }
        ChannelVO channelVO = channelService.getChannelByName("brandstores");
        ProductQueryVO queryVo = new ProductQueryVO();
        queryVo.setProBrand(flagShipStoreVO.getBrandSid());
        PageVO<ProductVO> page = new PageVO<ProductVO>();
       page.setPageSize(20);
       page = productService.findProductPage(page, queryVo);
         m.addAttribute("brand", brandService.getBrand(flagShipStoreVO.getBrandSid()));
       m.addAttribute("products", page.getList());
       m.addAttribute("starProducts", saleRecordService.getPopProduct(flagShipStoreVO.getBrandSid(), 5));
       m.addAttribute("cates", productService.findCurrentCateList(queryVo));
       m.addAttribute("prices", productService.findCurrentPriceList(queryVo));
       m.addAttribute("sex", productService.findCurrentSexList(queryVo));
       m.addAttribute("discounts", productService.findCurrentDiscountList(queryVo));

       PageHelper pageHelper = new PageHelper(request, "page.ftl", "/shipStore/"+id+"/list-" + flagShipStoreVO.getBrandSid());

       m.addAttribute("page", pageHelper.getPageBreakStr(page));
       m.addAttribute("queryVo",queryVo);
       m.addAttribute("columns", pageFiledService.findColumnsByChannel(channelVO.getSid()));
       m.addAttribute("shipstore",flagShipStoreVO);
        return "flagshipstore/shipstore";
    }
    @RequestMapping("/{id}/list-{query}/{page}.html")
    public String listWithSepartepage(@PathVariable("id")String id,@PathVariable("query") String query, @PathVariable("page") int pageNo,HttpServletRequest request, Model m) throws TemplateException {

         //如果传递的是无效的id
        if(null == id ||"".equals(id.trim())){
             return "redirect:/channel/brandstores.html";
        }else{
             try{
            Integer.parseInt(id);
            }catch (ClassCastException e){
              return "redirect:/channel/brandstores.html";
            }
        }
       FlagShipStoreVO flagShipStoreVO = flagShipStoreService.getFlagShipStoreById(Integer.parseInt(id));
        if(flagShipStoreVO ==null){
           return "redirect:/channel/brandstores.html";
        }

        ChannelVO channelVO = channelService.getChannelByName("brandstores");
        //-------------------------
         m.addAttribute("brand", brandService.getBrand(flagShipStoreVO.getBrandSid()));
        ProductQueryVO queryVo = new ProductQueryVO();
        queryVo.setProBrand(flagShipStoreVO.getBrandSid());
        PageVO<ProductVO> page = new PageVO<ProductVO>();
        page.setPageSize(20);
        page.setPageNo(pageNo);
        page = productService.findProductPage(page, queryVo);
        m.addAttribute("products", page.getList());
        m.addAttribute("starProducts", saleRecordService.getPopProduct(flagShipStoreVO.getBrandSid(), 5));
        m.addAttribute("cates", productService.findCurrentCateList(queryVo));
        m.addAttribute("prices", productService.findCurrentPriceList(queryVo));
        m.addAttribute("sex", productService.findCurrentSexList(queryVo));
        m.addAttribute("discounts", productService.findCurrentDiscountList(queryVo));
        PageHelper pageHelper = new PageHelper(request, "page.ftl", "/shipStore/"+id+"/list-" + flagShipStoreVO.getBrandSid());
        m.addAttribute("page", pageHelper.getPageBreakStr(page));
        m.addAttribute("queryVo",queryVo);
        m.addAttribute("columns", pageFiledService.findColumnsByChannel(channelVO.getSid()));
        m.addAttribute("shipstore",flagShipStoreVO);
        return "flagshipstore/shipstore";
    }


}
