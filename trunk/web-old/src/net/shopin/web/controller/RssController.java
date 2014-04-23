package net.shopin.web.controller;

import net.shopin.api.INoticeService;
import net.shopin.view.NoticeVO;
import net.shopin.web.vo.RssItem;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by IntelliJ IDEA.
 * User: yanwt
 * Date: 2010-2-24
 * Time: 17:20:11
 */
@Controller
public class RssController {

    @Autowired
    private INoticeService noticeService;

    @RequestMapping(value = "/atom/{id}", method = RequestMethod.GET)
    public void getAtomNotice(@PathVariable("id") String id, Model m) {
        SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        List<NoticeVO> list = noticeService.findNoticesByCate(id);
        List<RssItem> rssItemList = new ArrayList<RssItem>();
        for (int i = 0; i < list.size(); i++) {
            NoticeVO noticeVO = list.get(i);
            RssItem rssItem = new RssItem();
            try {
                rssItem.setDatePublished(sf.parse(noticeVO.getNoticesTime()));
            } catch (ParseException e) {
                e.printStackTrace();
            }
            rssItem.setDescription(noticeVO.getContent());
            rssItem.setTitle(noticeVO.getTitle());
            rssItem.setLink(noticeVO.getLink());
            rssItemList.add(rssItem);
        }
        m.addAttribute("rssItemList", rssItemList);
    }

    @RequestMapping(value = "/rss/{id}", method = RequestMethod.GET)
    public void getRssNotice(@PathVariable("id") String id, Model m) {
        SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        List<NoticeVO> list = noticeService.findNoticesByCate(id);
        List<RssItem> rssItemList = new ArrayList<RssItem>();
        for (int i = 0; i < list.size(); i++) {
            NoticeVO noticeVO = list.get(i);
            RssItem rssItem = new RssItem();
            try {
                rssItem.setDatePublished(sf.parse(noticeVO.getNoticesTime()));
            } catch (ParseException e) {
                e.printStackTrace();
            }
            rssItem.setDescription(noticeVO.getContent());
            rssItem.setTitle(noticeVO.getTitle());
            if (noticeVO.getLink() != null) {
                rssItem.setLink(noticeVO.getLink());
            } else {
                rssItem.setLink("/notice/" + noticeVO.getSid() + ".html");
            }
            rssItemList.add(rssItem);
        }
        m.addAttribute("feedTitle", "test rss");
        m.addAttribute("feedDesc", "feedDesc");
        m.addAttribute("feedLink", "http://localhost/web");
        m.addAttribute("rssItemList", rssItemList);

    }
}
