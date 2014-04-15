package net.shopin.service;

import com.shopin.modules.web.view.PageVO;
import net.shopin.api.IFavorService;
import net.shopin.view.ProductVO;
import org.junit.Before;
import org.junit.Test;
import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

/**
 * Created by IntelliJ IDEA.
 * User: lqw
 * Date: 2010-1-19
 * Time: 12:56:14
 * To change this template use File | Settings | File Templates.
 */
public class FavorServiceImplTest {
    private static AbstractApplicationContext context;
    private IFavorService favorService;

    @Before
    public void setUp() throws Exception {
        context = new ClassPathXmlApplicationContext("spring.xml");
        favorService = (IFavorService) context.getBean("favorService");

    }


//    @org.junit.Test
//    public void testGetProductList() throws Exception {
//        PageVO<ProductVO> page = new PageVO<ProductVO>(10, true);
//        page = memberService.getAllProduct(page, "29");
//        for (ProductVO vo : page.getList()) {
//            System.out.println("------" + vo);
//        }
//    }

    @org.junit.Test
    public void testAddProduct() throws Exception {
//	favorService.addProduct("29", "1");
    }

//    @org.junit.Test
//    public void testDelProduct() throws Exception {
//        memberService.removeProduct("26", "10004625");
//    }
}
