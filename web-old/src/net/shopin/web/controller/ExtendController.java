package net.shopin.web.controller;

import net.shopin.api.IExtendService;
import net.shopin.view.LianMengDailyVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.util.List;

/**
* Created by IntelliJ IDEA.
* User: yanwt
* Date: 2010-11-8
* Time: 16:49:55
*/
@Controller
public class ExtendController {
//    @Autowired
//    private IExtendService extendService;

    @RequestMapping(value = "/extend/{page}", method = RequestMethod.GET)
    public String getHelp(@PathVariable("page") String page, Model m) {
        return "extend/" + page;
    }

    @RequestMapping(value = "/extend/{type}/daily", method = RequestMethod.GET)
    public String lianmengDaily(@RequestParam("date") String date, @PathVariable("type") String type, Model m) {
//        m.addAttribute("list", extendService.getLianMengDaily(type, date));
        m.addAttribute("date", date);
        return "extend/" + type;
    }

    @RequestMapping(value = "/extend/{type}/daily_fix", method = RequestMethod.GET)
    public String lkt(@RequestParam("yyyymmdd") String date, @PathVariable("type") String type, Model m, HttpServletResponse response) {
//        List<LianMengDailyVO> list = extendService.getLianMengDaily(type, date);
//        m.addAttribute("list", list);
        m.addAttribute("date", date);
        StringBuffer bf = new StringBuffer();
//        for (LianMengDailyVO vo : list) {
//            String sta = "";
//            if (vo.getStat().equals("1")) {
//                sta = "100";
//            } else if (vo.getStat().equals("-1") || vo.getStat().equals("0")) {
//                sta = "300";
//            } else if (vo.getStat().equals("2") || vo.getStat().equals("3") || vo.getStat().equals("4")) {
//                sta = "200";
//            }
//            bf.append("2").append(",")
//                    .append(vo.getTime()).append(",")
//                    .append(vo.getLtinfo()).append(",")
//                    .append(vo.getOrderCode()).append(",")
//                    .append(vo.getProductCode()).append(",")
//                    .append(vo.getCount()).append(",")
//                    .append(Double.parseDouble(vo.getPrice()) * 100).append(",")
//                    .append(vo.getCategoryCode()).append(",")
//                    .append(sta).append("\n");
//        }
        m.addAttribute("data",bf.toString());
        return "extend/"+type;
    }

    @RequestMapping(value = "/extend/shopinUnion", method = RequestMethod.GET)
    public String shopinUnion(@RequestParam(value = "date", required = false) String date, @RequestParam(value = "orderId", required = false) String orderId, Model m) {
//        m.addAttribute("list", extendService.getShopinUnion("shopin-union", date, orderId));
        m.addAttribute("date", date);
        return "extend/shopinUnion";
    }

    private HttpServletResponse toWrite(StringBuffer bf, HttpServletResponse response, String fileName) {
        PrintWriter pw = null;
        response.setContentType("application/x-download;charset=gbk");
        try {
            fileName = URLEncoder.encode(fileName, "gbk");
            pw = response.getWriter();
        } catch (Exception e) {
            e.printStackTrace();
        }
        response.setCharacterEncoding("gbk");
        response.addHeader("Content-Disposition", "attachment;filename=" + fileName);
        pw.write(bf.toString());
        return response;
    }

}
