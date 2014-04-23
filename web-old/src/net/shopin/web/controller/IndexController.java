package net.shopin.web.controller;

import net.shopin.api.*;
import net.shopin.exception.TemplateException;
import net.shopin.view.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.view.freemarker.FreeMarkerConfigurer;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by IntelliJ IDEA.
 * User: yanwt
 * Date: 2009-7-30
 * History: 2010-1-26 modify by Peter Wei(添加栏目模板及频道列表)
 * Time: 15:43:20
 */
@Controller
@Scope("prototype")
public class IndexController {
    @Autowired
    private IPageFieldService pageFiledService;
    @Autowired
    private IProductService productService;
    @Autowired
    private IChannelService channelService;
    @Autowired
    private INoticeService noticeService;
    @Autowired
    private ISysParameterService sysParameterService;
    @Autowired
    private IBrandRankService brandRankService;
    @Autowired
    private IPromotionService promotionService;
    @Autowired
    private ISaleRecordService saleRecordService;
    @Autowired
    private ITemplateService templateService;//注入模版服务

    @RequestMapping(value = "/index", method = RequestMethod.GET)
    public String index(Model m, HttpServletRequest request) throws TemplateException {

        ChannelVO channelVO = channelService.getChannelByName("index");

        m.addAttribute("columns", pageFiledService.findColumnsByChannel(channelVO.getSid()));


        List<AdvertisementVO> ads = channelService.findAdsInChannel(channelVO.getSid());

        String rankTypeId = sysParameterService.getSysParameter("CHANNEL_BRANDS").get(channelVO.getName());

        String topBrands = sysParameterService.getSysParameter("PAGE_RANKS").get(channelVO.getName()+"Brand");

        //取周排行
        m.addAttribute("brandRanks", brandRankService.getBrandRankList(rankTypeId, "0"));
        //取月排行
        m.addAttribute("brandRanks2", brandRankService.getBrandRankList(rankTypeId, "1"));

        m.addAttribute("brandRanks3", brandRankService.getBrandRankList(rankTypeId, "2"));
        //打折快报
        List<NoticeVO> notices = noticeService.findNoticesByCate("0");
        //网站公告
        List<NoticeVO> notices2 = noticeService.findNoticesByCate("1");

        m.addAttribute("notices", notices);
        m.addAttribute("notices2", notices2);
        m.addAttribute("cates", productService.findCurrentCateList(new ProductQueryVO()));
        m.addAttribute("brands", productService.findCurrentBrandList(new ProductQueryVO()));
        m.addAttribute("sex", productService.findCurrentSexList(new ProductQueryVO()));        
        m.addAttribute("topBrands", brandRankService.getBrandRankList(topBrands, "0"));
        for (int i = 0; i < ads.size(); i++) {
            AdvertisementVO advertisementVO = ads.get(i);
            m.addAttribute("ads"+i, advertisementVO);
        }
        m.addAttribute("promotions", promotionService.findPromotion(channelVO.getSid()));
        m.addAttribute("sales", saleRecordService.findNewSaleRecord());
        ProductQueryVO queryVo = new ProductQueryVO();
        m.addAttribute("prices", productService.findCurrentPriceList(queryVo));
        m.addAttribute("discounts", productService.findCurrentDiscountList(queryVo));
        return "index";
    }

        //商品尺码对照表

    @RequestMapping(value = "/view/sizeChart", method = RequestMethod.GET)
    public String viewSizeChart(Model m) {
        ChannelVO channelVO = channelService.getChannelByName("index");
        String topBrands = sysParameterService.getSysParameter("PAGE_RANKS").get(channelVO.getName()+"Brand");
        ProductQueryVO queryVo = new ProductQueryVO();
        m.addAttribute("prices", productService.findCurrentPriceList(queryVo));
        m.addAttribute("discounts", productService.findCurrentDiscountList(queryVo));
        m.addAttribute("cates", productService.findCurrentCateList(queryVo));
        m.addAttribute("brands", productService.findCurrentBrandList(queryVo));
        m.addAttribute("sex", productService.findCurrentSexList(queryVo));        
        m.addAttribute("topBrands", brandRankService.getBrandRankList(topBrands, "0"));
        return "view/sizeChart";
    }

    @RequestMapping(value = "/preview/{id}", method = RequestMethod.GET)
    public String preview(Model m, @PathVariable("id") String id,HttpServletRequest request) throws TemplateException {

        ChannelVO channelVO = channelService.getChannelByName("index");
        List<PageColumnVO> listColumn = new ArrayList<PageColumnVO>();
        Map map = sysParameterService.getSysParameter("TEMPLATE_PARAMETER");
        List<PageFieldVO> listField = pageFiledService.findFieldsByPageLayoutSid(id);
        for (PageFieldVO fieldVo : listField) {
                PageFieldTemplateVO templateVo = fieldVo.getTemplateVo();
                if (templateVo == null ||
                        templateVo.getTemplate() == null ||
                        "".equals(templateVo.getTemplate())) {
                    throw new TemplateException("no template in page field.");
                } else {
                    /*
                    渲染模板，得到一个栏目的HTML字符串。
                    */
                    Map root = new HashMap();
                    root.put("root", fieldVo);
                    root.put("images", map.get("images"));
                    root.put("ctx", map.get("ctx"));
                    String str = templateService.getTemplate(templateVo.getName(), root);
                    PageColumnVO columnVo = new PageColumnVO();
                    columnVo.setSeq(fieldVo.getSeq());
                    columnVo.setTemplate(str);
                    listColumn.add(columnVo);
                }
            }

        m.addAttribute("columns", listColumn);

        List<AdvertisementVO> ads = channelService.findAdsInChannel(channelVO.getSid());

        String rankTypeId = sysParameterService.getSysParameter("PAGE_RANKS").get(channelVO.getName());

        String topBrands = sysParameterService.getSysParameter("PAGE_RANKS").get(channelVO.getName()+"Brand");

        //取周排行
        m.addAttribute("brandRanks", brandRankService.getBrandRankList(rankTypeId, "0"));
        //取月排行
        m.addAttribute("brandRanks2", brandRankService.getBrandRankList(rankTypeId, "1"));

        m.addAttribute("brandRanks3", brandRankService.getBrandRankList(rankTypeId, "2"));
        //打折快报
        List<NoticeVO> notices = noticeService.findNoticesByCate("0");
        //网站公告
        List<NoticeVO> notices2 = noticeService.findNoticesByCate("1");

        m.addAttribute("notices", notices);
        m.addAttribute("notices2", notices2);
        m.addAttribute("cates", productService.findCurrentCateList(new ProductQueryVO()));
        m.addAttribute("sex", productService.findCurrentSexList(new ProductQueryVO()));
        m.addAttribute("brands", productService.findCurrentBrandList(new ProductQueryVO()));
        m.addAttribute("topBrands", brandRankService.getBrandRankList(topBrands, "0"));
        for (int i = 0; i < ads.size(); i++) {
            AdvertisementVO advertisementVO = ads.get(i);
            m.addAttribute("ads"+i, advertisementVO);
        }
        m.addAttribute("promotions", promotionService.findPromotion(channelVO.getSid()));
        m.addAttribute("sales", saleRecordService.findNewSaleRecord());
        ProductQueryVO queryVo = new ProductQueryVO();
        m.addAttribute("prices", productService.findCurrentPriceList(queryVo));
        m.addAttribute("discounts", productService.findCurrentDiscountList(queryVo));
        return "index";
    }
}
