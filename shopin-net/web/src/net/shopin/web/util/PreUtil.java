package net.shopin.web.util;

import net.shopin.view.OrderVO;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.ui.Model;

import javax.servlet.http.HttpServletRequest;

/**
 * Created by IntelliJ IDEA.
 * User: win
 * Date: 12-11-29
 * Time: 下午7:14
 * To change this template use File | Settings | File Templates.
 */
public class PreUtil {

    protected static final Logger logger = LoggerFactory.getLogger(PreUtil.class);


    public static String getReturnPage(Model m, HttpServletRequest request, OrderVO vo, String returnPage, int bookflag) {
        logger.info("-------------------Enter pay callback begin--------------------");
        String str = "pay/paySucess";
        //假如是预售活动的尾款订单，在成功页面需要显示订单价格+预收款这种形式，请求域需要添加属性标记
        if (bookflag == 0) { //预售僵尸订单bookflag=0 预售正品订单bookflag=1
            str = "pay/payPreSucess";
            logger.info("-------------------Enter pay pre--------------------");
        } else if (bookflag == 2) {//券订单bookflag=2 优惠券购买的订单bookflag=3
            str = "pay/presentSucess";
            logger.info("-------------------Enter pay quan--------------------");
        }
        logger.info("-------------------Enter pay callback end--------------------");
        return str;
    }
}
