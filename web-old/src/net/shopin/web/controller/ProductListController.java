package net.shopin.web.controller;

import com.shopin.modules.utils.PageHelper;
import com.shopin.modules.web.view.PageVO;
import net.shopin.api.IBreadcrumbNavigationService;
import net.shopin.api.IChannelService;
import net.shopin.api.IProductService;
import net.shopin.view.ChannelVO;
import net.shopin.view.ProductQueryVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;

/**
 * Created by IntelliJ IDEA.
 * User: yanwt
 * Date: 2010-1-29
 * Time: 11:29:18
 */
@Controller
public class ProductListController {

    @Autowired
    private IChannelService channelService;

    @Autowired
    private IProductService productService;

    @Autowired
    private IBreadcrumbNavigationService breadcrumbNavigationService;

    //商品列表展示

    @RequestMapping(value = "/list-{query}.html", method = RequestMethod.GET)
    public String productList(@PathVariable("query") String query, HttpServletRequest request, Model m) {
        ProductQueryVO queryVo = new ProductQueryVO(query);
        PageVO page = new PageVO();
        page = productService.findProductPage(page, queryVo);
        m.addAttribute("cates", productService.findCurrentCateList(queryVo));
        m.addAttribute("brands", productService.findCurrentBrandList(queryVo));
        m.addAttribute("prices", productService.findCurrentPriceList(queryVo));
        m.addAttribute("sex", productService.findCurrentSexList(queryVo));
        m.addAttribute("discounts", productService.findCurrentDiscountList(queryVo));
        m.addAttribute("breadcrumbNavigation", breadcrumbNavigationService.getBreadcrumbNavigationVO(queryVo));
        m.addAttribute("products", page.getList());
        PageHelper pageHelper = new PageHelper(request, "page.ftl", "/list-" + query);
        m.addAttribute("page", pageHelper.getPageBreakStr(page));
        m.addAttribute("queryVo", queryVo);
        return "view/productList";
    }

    //商品列表展示，分页

    @RequestMapping(value = "/list-{query}/{page}.html", method = RequestMethod.GET)
    public String productListPage(@PathVariable("query") String query, @PathVariable("page") int pageNo, HttpServletRequest request, Model m) {
        ProductQueryVO queryVo = new ProductQueryVO(query);
        PageVO page = new PageVO();
        page.setPageNo(pageNo);
        page = productService.findProductPage(page, queryVo);
        m.addAttribute("cates", productService.findCurrentCateList(queryVo));
        m.addAttribute("brands", productService.findCurrentBrandList(queryVo));
        m.addAttribute("prices", productService.findCurrentPriceList(queryVo));
        m.addAttribute("sex", productService.findCurrentSexList(queryVo));
        m.addAttribute("discounts", productService.findCurrentDiscountList(queryVo));
        m.addAttribute("breadcrumbNavigation", breadcrumbNavigationService.getBreadcrumbNavigationVO(queryVo));
        m.addAttribute("products", page.getList());
        PageHelper pageHelper = new PageHelper(request, "page.ftl", "/list-" + query);
        m.addAttribute("page", pageHelper.getPageBreakStr(page));
        m.addAttribute("queryVo", queryVo);
        return "view/productList";
    }
    //频道商品列表展示

    @RequestMapping(value = "/{channel}/list-{query}.html", method = RequestMethod.GET)
    public String channelProductList(@PathVariable("channel") String channel, @PathVariable("query") String query, HttpServletRequest request, Model m) {
        ProductQueryVO queryVo = new ProductQueryVO(query);
        ChannelVO channelVO = channelService.getChannelByName(channel);
        if (queryVo.getProCate() == null || "".equals(queryVo.getProCate())) {
            queryVo.setProCate(channelVO.getProductClass());
        }
        PageVO page = new PageVO();
        page = productService.findProductPage(page, queryVo);
        m.addAttribute("cates", productService.findCurrentCateList(queryVo));
        m.addAttribute("brands", productService.findCurrentBrandList(queryVo));
        m.addAttribute("prices", productService.findCurrentPriceList(queryVo));
        m.addAttribute("sex", productService.findCurrentSexList(queryVo));
        m.addAttribute("discounts", productService.findCurrentDiscountList(queryVo));
        m.addAttribute("breadcrumbNavigation", breadcrumbNavigationService.getBreadcrumbNavigationVO(queryVo));
        m.addAttribute("products", page.getList());
        PageHelper pageHelper = new PageHelper(request, "page.ftl", "/" + channel + "/list-" + query);
        m.addAttribute("page", pageHelper.getPageBreakStr(page));
        m.addAttribute("queryVo", queryVo);
        m.addAttribute("channel", channelVO);
        return "view/channelList";
    }

    //频道商品列表展示，点分页时

    @RequestMapping(value = "/{channel}/list-{query}/{page}.html", method = RequestMethod.GET)
    public String channelProductListPage(@PathVariable("channel") String channel, @PathVariable("query") String query, @PathVariable("page") int pageNo, HttpServletRequest request, Model m) {
        ProductQueryVO queryVo = new ProductQueryVO(query);
        ChannelVO channelVO = channelService.getChannelByName(channel);
        if (queryVo.getProCate() == null || "".equals(queryVo.getProCate())) {
            queryVo.setProCate(channelVO.getProductClass());
        }
        PageVO page = new PageVO();
        page.setPageNo(pageNo);
        page = productService.findProductPage(page, queryVo);
        m.addAttribute("cates", productService.findCurrentCateList(queryVo));
        m.addAttribute("brands", productService.findCurrentBrandList(queryVo));
        m.addAttribute("prices", productService.findCurrentPriceList(queryVo));
        m.addAttribute("sex", productService.findCurrentSexList(queryVo));   
        m.addAttribute("discounts", productService.findCurrentDiscountList(queryVo));
        m.addAttribute("breadcrumbNavigation", breadcrumbNavigationService.getBreadcrumbNavigationVO(queryVo));
        m.addAttribute("products", page.getList());
        PageHelper pageHelper = new PageHelper(request, "page.ftl", "/" + channel + "/list-" + query);
        m.addAttribute("page", pageHelper.getPageBreakStr(page));
        m.addAttribute("queryVo", queryVo);
        m.addAttribute("channel", channelVO);
        return "view/channelList";
    }
}
