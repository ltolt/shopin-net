package net.shopin.web.controller;

import net.shopin.api.ICartService;
import net.shopin.api.ICountProductService;
import net.shopin.api.IProductListService;
import net.shopin.api.IProductService;
import net.shopin.view.CountProductVO;
import net.shopin.view.ProColorDetailVO;
import net.shopin.view.ProDetailVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * Created by IntelliJ IDEA.
 * User: jptong
 * Date: 12-1-12
 * Time: 下午4:19
 * To change this template use File | Settings | File Templates.
 */
@Controller
public class CountProductController {
   @Autowired
   private ICartService cartService;
   @Autowired
   private ICountProductService countProductService;

    @RequestMapping(value = "/countProduct/index", method = RequestMethod.GET)
    public String index(Model m,HttpServletRequest request) {
        return "channel/cangchu";
    }

    @RequestMapping(value = "/countProduct/getStock", method = RequestMethod.POST)
    public void getStock(Model m, String proSid, String price) {
        List<CountProductVO> list = countProductService.getCountProductByProSid(proSid, price);
          long total=0l;
        if(list!=null&&list.size()>0){
          CountProductVO cpo=  list.get(0);
          total=cpo.getStockNum();
        }
        m.addAttribute("result", total);

    }

    @RequestMapping(value = "/countProduct/getAddToCart", method = RequestMethod.POST)
    public void getAddToCart(Model m, String proSid, String price) {
        List<ProDetailVO>  list=countProductService.getProDetailByProSid(proSid, price);
        long total=0l;
        if(list!=null&&list.size()>0){
            for(ProDetailVO pd:list){
                   total += cartService.getProCount(pd.getSid());
            }
        }
        m.addAttribute("result", total);
    }
}
