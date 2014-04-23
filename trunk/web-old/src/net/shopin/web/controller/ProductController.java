package net.shopin.web.controller;

import com.shopin.modules.web.view.PageVO;
import net.shopin.api.*;
import net.shopin.view.ProColorDetailVO;
import net.shopin.view.ProductQueryVO;
import net.shopin.view.ProductVO;
import net.shopin.view.SaleRecordVO;
import net.shopin.web.util.LoadProperties;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;

/**
 * Description:Product Controller(商品控制类)
 * User: Peter Wei
 * Date: 2010-1-11
 * To change this template use File | Settings | File Templates.
 */
@Controller
public class ProductController {
    @Autowired
    private IProductService productService;
    @Autowired
    private IProReviewService proReviewService;
    @Autowired
    private IProductListService productListService;
    @Autowired
    private IProductWebService productWebService;
    @Autowired
    private ISecurityService securityService;
    @Autowired
    private IBrandService brandService;
    @Autowired
    private ISaleRecordService saleRecordService;
    @Autowired
    private IProductStoreService productStoreService;
    @Autowired
    private ICartService cartService;
    @Autowired
    private IBreadcrumbNavigationService breadcrumbNavigationService;
    private static Integer STORE_SID =Integer.parseInt(LoadProperties.readValue("store_sid"));
//    private static Integer STORE_SID =82;

    //商品展示
    @RequestMapping(value = "/product/{id}", method = RequestMethod.GET)
    public String viewProduct(@CookieValue(value = "shopin_sid", required = false) String sid,
                              @CookieValue(value = "userTicket", required = false) String uid,
                              @PathVariable("id") String id, Model m, HttpServletRequest request) {
        try {
            ProductVO productVO = productService.getProduct(id);
            if (null == productVO.getSid()) {
                return "redirect:/index.html";
            }
            doViewProductInfo(sid, id, uid, m, request, productVO,false);
            return "view/product";
        } catch (Exception e) {
            return "redirect:/index.html";
        }
    }

      //商品展示
    @RequestMapping(value = "/product/store/{id}", method = RequestMethod.GET)
    public String viewStockProduct(@CookieValue(value = "shopin_sid", required = false) String sid,
                              @CookieValue(value = "userTicket", required = false) String uid,
                              @PathVariable("id") String id, Model m, HttpServletRequest request) {
        try {
            ProductVO productVO = productStoreService.getProduct(id);
            if (null == productVO.getSid()) {
                return "redirect:/index.html";
            }
            m.addAttribute("channelSid",STORE_SID);
            doViewProductInfo(sid, id, uid, m, request, productVO,true);

            return "view/product";
        } catch (Exception e) {
            return "redirect:/index.html";
        }
    }

    private void doViewProductInfo(String sid, String id, String uid, Model m, HttpServletRequest request,
                                   ProductVO productVO,Boolean isStock) throws Exception {
        if ((productVO != null) && (productVO.getProSku() != null) && (productVO.getProSku().toLowerCase().contains("tmall-")))
            m.addAttribute("tmall", "tmall");
        else {
            m.addAttribute("tmall", "shopin");
        }

        String referer = request.getHeader("Referer");
        if (referer != null && referer.length() > 100) {
            referer = referer.substring(0, 100);
        }
        if (uid != null && (!"".equals(uid)) && (this.securityService.getLoginUserId(uid) != null)) {
            String memSid = this.securityService.getLoginUserId(uid).getMembersSid();
            m.addAttribute("userId", memSid);
        }
        m.addAttribute("sid", sid);
        //商品颜色详细列表
        if ("1".equals(productVO.getProSelling())) {
            if (productVO.getProPrice() == null) {
                this.productWebService.proUnSelling(id);
                this.productWebService.proSelling(id);
                productVO = this.productService.getProductNoCache(id);
                //return "redirect:/product/" + id + ".html";
            } else {
                List<ProColorDetailVO> details;
                if(isStock){
                    details = productStoreService.getProductDetail(id, productVO.getProPrice().getPromotionPrice());
                }else{
                    details = productListService.getProductDetail(id, productVO.getProPrice().getPromotionPrice());
                }
                if (details.size() == 0) {
                    productWebService.proUnSelling(id);
                    productWebService.proSelling(id);
                    productVO = productService.getProductNoCache(id);
                    if(isStock){
                        details = productStoreService.getProductDetail(id, productVO.getProPrice().getPromotionPrice());
                    }else{
                        details = productListService.getProductDetail(id, productVO.getProPrice().getPromotionPrice());
                    }
                    m.addAttribute("details", details);
                    //return "redirect:/product/" + id + ".html";
                } else {
                    m.addAttribute("details", details);
                }
            }
        } else {
            productWebService.proUnSelling(id);
            m.addAttribute("message", "商品已经下架");
        }
        m.addAttribute("product", productVO);
        //商品评论列表
        m.addAttribute("proReviews", proReviewService.getAllProReviews(id));

        //查询推荐商品列表
        PageVO<ProductVO> page = new PageVO<ProductVO>();
        page.setPageSize(4);
        page = productService.findRecommendInSameCate(page, id);
        m.addAttribute("recommends", page.getList());
        if (productVO.getBrandSid() != null) {
            m.addAttribute("brand", brandService.getBrand(productVO.getBrandSid()));
        }
        //查询同品牌商品列表
        page = new PageVO<ProductVO>();
        page.setPageSize(5);
        page = productService.findRecommendInSameBrand(page, id);
        m.addAttribute("sameBrands", page.getList());
        //查询销售记录
        List<SaleRecordVO> records = saleRecordService.findSaleRecord(productVO.getSid());
        m.addAttribute("records", records);
        m.addAttribute("position", referer);
        ProductQueryVO queryVo = new ProductQueryVO("");
        queryVo.setProBrand(productVO.getBrandSid());
        queryVo.setProCate(productVO.getProductCateSid());
        m.addAttribute("breadcrumbNavigation", breadcrumbNavigationService.getBreadcrumbNavigationVO(queryVo));
    }

    @RequestMapping(value = "/view/viewhistory", method = RequestMethod.GET)
    public String viewHistory(Model m, HttpServletRequest request) {
        List list = new ArrayList();
        Cookie[] cookies = request.getCookies();
        for (int i = 0; i < cookies.length; i++) {
            Cookie cookie = cookies[i];
            if (cookie.getName().startsWith("ViewHistory")) {
                list.add(productService.getProduct(cookie.getValue()));
            }
        }
        m.addAttribute("product", list);
        return "view/viewHistory";
    }

    //Ajax实时获取尺码库存

    @RequestMapping(value = "/product/getStock", method = RequestMethod.POST)
    public void getStock(Model m, String proDetilSid, String price) {
        long total = productListService.getProDetailQuantity(proDetilSid, price);
        m.addAttribute("result", total);
    }

    @RequestMapping(value = "/product/getAddToCart", method = RequestMethod.POST)
    public void getAddToCart(Model m, String proDetilSid) {
        long total = cartService.getProCount(proDetilSid);
        m.addAttribute("result", total);
    }
}
