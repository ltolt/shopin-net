package net.shopin.web.controller;

import com.shopin.modules.utils.PageHelper;
import com.shopin.modules.web.view.PageVO;
import net.shopin.api.INoticeService;
import net.shopin.view.NoticeVO;
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
 * Date: 2010-2-24
 * Time: 16:09:54
 */
@Controller
public class NoticeController {
    @Autowired
    private INoticeService noticeService;

    @RequestMapping(value = "/notice/{id}", method = RequestMethod.GET)
    public String getNotice(@PathVariable("id") String id, Model m) {
        m.addAttribute("notice", noticeService.getNoticeById(id));
        return "view/notice";
    }

    @RequestMapping(value = "/notices/{type}", method = RequestMethod.GET)
    public String getNotices(@PathVariable("type") String type, Model m, HttpServletRequest request) {
        PageVO<NoticeVO> page = new PageVO<NoticeVO>();
        page.setPageSize(20);
        page = noticeService.getNoticePage(page,type);
        m.addAttribute("notices", page.getList());
        PageHelper pageHelper = new PageHelper(request, "page.ftl", "/notices/"+type);
        m.addAttribute("page", pageHelper.getPageBreakStr(page));
        return "view/notices";
    }

    @RequestMapping(value = "/notices/{type}/{page}", method = RequestMethod.GET)
    public String getNoticesPage(@PathVariable("type") String type,@PathVariable("page") int pageNo, Model m,HttpServletRequest request) {
        PageVO<NoticeVO> page = new PageVO<NoticeVO>();
        page.setPageSize(20);
        page.setPageNo(pageNo);
        page = noticeService.getNoticePage(page,type);
        m.addAttribute("notices", page.getList());
        PageHelper pageHelper = new PageHelper(request, "page.ftl", "/notices/"+type);
        m.addAttribute("page", pageHelper.getPageBreakStr(page));
        return "view/notices";
    }
}
