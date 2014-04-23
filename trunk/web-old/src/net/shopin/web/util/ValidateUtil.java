package net.shopin.web.util;

import net.shopin.api.ICartService;
import net.shopin.api.ISecurityService;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * 后台校验
 * Created by IntelliJ IDEA.
 * User: user
 * Date: 2010-2-6
 * Time: 14:19:27
 */
public class ValidateUtil {

   //校验非空 
   public static boolean validateRequired(String str){
       if(str==null||"".equals(str)){
           return false;
       }
       return true;
   } 

    //校验cartId,会话id
   public static boolean validateCartId(String cartId){
      return validateRequired(cartId);
   }
   
    //校验ProductDetailId
   public static boolean validateProductDetailId(String productDetailId){
       if(!validateRequired(productDetailId)){
           return false;
       }
       return true;
   }

   //校验整数
   public static boolean validateNumber(String number){
       if(!validateRequired(number)){
           return false;
       }
       if(!number.matches("\\d+")){
           return false;
       }
       return true;
   }

    //校验价格
   public static boolean validateMoney(String price){
       String pattern="\\d+(\\.\\d{1,2})?";
       if(price==null||!price.matches(pattern)){
           return false;
       }
       return true;
   }

   //校验数量
   public static boolean validateQty(String qty){
       String pattern="[1-9]{1}[0-9]*";
       if(qty==null||!qty.matches(pattern)){
           return false;
       }
       return true;
   }
   //校验邮政编码
   public static boolean validatePostCode(String postCode){
      if(!validateRequired(postCode)){
          return false;
      }
      if(!postCode.matches("\\d{6}")){
          return false;
      }
      return true;
   }
   //校验电话,(手机和座机皆可,区号和好吗间可以带短横-)
   public static boolean validateTel(String tel){
      if(!validateRequired(tel)){
          return false;
      }
      if(!tel.matches("13[0-9]{1}\\d{8}")
              &&!tel.matches("\\d{3}-?\\d{8}")
              &&!tel.matches("\\d{4}-?\\d{7}")
              ){
          return false;
      }
      return true;
   }

   /**
    * 校验email
    * @param email
    * @return
    */
   public static boolean validateEmail(String email){
       String pattern="([a-zA-Z0-9]+[_|\\-|\\.]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|\\-|\\.]?)*[a-zA-Z0-9]+\\.[a-zA-Z]{2,3}";
       if(!validateRequired(email)||!email.matches(pattern)){
           return false;
       }
       return true;
   }
   
}
