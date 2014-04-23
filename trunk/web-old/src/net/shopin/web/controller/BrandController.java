package net.shopin.web.controller;

import com.shopin.modules.utils.PageHelper;
import com.shopin.modules.web.view.PageVO;
import net.shopin.api.*;
import net.shopin.view.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;

/**
 * Description:Brand Controller(品牌控制类)
 * User: Peter Wei
 * Date: 2010-1-12
 */
@Controller
public class BrandController {
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

    @Autowired
    private IFlagShipStorerService flagShipStoreService;


    /**
     * 进入品牌具体页
     *
     * @param id
     * @param m
     * @return
     */
    @RequestMapping(value = "/brands/{id}", method = RequestMethod.GET)
    public String brand(@PathVariable("id") String id, Model m, HttpServletRequest request) {
        m.addAttribute("brand", brandService.getBrand(id));
        ProductQueryVO queryVo = new ProductQueryVO();
        queryVo.setProBrand(id);
        PageVO<ProductVO> page = new PageVO<ProductVO>();
        page.setPageSize(20);
        page = productService.findProductPage(page, queryVo);
        m.addAttribute("products", page.getList());
        m.addAttribute("starProducts", saleRecordService.getPopProduct(id, 5));
        m.addAttribute("cates", productService.findCurrentCateList(queryVo));
        m.addAttribute("prices", productService.findCurrentPriceList(queryVo));
        m.addAttribute("sex", productService.findCurrentSexList(queryVo));
        m.addAttribute("discounts", productService.findCurrentDiscountList(queryVo));
        PageHelper pageHelper = new PageHelper(request, "page.ftl", "/brand/list-" + id);
        m.addAttribute("page", pageHelper.getPageBreakStr(page));
        m.addAttribute("queryVo",queryVo);
        return "view/brand";
    }

    @RequestMapping(value = "/brand/list-{query}.html", method = RequestMethod.GET)
    public String brandProductList(@PathVariable("query") String query,HttpServletRequest request, Model m) {
        ProductQueryVO queryVo = new ProductQueryVO(query);
        m.addAttribute("starProducts", saleRecordService.getPopProduct(queryVo.getProBrand(), 5));
        m.addAttribute("brand", brandService.getBrand(queryVo.getProBrand()));
        PageVO<ProductVO> page = new PageVO<ProductVO>();
        page.setPageSize(20);
        page = productService.findProductPage(page, queryVo);
        m.addAttribute("products", page.getList());
        m.addAttribute("cates", productService.findCurrentCateList(queryVo));
        m.addAttribute("prices", productService.findCurrentPriceList(queryVo));
        m.addAttribute("sex", productService.findCurrentSexList(queryVo));
        m.addAttribute("discounts", productService.findCurrentDiscountList(queryVo));
        PageHelper pageHelper = new PageHelper(request, "page.ftl", "/brand/list-" + query);
        m.addAttribute("page", pageHelper.getPageBreakStr(page));
        m.addAttribute("queryVo",queryVo);
        return "view/brand";
    }

    /**
     * 进入品牌具体页，有分页
     *
     * @param query
     * @param pageNo
     * @param request
     * @param m
     * @return
     */
    @RequestMapping(value = "/brand/list-{query}/{page}.html", method = RequestMethod.GET)
    public String brandProductList(@PathVariable("query") String query, @PathVariable("page") int pageNo, HttpServletRequest request, Model m) {
        ProductQueryVO queryVo = new ProductQueryVO(query);

        m.addAttribute("starProducts", saleRecordService.getPopProduct(queryVo.getProBrand(), 5));
        m.addAttribute("brand", brandService.getBrand(queryVo.getProBrand()));
        PageVO<ProductVO> page = new PageVO<ProductVO>();
        page.setPageNo(pageNo);
        page.setPageSize(20);
        page = productService.findProductPage(page, queryVo);
        m.addAttribute("products", page.getList());

        m.addAttribute("cates", productService.findCurrentCateList(queryVo));
        m.addAttribute("prices", productService.findCurrentPriceList(queryVo));
        m.addAttribute("sex", productService.findCurrentSexList(queryVo));
        m.addAttribute("discounts", productService.findCurrentDiscountList(queryVo));
        PageHelper pageHelper = new PageHelper(request, "page.ftl", "/brand/list-" + query);
        m.addAttribute("page", pageHelper.getPageBreakStr(page));
        m.addAttribute("queryVo",queryVo);
        return "view/brand";
    }

    @RequestMapping(value = "/{channel}/brands/{id}", method = RequestMethod.GET)
    public String channelBrand(@PathVariable("channel") String channel, @PathVariable("id") String id, HttpServletRequest request, Model m) {
        ChannelVO channelVO = channelService.getChannelByName(channel);
        m.addAttribute("brand", brandService.getBrand(id));
        ProductQueryVO queryVo = new ProductQueryVO();
        queryVo.setProBrand(id);
        queryVo.setProCate(channelVO.getProductClass());
        PageVO<ProductVO> page = new PageVO<ProductVO>();
        page.setPageSize(20);
        page = productService.findProductPage(page, queryVo);
        m.addAttribute("products", page.getList());

        m.addAttribute("cates", productService.findCurrentCateList(queryVo));
        m.addAttribute("prices", productService.findCurrentPriceList(queryVo));
        m.addAttribute("sex", productService.findCurrentSexList(queryVo));
        m.addAttribute("discounts", productService.findCurrentDiscountList(queryVo));
        PageHelper pageHelper = new PageHelper(request, "page.ftl", "/"+channel+"/brand/list-" + id);
        m.addAttribute("page", pageHelper.getPageBreakStr(page));
        m.addAttribute("queryVo",queryVo);
        m.addAttribute("curchannel","/"+channel);
        return "view/brand";
    }

    @RequestMapping(value = "/{channel}/brand/list-{query}", method = RequestMethod.GET)
    public String channelBrandList(@PathVariable("channel") String channel, @PathVariable("query") String query, HttpServletRequest request,Model m) {
        ProductQueryVO queryVo = new ProductQueryVO(query);
        ChannelVO channelVO = channelService.getChannelByName(channel);
        if (queryVo.getProCate() == null || "".equals(queryVo.getProCate())) {
            queryVo.setProCate(channelVO.getProductClass());
        }
        m.addAttribute("starProducts", saleRecordService.getPopProduct(queryVo.getProBrand(), 5));
        m.addAttribute("brand", brandService.getBrand(queryVo.getProBrand()));
        PageVO<ProductVO> page = new PageVO<ProductVO>();
        page.setPageSize(20);
        page = productService.findProductPage(page, queryVo);
        m.addAttribute("products", page.getList());

        m.addAttribute("cates", productService.findCurrentCateList(queryVo));
        m.addAttribute("prices", productService.findCurrentPriceList(queryVo));
        m.addAttribute("sex", productService.findCurrentSexList(queryVo));
        m.addAttribute("discounts", productService.findCurrentDiscountList(queryVo));
        PageHelper pageHelper = new PageHelper(request, "page.ftl", "/"+channel+"/brand/list-" + query);
        m.addAttribute("page", pageHelper.getPageBreakStr(page));
        m.addAttribute("queryVo",queryVo);
        m.addAttribute("curchannel","/"+channel);
        return "view/brand";
    }

    @RequestMapping(value = "/{channel}/brand/list-{query}/{page}", method = RequestMethod.GET)
    public String channelBrandListPage(@PathVariable("channel") String channel, @PathVariable("query") String query,@PathVariable("page") int pageNo,HttpServletRequest request,Model m) {
        ProductQueryVO queryVo = new ProductQueryVO(query);
        ChannelVO channelVO = channelService.getChannelByName(channel);
        if (queryVo.getProCate() == null || "".equals(queryVo.getProCate())) {
            queryVo.setProCate(channelVO.getProductClass());
        }
        m.addAttribute("starProducts", saleRecordService.getPopProduct(queryVo.getProBrand(), 5));
        m.addAttribute("brand", brandService.getBrand(queryVo.getProBrand()));
        PageVO<ProductVO> page = new PageVO<ProductVO>();
        page.setPageSize(20);
        page.setPageNo(pageNo);
        page = productService.findProductPage(page, queryVo);
        m.addAttribute("products", page.getList());

        m.addAttribute("cates", productService.findCurrentCateList(queryVo));
        m.addAttribute("prices", productService.findCurrentPriceList(queryVo));
        m.addAttribute("sex", productService.findCurrentSexList(queryVo));
        m.addAttribute("discounts", productService.findCurrentDiscountList(queryVo));
        PageHelper pageHelper = new PageHelper(request, "page.ftl", "/"+channel+"/brand/list-" + query);
        m.addAttribute("page", pageHelper.getPageBreakStr(page));
        m.addAttribute("queryVo",queryVo);
        m.addAttribute("curchannel","/"+channel);
        return "view/brand";
    }

    /**
     * 进入品牌专业店
     *
     * @param m
     * @return
     */
    @RequestMapping(value = "/channel/brandstores", method = RequestMethod.GET)
    public String brands(Model m) throws Exception {
        ChannelVO channelVO = channelService.getChannelByName("brandstores");
        ProductQueryVO query = new ProductQueryVO();
        String topBrands = sysParameterService.getSysParameter("PAGE_RANKS").get(channelVO.getName() + "Brand");
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
        List<BrandDisplayVO>  factoryStores = factoryStoreService.findFactoryStoresByPage(0,4,"asc");
        m.addAttribute("factorys",factoryStores);
        List<FlagShipStoreVO> flagShipStores  = flagShipStoreService.queryFlagShipStoreList(4);//页面显示数
        m.addAttribute("flagShipStores",flagShipStores);
        return "channel/brandstores";
    }

}
