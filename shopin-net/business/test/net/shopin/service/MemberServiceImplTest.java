//package net.shopin.service;
//
//import com.shopin.modules.utils.Codec;
//import com.shopin.modules.web.view.PageVO;
//import net.shopin.api.IMemberService;
//import net.shopin.entity.Members;
//import net.shopin.view.MemberAddressVO;
//import net.shopin.view.MemberPersonalInfoVO;
//import net.shopin.view.MemberVO;
//import net.shopin.view.ProReviewsVO;
//import org.junit.After;
//import org.junit.Before;
//import org.junit.Test;
//import org.springframework.context.support.AbstractApplicationContext;
//import org.springframework.context.support.ClassPathXmlApplicationContext;
//
//import java.math.BigInteger;
//import java.text.SimpleDateFormat;
//import java.util.Date;
//import java.util.List;
//
///**
// * Created by IntelliJ IDEA.
// * User: lqw
// * Date: 2010-1-17
// * Time: 12:20:32
// * To change this template use File | Settings | File Templates.
// */
//public class MemberServiceImplTest {
//
//    private static AbstractApplicationContext context;
//    private IMemberService memberService;
//
//    @Before
//    public void setUp() throws Exception {
//        context = new ClassPathXmlApplicationContext("spring.xml");
//        memberService = (IMemberService) context.getBean("memberService");
//
//    }
//
//    @After
//    public void tearDown() throws Exception {
//    }
//
//    @org.junit.Test
//    public void testLogin() throws Exception {
//        Boolean result=memberService.login("lqw8668@gsmail.com","99Z52k");
//        System.out.println("----------"+result);
//    }
//
//    @org.junit.Test
//    public void testValidateEmail() throws Exception {
//        Boolean result = memberService.validateEmail("lqw8668@hotmail.com");
//        System.out.println("-------" + result);
//    }
//
//    @org.junit.Test
//    public void testRegister() throws Exception {
//        MemberVO memberVO = new MemberVO();
//        memberVO.setMemEmail("lqw8668@hotmail.com");
//        memberVO.setMemPwd("456321");
//        memberService.register(memberVO);
//    }
//
//    @org.junit.Test
//    public void getMemberByEmail() throws Exception {
//        MemberVO memberVO = memberService.getMemberByEmail("lqw8668@hotmail.com");
//        System.out.println("-----------" + memberVO);
//    }
//
//    @org.junit.Test
//    public void getMemberBySid() throws Exception {
//        MemberVO memberVO = memberService.getMemberBySid("26");
//        System.out.println("-----------" + memberVO);
//    }
//
//    @org.junit.Test
//    public void testSavePersonal() throws Exception {
//        MemberPersonalInfoVO vo = new MemberPersonalInfoVO();
//        vo.setMembersSid("28");
//        vo.setAddress("北京市海淀区");
//        vo.setBirthdate("2006-10-11 12:46:25");
//        vo.setCareer("java");
//        vo.setEarnings("2000");
//        vo.setInterest("java");
//        vo.setSex("0");
//        vo.setStature("172");
//        vo.setTel("13241976608");
//        vo.setWeight("120");
//        memberService.savePersonal(vo);
//    }
//
//    @org.junit.Test
//    public void testModify() throws Exception {
//        MemberVO memberVO = new MemberVO();
////        memberVO.setId("29");
//        memberVO.setMembersSid("28");
//        memberVO.setMemEmail("mfl@gmail.com");
//        memberVO.setMemPwd(Codec.encodeMd5("123456"));
//        memberService.modify(memberVO);
//    }
//
//    @org.junit.Test
//    public void testFetchPassword() throws Exception {
//    }
//
//    @org.junit.Test
//    public void testSaveAddress() throws Exception {
//        for (int i = 0; i < 10; i++) {
//            MemberAddressVO addressVO = new MemberAddressVO();
//            addressVO.setAddress("北京市海淀区中心大厦");
//            addressVO.setDeliCitySid("1");
//            addressVO.setDeliProvinceSid("1");
//            addressVO.setMembersSid("29");
//            addressVO.setMobileTel("13241976609");
//            addressVO.setName("刘备");
//            addressVO.setPostcode("100101");
//            addressVO.setTel("053166787454");
//            memberService.saveAddress(addressVO);
//        }
//    }
//
//    @org.junit.Test
//    public void testGetAdressList() throws Exception {
//        List<MemberAddressVO> list = memberService.getAdressList("29");
//        System.out.println("------------" + list.size());
//        for (MemberAddressVO vo : list) {
//            System.out.println("----------" + vo);
//        }
//    }
//
//    @org.junit.Test
//    public void testGetPersional() throws Exception {
//        MemberPersonalInfoVO vo = memberService.getPersional("26");
//        System.out.println("--------" + vo);
//    }
//
//    @org.junit.Test
//    public void testGetMemberCount() throws Exception {
//        System.out.println("-------" + memberService.getMemberCount());
//    }
//
//    @org.junit.Test
//    public void testModifyPassword() throws Exception {
//        MemberVO vo = new MemberVO();
////        vo.setId("26");
//        vo.setOldPwd("123456");
//        vo.setMemPwd("987654");
//        System.out.println("---------" + memberService.modifyPassword(vo));
//
//    }
//
//    @org.junit.Test
//    public void testSaveProReviews() throws Exception {
//        PageVO<ProReviewsVO> page = new PageVO<ProReviewsVO>(10, true);
//
//        page = memberService.getAllProReviews(page, "29");
//        for (ProReviewsVO vo : page.getList()) {
//            System.out.println("-----" + vo);
//        }
//
//    }
//}
