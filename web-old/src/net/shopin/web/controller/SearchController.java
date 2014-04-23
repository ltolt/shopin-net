package net.shopin.web.controller;

import com.shopin.modules.utils.Codec;
import com.shopin.modules.utils.PageHelper;
import com.shopin.modules.web.view.PageVO;
import net.shopin.api.IBrandRankService;
import net.shopin.api.IProductService;
import net.shopin.api.ISearchService;
import net.shopin.api.ISysParameterService;
import net.shopin.view.ProductQueryVO;
import net.shopin.view.SearchProductVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.view.freemarker.FreeMarkerConfigurer;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Description:Search Controller
 * User: Peter Wei
 * Date: 2010-1-12
 */
@Controller
public class SearchController {
    @Autowired
    ISearchService searchService;
    @Autowired
    private ISysParameterService sysParameterService;
    @Autowired
    private IProductService productService;
    @Autowired
    private IBrandRankService brandRankService;


    @RequestMapping(value = "/search", method = RequestMethod.POST)
    public String getList(Model m, @RequestParam(value = "key", required = false, defaultValue = "") String key, @RequestParam(value = "proClass", required = false, defaultValue = "") String proClass) {
        if (null == key || key.equals(""))
            return "redirect:/index.html";
        String searchKey = key;
        if(!proClass.equals("")){
            searchKey = searchKey + "~" + proClass;
        }
        return "redirect:/search/" + Codec.encode(searchKey) + ".html";
    }

    @RequestMapping(value = "/search/{key}")
    public String getList(@PathVariable("key") String key,String order, HttpServletRequest request, Model m) {
        String query = Codec.decode(key);
        String searchKey = query;
        String proClass = "";
        if (query.indexOf("~") > 0) {
            String keys[] = query.split("~");
            searchKey = keys[0];
            proClass = keys[1];
        }
        String topBrands = sysParameterService.getSysParameter("PAGE_RANKS").get("indexBrand");
        ProductQueryVO queryVo = new ProductQueryVO();
        m.addAttribute("cates", productService.findCurrentCateList(queryVo));
        m.addAttribute("brands", productService.findCurrentBrandList(queryVo));
        m.addAttribute("prices", productService.findCurrentPriceList(queryVo));
        m.addAttribute("discounts", productService.findCurrentDiscountList(queryVo));
        m.addAttribute("sex", productService.findCurrentSexList(queryVo));
        m.addAttribute("topBrands", brandRankService.getBrandRankList(topBrands, "0"));
        PageVO<SearchProductVO> page = new PageVO<SearchProductVO>(50, true);
        if (null != order) {
            page.setOrderBy("supplyMinPrices.promotionPrice");
            page.setOrder(order.equals("0") ? "desc" : "asc");
        }
        page = searchService.searchProduct(page, searchKey, "", proClass);
        m.addAttribute("products", page.getList());
        m.addAttribute("key", key);
        m.addAttribute("query", searchKey);
        m.addAttribute("order", order == null ? "0" : order);
        m.addAttribute("proClass", proClass);
        PageHelper pageHelper = new PageHelper(request, "page.ftl", "/search/" + key);
        m.addAttribute("page", pageHelper.getPageBreakStr(page));
        return "search";
    }

    @RequestMapping(value = "/search/{key}/{page}.html")
    public String getPageList(@PathVariable("page") String pageNo, @PathVariable("key") String key,String order, HttpServletRequest request, Model m) {
        String query = Codec.decode(key);
        String searchKey = query;
        String proClass = "";
        if (query.indexOf("~") > 0) {
            String keys[] = query.split("~");
            searchKey = keys[0];
            proClass = keys[1];
        }
        String topBrands = sysParameterService.getSysParameter("PAGE_RANKS").get("indexBrand");
        ProductQueryVO queryVo = new ProductQueryVO();
        m.addAttribute("cates", productService.findCurrentCateList(queryVo));
        m.addAttribute("brands", productService.findCurrentBrandList(queryVo));
        m.addAttribute("prices", productService.findCurrentPriceList(queryVo));
        m.addAttribute("discounts", productService.findCurrentDiscountList(queryVo));
        m.addAttribute("sex", productService.findCurrentSexList(queryVo));
        m.addAttribute("topBrands", brandRankService.getBrandRankList(topBrands, "0"));
        PageVO<SearchProductVO> page = new PageVO<SearchProductVO>(50, true);
        page.setPageNo(Integer.parseInt(pageNo));
        if (null != order) {
            page.setOrderBy("supplyMinPrices.promotionPrice");
            page.setOrder(order.equals("0") ? "desc" : "asc");
        }
        page = searchService.searchProduct(page, searchKey, "", proClass);
        m.addAttribute("products", page.getList());
        m.addAttribute("order", order == null ? "0" : order);
        m.addAttribute("key", key);
        m.addAttribute("query", searchKey);
        m.addAttribute("proClass", proClass);
        PageHelper pageHelper = new PageHelper(request, "page.ftl", "/search/" + key);
        m.addAttribute("page", pageHelper.getPageBreakStr(page));
        return "search";
    }

    private String getOrder(HttpServletRequest request) {
        Cookie cookies[] = request.getCookies();
        Cookie sCookie = null;
        String order = "";
        if (cookies != null && cookies.length > 0) {
            for (int i = 0; i < cookies.length; i++) {
                sCookie = cookies[i];
                if (sCookie.getName().equals("searchOrder")) {
                    order = sCookie.getValue();
                }
            }
        }
        return order;
    }

    private void setOrder(HttpServletResponse response, String value) {
        int maxAge = 3600 * 24 * 365;

        if (value == null) {
            maxAge = 0;
            value = "";
        }
        Cookie cookie = new Cookie("searchOrder", value);
        cookie.setMaxAge(maxAge);
        cookie.setPath("/");
        response.addCookie(cookie);
    }
}
