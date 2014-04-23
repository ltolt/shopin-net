//Source file: D:\\二版开发\\上品折扣网设计文档\\lqw\\net\\shopin\\web\\controller\\MemberAccountController.java

package net.shopin.web.controller;

import com.shopin.modules.utils.PageHelper;
import com.shopin.modules.web.view.PageVO;
import net.shopin.api.IMemberAccountService;
import net.shopin.api.ISecurityService;
import net.shopin.view.MemAccountRecordVO;
import net.shopin.view.MemberAccountVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;

/**
 * 会员账户管理控制器
 * Description:MemberAccountController.
 * User: Su Haibo
 * Date: 2010-1-16
 * To change this template use File | Settings | File Templates.
 */
@Controller
public class MemberAccountController
{
   @Autowired
   private IMemberAccountService accountService;
   @Autowired
   private ISecurityService securityService;
   /**
    * @roseuid 4B527A05008C
    */
   public MemberAccountController()
   {

   }

//   /**
//    * 显示会员账户信息
//    * @return String
//    * @roseuid 4B4ECB48038A
//    */
//   @RequestMapping(value = "/account/show/{page}.html", method = {RequestMethod.GET,RequestMethod.POST})
//   public String showAccount(Model m,@PathVariable("page") String pageNo,
//                             @CookieValue("userTicket") String uid, HttpServletRequest req)
//   {
//       uid=securityService.getLoginUserId(uid).getMembersSid();
//       MemberAccountVO account= accountService.getAccount(uid);
//       PageVO<MemAccountRecordVO> page=new PageVO<MemAccountRecordVO>(10,true);
//       page.setPageNo(Integer.parseInt(pageNo));
//       page=accountService.getAccountRecord(page,uid);
//       m.addAttribute("account",account);
//       m.addAttribute("account_list",page.getList());
//       PageHelper pageHelper = new PageHelper(req, "page.ftl", "/account/show");
//       m.addAttribute("page", pageHelper.getPageBreakStr(page));
//       return "myshopin/account";
//   }
}
