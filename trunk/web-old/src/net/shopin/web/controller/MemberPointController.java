//Source file: D:\\二版开发\\上品折扣网设计文档\\lqw\\net\\shopin\\web\\controller\\MemberScoreController.java

package net.shopin.web.controller;

import com.shopin.modules.utils.PageHelper;
import com.shopin.modules.web.view.PageVO;
import net.shopin.api.IMemberPointService;
import net.shopin.api.ISecurityService;
import net.shopin.view.MemPointRecordVO;
import net.shopin.view.MemberPointVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;


/**
 * 会员积分管理控制器
 * Description:MemberPointController.
 * User: Su Haibo
 * Date: 2010-1-16
 * To change this template use File | Settings | File Templates.
 */
@Controller
public class MemberPointController
{
   @Autowired
   private IMemberPointService pointService;
   @Autowired
   private ISecurityService securityService;

   /**
    * @roseuid 4B527A050177
    */
   public MemberPointController()
   {

   }

//    /**
//     * 显示会员积分信息
//     * @roseuid 4B4ED14203C8
//     */
//   @RequestMapping(value = "/point/show", method = {RequestMethod.GET,RequestMethod.POST})
//   public String showPoint(Model m,@PathVariable("page") String pageNo,
//                             @CookieValue("userTicket") String uid, HttpServletRequest req)
//   {
//       uid=securityService.getLoginUserId(uid).getMembersSid();
//       MemberPointVO point=pointService.getPoint(uid);
//       PageVO<MemPointRecordVO> page=new PageVO<MemPointRecordVO>(10,true);
//       page.setPageNo(Integer.parseInt(pageNo));
//       page=pointService.getPointRecord(page,uid);
//       m.addAttribute("point",point);
//       m.addAttribute("point_list",page.getList());
//       PageHelper pageHelper = new PageHelper(req, "page.ftl", "/point/show");
//       m.addAttribute("page", pageHelper.getPageBreakStr(page));
//       return "myshopin/point";
//   }
}
