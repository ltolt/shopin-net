package net.shopin.web.controller;

import net.shopin.api.*;
import net.shopin.exception.TemplateException;
import net.shopin.view.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Description:Channel Controller((频道控制类))
 * User: Peter Wei
 * Date: 2010-1-9
 * To change this template use File | Settings | File Templates.
 */
@Controller
public class ChannelController {
    @Autowired
    private IChannelService channelService;

    @Autowired
    private IPageFieldService pageFiledService;

    @Autowired
    private IPageService pageService;

    @Autowired
    private ISysParameterService sysParameterService;

    @Autowired
    private IBrandRankService brandRankService;

    @Autowired
    private INoticeService noticeService;

    @Autowired
    private IPromotionService promotionService;

    @Autowired
    private IProductService productService;

    @Autowired
    private ITemplateService templateService;
    /**
     * 进入频道页
     *
     * @param page
     * @param m
     * @param request
     * @return
     */
    @RequestMapping(value = "/channel-{page}", method = RequestMethod.GET)
    public String index(@PathVariable("page") String page, Model m, HttpServletRequest request) throws TemplateException {
        ChannelVO channelVO = channelService.getChannelByName(page);
        String rankTypeId = sysParameterService.getSysParameter("CHANNEL_BRANDS").get(channelVO.getName());
        String topBrands = sysParameterService.getSysParameter("PAGE_RANKS").get(channelVO.getName()+"Brand");
        m.addAttribute("topBrands", brandRankService.getBrandRankList(topBrands, "0"));
        m.addAttribute("brandRanks", brandRankService.getBrandRankList(rankTypeId, "1")); //频道上方热卖品牌
        m.addAttribute("channelbrandRanks", brandRankService.getBrandRankList(rankTypeId, "0")); //频道品牌排行
        m.addAttribute("columns", pageFiledService.findColumnsByChannel(channelVO.getSid()));
        m.addAttribute("brands", channelService.findBrandsInChannel(channelVO.getSid()));
        m.addAttribute("cates", channelService.findCatesInChannel(channelVO.getSid()));
        List<AdvertisementVO> ads = channelService.findAdsInChannel(channelVO.getSid());
        for (int i = 0; i < ads.size(); i++) {
            AdvertisementVO advertisementVO = ads.get(i);
            m.addAttribute("ads"+i, advertisementVO);
        }
        String noticesTypeId = sysParameterService.getSysParameter("CHANNEL_NOTICE").get(channelVO.getName());
        //打折快报
        List<NoticeVO> notices = noticeService.findNoticesByCate(noticesTypeId);
        //网站公告
        List<NoticeVO> notices2 = noticeService.findNoticesByCate("1");
        m.addAttribute("notices", notices);
        m.addAttribute("notices2", notices2);
        m.addAttribute("noticesType", noticesTypeId);

        m.addAttribute("promotions", promotionService.findPromotion(channelVO.getSid()));

        ProductQueryVO queryVo = new ProductQueryVO();
        queryVo.setProCate(channelVO.getProductClass());
        m.addAttribute("prices", productService.findCurrentPriceList(queryVo));
        m.addAttribute("sex", productService.findCurrentSexList(queryVo));
        m.addAttribute("discounts", productService.findCurrentDiscountList(queryVo));
        return pageService.getPageTemplateInChannel(channelVO.getSid()).getPage();
    }

    @RequestMapping(value = "/{page}-preview/{id}", method = RequestMethod.GET)
    public String preview(@PathVariable("page") String page,@PathVariable("id") String id, Model m, HttpServletRequest request) throws TemplateException {
        ChannelVO channelVO = channelService.getChannelByName(page);
        String rankTypeId = sysParameterService.getSysParameter("CHANNEL_BRANDS").get(channelVO.getName());
        String topBrands = sysParameterService.getSysParameter("PAGE_RANKS").get(channelVO.getName()+"Brand");
        m.addAttribute("topBrands", brandRankService.getBrandRankList(topBrands, "0"));
        m.addAttribute("brandRanks", brandRankService.getBrandRankList(rankTypeId, "1")); //频道上方热卖品牌
        m.addAttribute("channelbrandRanks", brandRankService.getBrandRankList(rankTypeId, "0")); //频道品牌排行
        List<PageFieldVO> listField =pageFiledService.findFieldsByPageLayoutSid(id);
        Map map = sysParameterService.getSysParameter("TEMPLATE_PARAMETER");
        List<PageColumnVO> listColumn = new ArrayList<PageColumnVO>();
        if (listField != null && !listField.isEmpty()) {
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
                    try {
                        String str = templateService.getTemplate(templateVo.getName(), root);
                        PageColumnVO columnVo = new PageColumnVO();
                        columnVo.setSeq(fieldVo.getSeq());
                        columnVo.setTemplate(str);
                        listColumn.add(columnVo);
                    } catch (Exception e) {
                        continue;
                    }
                }
            }
        }
        m.addAttribute("columns", listColumn);
        m.addAttribute("brands", channelService.findBrandsInChannel(channelVO.getSid()));
        m.addAttribute("cates", channelService.findCatesInChannel(channelVO.getSid()));
        List<AdvertisementVO> ads = channelService.findAdsInChannel(channelVO.getSid());
        for (int i = 0; i < ads.size(); i++) {
            AdvertisementVO advertisementVO = ads.get(i);
            m.addAttribute("ads"+i, advertisementVO);
        }
        //网站公告
        List<NoticeVO> notices = noticeService.findNoticesByCate("0");
        //打折快报
        List<NoticeVO> notices2 = noticeService.findNoticesByCate("1");
        m.addAttribute("notices", notices);
        m.addAttribute("notices2", notices2);

        m.addAttribute("promotions", promotionService.findPromotion(channelVO.getSid()));

        ProductQueryVO queryVo = new ProductQueryVO();
        queryVo.setProCate(channelVO.getProductClass());
        m.addAttribute("prices", productService.findCurrentPriceList(queryVo));
        m.addAttribute("discounts", productService.findCurrentDiscountList(queryVo));
        m.addAttribute("sex", productService.findCurrentSexList(queryVo));
        return pageService.getPageTemplateInChannel(channelVO.getSid()).getPage();
    }


}
