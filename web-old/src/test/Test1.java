package test;

import cn.com.infosec.util.Base64;
import net.shopin.api.ISaleRecordService;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.io.IOException;
import java.sql.Timestamp;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.net.URLEncoder;
import java.net.URLDecoder;
import java.io.UnsupportedEncodingException;

/**
 * Created by IntelliJ IDEA.
 * User: yanwt
 * Date: 2008-10-15
 * Time: 13:47:41
 */
public class Test1 {


    public static void main(String[] args) {
        /*ApplicationContext ctx = new ClassPathXmlApplicationContext("spring-client.xml");
        ISaleRecordService saleRecordService = (ISaleRecordService) ctx.getBean("saleRecordService");
        List list =saleRecordService.findNewSaleRecord();
        for (int i = 0; i < list.size(); i++) {
            Object o = list.get(i);
            
        }*/
        String viewinfo="%25E5%25B0%258A%25E6%2595%25AC%25E7%259A%2584QQ%25E4%25BC%259A%25E5%2591%2598%25EF%25BC%259A%253Cu%253Exss%253C%252Fu%253E%253C%2521";
        try {
            if (viewinfo.lastIndexOf("%25") > 0) {
            viewinfo = URLDecoder.decode(viewinfo.replaceAll("%25", "%"), "UTF-8");
            }
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        System.out.println(viewinfo);
        /*  ApplicationContext ctx = new ClassPathXmlApplicationContext("spring-client.xml");

        SearchService searchService = (SearchService) ctx.getBean("searchService");
        PageVO<SearchProductVO> page = new PageVO<SearchProductVO>(20,true);
        //page.setPageNo(50);
        page = searchService.searchProduct(page,"阿桑娜 稳重 中华","","");
        //page
        List<SearchProductVO> list = page.getList();
        for (int i = 0; i < list.size(); i++) {
            SearchProductVO searchProductVO = list.get(i);
            System.out.println(searchProductVO);
        }
        System.out.println("------"+page.getTotalCount());

        SeachResultTypeVO seachResultTypeVO = searchService.searchProClass("阿桑娜 稳重 中华 北京","","");
        Iterator<SearchClassVO> iterator =seachResultTypeVO.getProClass().iterator();
        while (iterator.hasNext()) {
            SearchClassVO searchClassVO = iterator.next();
            System.out.println(""+searchClassVO);
        }
        Iterator<SearchClassVO> iterator1 =seachResultTypeVO.getProName().iterator();
        while (iterator1.hasNext()) {
            SearchClassVO searchClassVO = iterator1.next();
            System.out.println(""+searchClassVO);
        }*/


//
//        HelloWorld hessianService = (HelloWorld) ctx.getBean("hessianService");
//        System.out.println(""+ System.currentTimeMillis());
//        String hessianResult = hessianService.sayHello("你好!");
//        System.out.println(""+ System.currentTimeMillis());
//        System.out.println(hessianResult);
//
//        HelloWorld burlapService = (HelloWorld) ctx.getBean("burlapService");
//        System.out.println(""+ System.currentTimeMillis());
//        String burlapResult = burlapService.sayHello("你好!");
//        System.out.println(""+ System.currentTimeMillis());
//        System.out.println(burlapResult);


/*        MemberService member = (MemberService) ctx.getBean("memberService");
        System.out.println(""+ System.currentTimeMillis());
        //System.out.println(member.account(1+""));
        System.out.println("-----------");
        System.out.println();
        System.out.println(""+ System.currentTimeMillis());*/
        try {
            System.out.println(Base64.encode("商品描述"));
            //System.out.println(URLEncoder.encode("商品描述","UTF-8"));
            //System.out.println(URLDecoder.decode(new String ("RqPnCoPT3K9%252Fvwbh3I%252BI1vPesSHAW1RsgowFsghk035pBOilkQmMeXZVQvidkMnpTAdG".getBytes("ISO-8859-1"),"UTF-8"), "UTF-8"));
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }

    }

}