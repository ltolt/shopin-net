package net.shopin.web.controller;

import net.shopin.api.*;
import net.shopin.view.*;
import net.shopin.web.util.ValidateUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import java.text.DecimalFormat;
import java.util.List;
import java.util.ArrayList;

/**
 * 购物车控制层
 * Description:CartController.
 * User: Su Haibo
 * Date: 2010-1-16
 * To change this template use File | Settings | File Templates.
 */
@Controller
public class CartController
{
   @Autowired
   private ICartService cartService;
   @Autowired
   private IProductListService productListService;
   @Autowired
   private IMemberService memberService;
   @Autowired
   private ISecurityService securityService;
   @Autowired
   private IProductService productService;
   @Autowired
   private IOrderService orderService;


   /**
     * 网站页头显示购物车商品数量,显示用户登录后的订单数量,未登录订单数显示0
     * @param m
     * @param cartId
     * @param uid
     * @param proDetailSID
     * @param promotionPrice
     * @param proQuantity
     * @return
     */
   @RequestMapping(value = "/headerinfo", method = {RequestMethod.GET,RequestMethod.POST})
   public String headerInfo(Model m,@CookieValue(value="shopin_sid",required=false) String cartId,
                            @CookieValue(value="userTicket",required=false) String uid)
   {
       String isLogin="0";
       String username="";
       int proqty=0;
       long orderqty = 0L;
       if(ValidateUtil.validateCartId(cartId)){
          List<CartItem> list=cartService.getCartProList(cartId);
          for(CartItem item:list){
              int add=item.getQty()==null?0:item.getQty().intValue();
              proqty+=add;
          }
       }
       if(validateUid(uid)){
           isLogin="1";
           username=securityService.getLoginUserId(uid).getMemName();
           String memSid=securityService.getLoginUserId(uid).getMembersSid();
           OrderVO ordervo=new OrderVO();
           ordervo.setMembersSid(memSid);
           orderqty = this.orderService.getOrderCount(memSid);
       }
       m.addAttribute("isLogin",""+isLogin);
       m.addAttribute("username",""+username);
       m.addAttribute("proqty",""+proqty);
       m.addAttribute("orderqty",""+orderqty);
       return null;
   }

    /**
     * 增加商品到购物车
     * @param m
     * @param cartId        当前购物车id(请求id)
     * @param req           http请求对象request
     * @param proDetailSID  单品sid
     * @param price         单品上品价格
     * @return
     */
   @RequestMapping(value = "/cart/add", method = {RequestMethod.GET,RequestMethod.POST})
   public void addProduct(Model m,
                            @CookieValue(value="shopin_sid",required=false) String cartId,
                            @CookieValue(value="userTicket",required=false) String uid,
                            String proDetailSID,
                            String promotionPrice,
                            String proQuantity,
                            String positionId,
                            String channelId){
       //校验数据
       if(!validateCartId(cartId)){
          m.addAttribute("result",new AjaxMessageVO("0","很抱歉，当前会话已经失效，请刷新页面"));
       }
       if(!validateProductDetailId(proDetailSID)
               ||!validatePrice(promotionPrice)
               ||!validateQty(proQuantity)){
          m.addAttribute("result",new AjaxMessageVO("0","添加商品到购物车失败"));
       }
       //1.判断单品是否存在
       CartItem item=cartService.getCartItem(cartId,proDetailSID);
       if(item==null){
           item=productListService.getProDetail(proDetailSID,promotionPrice);
           if(item.getSid()==null){
              m.addAttribute("result",new AjaxMessageVO("0","添加商品到购物车失败，请刷新页面"));
           }
       }
       if(ValidateUtil.validateRequired(positionId)){
          item.setPositionId(positionId);
       }
       if(validateRequired(channelId)){
           item.setChannelId(channelId);
       }
       //2.判断单品所属商品关联的会员等级
       ProductVO product=productService.getProduct(item.getProductSid());
       String proMemLevel=product.getMembersLevelSid();
       if(ValidateUtil.validateNumber(proMemLevel)){//如果商品关联的会员级别不是null,且是数字
           if(!validateUid(uid)){
              m.addAttribute("result",new AjaxMessageVO("0","对不起，该商品只有会员才能购买，<br/>如果您是会员，请先登录"));
           }
           String memLevel=securityService.getLoginUserId(uid).getMembersLevelSid();
           if(Integer.parseInt(memLevel)<Integer.parseInt(proMemLevel)){
              String proMemLevelName=memberService.getMemLevelBySid(proMemLevel).getLevelName();
              m.addAttribute("result",new AjaxMessageVO("0","对不起，该商品只有"+proMemLevelName+"才能购买"));
           }
       }
       //3.判断库存中是否有货
       long store=productListService.getProDetailQuantity(proDetailSID,promotionPrice);
       if(store<Integer.parseInt(proQuantity)){
           m.addAttribute("result",new AjaxMessageVO("0","该商品现在缺货"));
       }
       item.setQty(item.getQty()+Integer.parseInt(proQuantity));
       this.cartService.addCartPro(cartId,item);
       m.addAttribute("result",new AjaxMessageVO("1","成功添加商品到购物车"));
   }

    /**
     * 判断库存
     * @param m
     * @param proDetailSID
     * @param price
     * @param qty
     * @return
     */
   @RequestMapping(value = "/cart/checkstore", method = RequestMethod.POST)
   public String checkStore(Model m,String proDetailSID,String price,String qty){
       long store=productListService.getProDetailQuantity(proDetailSID,price);
       m.addAttribute("storeqty",String.valueOf(store));
       if(store<Integer.parseInt(qty)){
          m.addAttribute("result",
                  new AjaxMessageVO("0","当前库存量为"+store+",您最多能订购"+store+"件"));
          return null;
       }
       m.addAttribute("result",
                  new AjaxMessageVO("1",""));
       return null;
   }

    /**
     * 修改购物车中的商品数量
     * @param m
     * @param cartId        当前购物车id(请求id)
     * @param req           http请求对象request
     * @param proDetailSID  单品sid
     * @param price         单品上品价格
     * @param qty           单品数量
     * @return
     */
   @RequestMapping(value = "/cart/updateqty", method = {RequestMethod.GET,RequestMethod.POST})
   public String updateQty(Model m,@CookieValue(value="shopin_sid",required=false) String cartId,
                           String proDetailSID,String price,String qty)
   {
       //校验数据
       if(!validateCartId(cartId)){
          m.addAttribute("result",new AjaxMessageVO("0","很抱歉，当前会话已经失效，请刷新页面"));
          return null;
       }
       String qty_pattern="";
       String price_pattern="";
       m.addAttribute("shopcount",""+cartService.getProCount(proDetailSID));
       if(!validateProductDetailId(proDetailSID)
               ||!validatePrice(price)
               ||!validateQty(qty)){
          m.addAttribute("result",new AjaxMessageVO("0","修改商品数量失败"));
          return null;
       }
       long store=productListService.getProDetailQuantity(proDetailSID,price);
       if(store<Integer.parseInt(qty)){
          m.addAttribute("storeqty",String.valueOf(store));
          m.addAttribute("result",
                  new AjaxMessageVO("0","当前库存量为"+store+",您最多能订购"+store+"件"));
          return null;
       }
       cartService.updateCartProQty(cartId,proDetailSID,Integer.parseInt(qty));
       m.addAttribute("result",new AjaxMessageVO("1","修改商品数量成功"));
       return null;
   }

    /**
     * 删除购物车中的一个商品
     * @param m
     * @param cartId        当前购物车id(请求id)
     * @param req           http请求对象request
     * @param proDetailSID  单品sid
     * @return
     */
   @RequestMapping(value = "/cart/remove", method = {RequestMethod.GET,RequestMethod.POST})
   public String removeProduct(Model m,@CookieValue(value="shopin_sid",required=false) String cartId,
                               String proDetailSID)
   {
       //校验数据
       if(!validateCartId(cartId)){
          m.addAttribute("result",new AjaxMessageVO("0","很抱歉，当前会话已经失效，请刷新页面"));
          return null;
        }
       if(!validateProductDetailId(proDetailSID)){
          m.addAttribute("result",new AjaxMessageVO("0","移除商品失败"));
          return null;
       }
       cartService.delCartPro(cartId,proDetailSID);
       m.addAttribute("result",new AjaxMessageVO("1","成功移除商品"));
       return null;
   }

   /**
     * 清空购物车中的商品
     * @param m
     * @param cartId        当前购物车id(请求id)
     * @param req           http请求对象request
     * @return
     */
   @RequestMapping(value = "/cart/clear", method = {RequestMethod.GET,RequestMethod.POST})
   public String clearCart(Model m,@CookieValue(value="shopin_sid",required=false) String cartId)
   {
        //校验数据
        if(!validateCartId(cartId)){
          m.addAttribute("result",new AjaxMessageVO("0","很抱歉，当前会话已经失效，请刷新页面"));
          return null;
        }
        cartService.clearCartPro(cartId);
        m.addAttribute("result",new AjaxMessageVO("1","清空购物车成功"));
        return null;
   }

    /**
     * 跳转到购物车界面
     * @param m
     * @return
     */
   @RequestMapping(value = "/cart/show", method = {RequestMethod.GET,RequestMethod.POST})
   public String showCart(Model m,@CookieValue(value="shopin_sid",required=false) String cartId)
   {
       if(!validateCartId(cartId)){
           return "redirect:/cart/show.html";
       }
       Cart cart=cartService.getCart(cartId);
       double money=0.0D;
       int total=0;
       for(CartItem item:cart.getItemList()){
            money+=Double.parseDouble(item.getPromotionPrice())*item.getQty().intValue();
            total+=item.getQty().intValue();
           item.setShopCount(""+cartService.getProCount(item.getSid()));
           item.setStoreCount(""+productListService.getProDetailQuantity(
                   item.getSid(),item.getPromotionPrice()));
           ProductVO productVO = productService.getProduct(item.getProductSid());
           if (productVO.getProPicture() != null) {
               ProductPicVO productPicVO = productVO.getProPicture();
               item.setProPicture(productPicVO.getProPictDir() + productPicVO.getProPictName());
           }
       }
       m.addAttribute("cartlist",cart.getItemList());
       m.addAttribute("amount",new DecimalFormat("0.00").format(money));
       m.addAttribute("total",String.valueOf(total));
       return "buying/cart";
   }

   private boolean validateRequired(String str){
      return (str != null) && (!"".equals(str));
   }
   //校验cartId,会话id
   private boolean validateCartId(String cartId){
      return validateRequired(cartId);
   }
    //校验登录的id
   private boolean validateUid(String uid){
      return (validateRequired(uid)) && (this.securityService.isUserLogin(uid));
   }

   private boolean validateProductDetailId(String productDetailId){
      return validateRequired(productDetailId);
   }
    //校验价格
   private boolean validatePrice(String price){
       String pattern="\\d+(\\.\\d{1,2})?";
       if(price==null||!price.matches(pattern)){
           return false;
       }
       return true;
   }
    //校验数量
   private boolean validateQty(String qty){
       String pattern="[1-9]{1}[0-9]*";
       if(qty==null||!qty.matches(pattern)){
           return false;
       }
       return true;
   }
    //校验收货地址
   private boolean validateAddress(MemberAddressVO address){
       String addr=address.getAddress();
       String citySid=address.getDeliCitySid();
       String cityName=address.getCityName();
       String provinceSid=address.getDeliProvinceSid();
       String memberSid=address.getMembersSid();
       String mobileTel=address.getMobileTel();
       String name=address.getName();
       String postcode=address.getPostcode();
       String provinceName=address.getProvinceName();
       String tel=address.getTel();
       if(addr==null||!addr.matches("\\s+")){
            return false;
       }
       if(citySid==null||"".equals(citySid)){
           return false;
       }
       if(cityName==null||!cityName.matches("\\s+")){
           return false;
       }
       if(provinceSid==null||"".equals(provinceSid)){
           return false;
       }
       if(name==null||!name.matches("\\s+")){
           return false;
       }
       if(postcode==null||!postcode.matches("\\d{6}")){
           return false;
       }
       if(provinceName==null||!provinceName.matches("\\s+")){
           return false;
       }
       if(tel==null||!tel.matches("13[0-9]{1}\\d{8}")
               ||!tel.matches("\\d{3}-?\\d{8}")
               ||!tel.matches("\\d{4}-?\\d{7}")){
           return false;
       }
       return true;
   }

}
