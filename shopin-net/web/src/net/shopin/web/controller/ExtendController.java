package net.shopin.web.controller;

import java.io.PrintStream;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.util.List;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import net.shopin.api.IExtendLinktechService;
import net.shopin.api.IExtendService;
import net.shopin.view.LianMengDailyVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
/**
 * 说明:
 *     联盟推广
 * @Class Name ExtendController
 * @Author kongm
 * @Create In 2013-11-11
 */
@Controller
public class ExtendController
{

  @Autowired
  private IExtendService extendService;

  @Autowired
  private IExtendLinktechService extendLinktechService;

  @RequestMapping(value={"/extend/{page}"}, method={org.springframework.web.bind.annotation.RequestMethod.GET})
  public String getHelp(@PathVariable("page") String page, Model m)
  {
    return "extend/" + page;
  }
  @RequestMapping(value={"/extend/{type}/daily"}, method={org.springframework.web.bind.annotation.RequestMethod.GET})
  public String lianmengDaily(@RequestParam("date") String date, @PathVariable("type") String type, Model m) {
    m.addAttribute("list", this.extendService.getLianMengDaily(type, date));
    m.addAttribute("date", date);
    return "extend/" + type;
  }
  @RequestMapping(value={"/extend/{type}/daily_fix"}, method={org.springframework.web.bind.annotation.RequestMethod.GET})
  public String lkt(@RequestParam("yyyymmdd") String date, @PathVariable("type") String type, Model m, HttpServletResponse response) {
    List<LianMengDailyVO> list = this.extendLinktechService.getLinktechDaily(type, date);
    m.addAttribute("list", list);
    m.addAttribute("date", date);
    StringBuffer bf = new StringBuffer();
    for (LianMengDailyVO vo : list) {
      String mbrName = null;
      if (vo.getLtinfo().indexOf("@") != -1) {
        mbrName = vo.getLtinfo().substring(0, vo.getLtinfo().indexOf("@"));
      }
      String sta = "";
      if (vo.getStat().equals("1"))
        sta = "100";
      else if ((vo.getStat().equals("-1")) || (vo.getStat().equals("0")))
        sta = "300";
      else if ((vo.getStat().equals("2")) || (vo.getStat().equals("3")) || (vo.getStat().equals("4"))) {
        sta = "200";
      }
      bf.append("2").append("  ").append(vo.getTime()).append("  ").append(vo.getLtinfo().subSequence(vo.getLtinfo().indexOf("@") + 1, vo.getLtinfo().length())).append("  ").append(vo.getOrderCode()).append("  ").append(vo.getProductCode()).append("  ").append(vo.getCount()).append("  ").append(Double.parseDouble(vo.getPrice())).append("  ").append(vo.getCategoryCode()).append("  ");

      if (mbrName != null) {
        bf.append(sta).append("  ").append("A100060164" + mbrName).append("\n");
      }
      else
      {
        bf.append(sta).append("\n");
      }
    }
    m.addAttribute("data", bf.toString());
    return "extend/" + type;
  }
  @RequestMapping(value={"/extend/shopinUnion"}, method={org.springframework.web.bind.annotation.RequestMethod.GET})
  public String shopinUnion(@RequestParam(value="date", required=false) String date, @RequestParam(value="orderId", required=false) String orderId, Model m) {
    m.addAttribute("list", this.extendService.getShopinUnion("shopin-union", date, orderId));
    m.addAttribute("date", date);
    return "extend/shopinUnion";
  }
  @RequestMapping(value={"/extend/updateOrder"}, method={org.springframework.web.bind.annotation.RequestMethod.GET})
  public void update(@RequestParam(value="sid", required=false) String sid, @RequestParam(value="ltype", required=false) String ltype, @RequestParam(value="ltinfo", required=false) String ltinfo, Model m) {
    System.out.println("---sid----" + sid);
    System.out.println("---ltype----" + ltype);
    System.out.println("---ltinfo----" + ltinfo);
    this.extendLinktechService.updateOrder(sid, ltinfo, ltype);
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
  @RequestMapping(value={"/extend/test"}, method={org.springframework.web.bind.annotation.RequestMethod.GET})
  public void test(Model m, HttpServletRequest request) {
    Cookie[] cookies = request.getCookies();
    String ltinfo = "";
    String ltype = "";
    String cid = "";
    String qqlog = "";
    String openid = "";
    for (int i = 0; i < cookies.length; i++) {
      if (cookies[i].getName().equals("LTINFO")) ltinfo = cookies[i].getValue();
      if (cookies[i].getName().equals("LTYPE")) ltype = cookies[i].getValue();
      if (cookies[i].getName().equals("cid")) cid = cookies[i].getValue();
      if (cookies[i].getName().equals("openid")) openid = cookies[i].getValue();
      if (!cookies[i].getName().equals("qqlog")) continue; qqlog = cookies[i].getValue();
    }

    if ((ltinfo.length() > 0) && ("linktech".equals(ltype)) && (qqlog.length() > 0) && (qqlog.equals(openid))) {
      System.out.println("令克特跳转后qq登录下单");
    }

    if ((ltinfo.length() > 0) && ("linktech".equals(ltype)) && ((qqlog.length() == 0) || (!qqlog.equals(openid)))) {
      System.out.println("令克特跳转后下单");
    }

    if ((ltinfo.length() == 0) && (qqlog.length() > 0) && (qqlog.equals(openid)))
      System.out.println("qq登录下单");
  }
}