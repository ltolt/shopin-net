//Source file: D:\\二版开发\\上品折扣网设计文档\\lqw\\net\\shopin\\web\\controller\\FavorController.java

package net.shopin.web.controller;

import com.shopin.modules.utils.PageHelper;
import com.shopin.modules.web.view.PageVO;
import net.shopin.api.IFavorService;
import net.shopin.api.IProductService;
import net.shopin.api.ISecurityService;
import net.shopin.view.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;

/**
 * 收藏夹控制器
 * Description:FavorController.
 * User: Su Haibo
 * Date: 2010-1-16
 * To change this template use File | Settings | File Templates.
 */
@Controller
public class FavorController
{
   @Autowired
   private ISecurityService securityService;
   @Autowired
   private IProductService productService;
   @Autowired
   private IFavorService favorService;
   /**
    * @roseuid 4B527A05003E
    */
   public FavorController()
   {

   }

//   /**
//    * 显示收藏夹中的商品
//    * @return String
//    * @roseuid 4B502D6E01D4
//    */
//   @RequestMapping(value = "/favorite/show/{page}",method = {RequestMethod.GET,RequestMethod.POST})
//   public String showFavor(Model m,@PathVariable("page") String pageNo,
//                             @CookieValue(value="userTicket",required=false) String uid,  HttpServletRequest req)
//   {
//       uid=securityService.getLoginUserId(uid).getMembersSid();
//       PageVO<ProductVO> page=new PageVO<ProductVO>(5,true);
//       page.setPageNo(Integer.parseInt(pageNo));
//       page=favorService.getAllProduct(page,uid);
//       m.addAttribute("product_list",page.getList());
//       PageHelper pageHelper = new PageHelper(req, "page.ftl", "/favorite/show");
//       m.addAttribute("page", pageHelper.getPageBreakStr(page));
//       System.out.println("page:"+pageHelper.getPageBreakStr(page));
//       return "myshopin/favorite";
//   }
    
    /**
    * 显示收藏夹中的商品,收藏夹为空,测试方法,将来合到showFavor里面
    * @return String
    * @roseuid 4B502D6E01D4
    */
   @RequestMapping(value = "/favorite/show2",method = {RequestMethod.GET,RequestMethod.POST})
   public String showFavor2(Model m)
   {
        return "myshopin/favorite_empty";
   }

   /**
    * 从收藏夹中移除商品
    * @return String
    * @roseuid 4B502D8402AF
    */
   @RequestMapping(value = "/favorite/remove", method = {RequestMethod.GET,RequestMethod.POST})
   public String delProduct(Model m,@CookieValue(value="userTicket",required=false) String uid, 
                            HttpServletRequest req,String productSID)
   {
       if(uid==null||!securityService.isUserLogin(uid)){
            m.addAttribute("result",new AjaxMessageVO("0","当前会话已经失效"));
            return null;
       }
       ProductVO product=productService.getProduct(productSID);
       uid=securityService.getLoginUserId(uid).getMembersSid();
       favorService.removeProduct(uid,productSID);
       m.addAttribute("result",new AjaxMessageVO("1",
               "成功从收藏夹中移除商品:"+product.getProductName()));
       return null;
   }

   /**
    * 添加商品到收藏夹
    * @roseuid 4B515CFC01A5
    */
   @RequestMapping(value = "/favorite/add", method = {RequestMethod.GET,RequestMethod.POST})
   public String addProduct(Model m,@CookieValue(value="userTicket",required=false) String uid, 
                            HttpServletRequest req,String productSID)
   {
        if(!validateUid(uid)){
            m.addAttribute("result",new AjaxMessageVO("0","登录后才能收藏"));
            return null;
        }
        uid=securityService.getLoginUserId(uid).getMembersSid();
       ProductVO product=productService.getProduct(productSID);
       favorService.addProduct(uid,productSID);
        m.addAttribute("result",new AjaxMessageVO("1",
               "成功添加商品:"+product.getProductName()+"到收藏夹"));
        return null;
   }

   private boolean validateRequired(String str){
       if(str==null||"".equals(str)){
           return false;
       }
       return true;
   }
   //校验cartId,会话id
   private boolean validateCartId(String cartId){
      return validateRequired(cartId);
   }
    //校验登录的id
   private boolean validateUid(String uid){
       if(!validateRequired(uid)||!securityService.isUserLogin(uid)){
           return false;
       }
       return true;
   }
}
