package net.shopin.web.payController;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import net.shopin.view.OrderVO;
import net.shopin.view.WebProductVO;
import net.shopin.web.util.OrderUtil;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/pay")
public class PaymentCommonController {
	
	@RequestMapping(value={"/paySucess"}, method={RequestMethod.GET, RequestMethod.POST})
	public String paySucess(Model m,HttpServletRequest req){
			String orderNO =  req.getParameter("orderNo");
			OrderVO orderVO = OrderUtil.getOrderByNO(orderNO, true);
          //获取商品推荐列表
          List<WebProductVO> webProductVOList = OrderUtil.getTJProducts();
          m.addAttribute("webProductVOList", webProductVOList);
          m.addAttribute("order", orderVO);
		return "pay/paySucess";
	}
	
	@RequestMapping(value={"/payFail"}, method={RequestMethod.GET, RequestMethod.POST})
	public String payFail(Model m,HttpServletRequest req){
			String orderNO =  req.getParameter("orderNo");
			OrderVO orderVO = OrderUtil.getOrderByNO(orderNO, true);
          //获取商品推荐列表
          List<WebProductVO> webProductVOList = OrderUtil.getTJProducts();
          m.addAttribute("webProductVOList", webProductVOList);
          m.addAttribute("order", orderVO);
		return "pay/payFail";
	}
}
