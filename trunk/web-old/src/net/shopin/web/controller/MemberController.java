//Source file: D:\\二版开发\\上品折扣网设计文档\\lqw\\net\\shopin\\web\\controller\\MemberController.java

package net.shopin.web.controller;

import com.shopin.modules.utils.Codec;
import com.shopin.modules.web.view.PageVO;
import net.shopin.api.*;
import net.shopin.view.*;
import net.shopin.web.util.CodeUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import com.shopin.modules.security.interceptor.MethodSecurity;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

/**
 * 会员管理控制器
 * Description:CartController.
 * User: Su Haibo
 * Date: 2010-1-16
 * To change this template use File | Settings | File Templates.
 */
@Controller
public class MemberController {
    @Autowired
    private IMemberService memberService;
    @Autowired
    ISecurityService securityService;
    @Autowired
    IEmailService emailService;
    @Autowired
    IProReviewService proReviewService;

    /**
     * @roseuid 4B527A050109
     */
    public MemberController() {

    }

    /**
     * 校验验证码
     *
     * @param verifyCode
     * @return
     */
    private boolean validateVerifyCode(String verifyCode) {
        return true;
    }

    /**
     * 注册页面
     *
     * @return String
     * @roseuid 4B4EB1F70399
     */
    @RequestMapping(value = "/goRegister")
    public String goRegister(Model m,String forward) {
        m.addAttribute("forward", forward);
        return "buying/register";
    }

    /**
     * 校验注册时的邮箱是否可用
     *
     * @return java.lang.String
     * @roseuid 4B4E90BD01C5
     */
    @RequestMapping(value = "/validateEmail", method = RequestMethod.POST)
    public String validateEmail(Model m, String email) {
        boolean flag = memberService.validateEmail(email);
        if (flag) {
            m.addAttribute("result", new AjaxMessageVO("1", "邮箱地址可以使用"));
        } else {
            m.addAttribute("result", new AjaxMessageVO("0", "邮箱地址已经存在,请换一个"));
        }
        return null;
    }

    /**
     * 会员注册
     *
     * @return java.lang.String
     * @roseuid 4B4E90BD01C5
     */
    @RequestMapping(value = "/register", method = RequestMethod.POST)
    public String register(Model m, MemberVO member,@RequestParam("forward") String forward,HttpServletResponse response) {
        String email_pattern = "\\w+([-+.]\\w+)*@\\w+([-.]\\w+)*\\.\\w+([-.]\\w+)*";
        String pwd_pattern = "";
        if (member.getMemEmail() == null || "".equals(member.getMemEmail())
                || !member.getMemEmail().matches(email_pattern)) {
            m.addAttribute("result", new AjaxMessageVO("01", "邮箱地址不正确"));
            return "buying/register";
        }
        if (member.getMemPwd() == null || "".equals(member.getMemPwd())
                || member.getMemPwd().matches(pwd_pattern)) {
            m.addAttribute("result", new AjaxMessageVO("02", "邮箱地址已经被使用,请换一个"));
            return "buying/register";
        }
        if (!memberService.validateEmail(member.getMemEmail())) {
            m.addAttribute("result", new AjaxMessageVO("03", "密码不正确"));
            return "buying/register";
        }
        memberService.register(member);
        String uid = UUID.randomUUID().toString();
        securityService.addLoginUser(uid, memberService.getMemberByEmail(member.getMemEmail()));
        Cookie cookie = new Cookie("userTicket", uid);
        cookie.setPath("/");
        response.addCookie(cookie);
        if (forward == null || "".equals(forward)) {
            return "redirect:/index.html";
        }
        return "redirect:" + forward;
    }

    @RequestMapping(value = "/forgetPassword", method = RequestMethod.GET)
    public String forgetPassword(Model m, String email) {
        return "forgetPassword";
    }

    /**
     * 找回密码
     *
     * @return String
     * @roseuid 4B4EB703034B
     */
    @RequestMapping(value = "/fetchPassword", method = RequestMethod.POST)
    public void fetchPassword(Model m, String email) {
        String email_pattern = "\\w+([-+.]\\w+)*@\\w+([-.]\\w+)*\\.\\w+([-.]\\w+)*";
        String emailServer = "";
        if (email == null || "".equals(email) || !email.matches(email_pattern)) {
            m.addAttribute("result", new AjaxMessageVO("01", "邮箱地址不正确"));
            return;
        }
        MemberVO member = memberService.getMemberByEmail(email);
        if (null == member.getSid() || "".equals(member.getSid())) {
            m.addAttribute("result", new AjaxMessageVO("02", "邮箱地址不存在"));
            return;
        }
        memberService.resetPassword(member.getSid());
        m.addAttribute("result", new AjaxMessageVO().addstatus("1"));
        return;
    }

    /**
     * 设置会员个性化信息
     *
     * @return String
     * @roseuid 4B4EA7C90203
     */
    @RequestMapping(value = "/member/savePersonal", method = {RequestMethod.GET, RequestMethod.POST})
    public String savePersonalInfo(Model m, @CookieValue(value = "userTicket", required = false) String uid,
                                   HttpServletRequest req, MemberPersonalInfoVO info) {
        if (uid == null || !securityService.isUserLogin(uid)) {
            m.addAttribute("result", new AjaxMessageVO("0", "很抱歉，您还没有登录"));
            return null;
        }
        uid = securityService.getLoginUserId(uid).getMembersSid();
        info.setMembersSid(uid);
        info.setBirthdate(info.getBirthdate() + " 00:00:00");
        memberService.savePersonal(info);
        m.addAttribute("result", new AjaxMessageVO("1", "保存个性化信息成功"));
        return null;
    }

    /**
     * 判断当前请求,用户是否登录
     *
     * @param m
     * @param uid
     * @param request
     * @return
     */
    @RequestMapping(value = "/isLogin", method = RequestMethod.POST)
    public String login(Model m, @CookieValue(value = "userTicket", required = false) String uid, HttpServletRequest request) {
        if (uid != null && securityService.isUserLogin(uid)) {
            m.addAttribute("result", "1");
            m.addAttribute("username", securityService.getLoginUserId(uid).getMemName());
        } else {
            m.addAttribute("result", "0");
        }
        return null;
    }

    /**
     * 修改会员地址信息
     *
     * @roseuid 4B4EBB240222
     */
    @RequestMapping(value = "/member/addressEdit", method = {RequestMethod.GET, RequestMethod.POST})
    public String editAddress(Model m, @CookieValue(value = "userTicket", required = false) String uid,
                              HttpServletRequest req, MemberAddressVO address) {
        if (uid == null || !securityService.isUserLogin(uid)) {
            m.addAttribute("result", new AjaxMessageVO("0", "很抱歉，您还没有登录"));
            return null;
        }
        uid = securityService.getLoginUserId(uid).getMembersSid();
        if (address.getSid() == null || "".equals(address.getSid())) {
            m.addAttribute("result", new AjaxMessageVO("0", "修改地址信息失败"));
            return null;
        }
        MemberAddressVO old = memberService.getAddress(address.getSid());
        if (old == null) {
            m.addAttribute("result", new AjaxMessageVO("0", "修改地址信息失败，地址信息不存在"));
            return null;
        }
        if (!uid.equals(old.getMembersSid())) {
            m.addAttribute("result", new AjaxMessageVO("0", "修改地址信息失败"));
            return null;
        }
        address.setMembersSid(uid);
        memberService.saveAddress(address);
        m.addAttribute("result", new AjaxMessageVO("1", "修改地址信息成功"));
        return null;
    }

    /**
     * 保存会员地址信息
     *
     * @roseuid 4B4EBB240222
     */
    @RequestMapping(value = "/member/addressSave", method = {RequestMethod.GET, RequestMethod.POST})
    public String saveAddress(Model m, @CookieValue(value = "userTicket", required = false) String uid,
                              HttpServletRequest req, MemberAddressVO address) {
        if (uid == null || !securityService.isUserLogin(uid)) {
            m.addAttribute("result", new AjaxMessageVO("0", "很抱歉，您还没有登录"));
            return null;
        }
        uid = securityService.getLoginUserId(uid).getMembersSid();
        int addressCount = memberService.getAddressCount(uid);
        if (addressCount > CodeUtil.getMemberAddressLimit()) {
            m.addAttribute("result", new AjaxMessageVO("0", "添加地址信息成功,您最多能添加5个收货地址"));
            return null;
        }
        address.setMembersSid(uid);
        memberService.saveAddress(address);
        m.addAttribute("result", new AjaxMessageVO("1", "添加地址信息成功"));
        return null;
    }

    /**
     * 删除会员地址信息
     *
     * @roseuid 4B4EBB240222
     */
    @RequestMapping(value = "/member/addressDel", method = {RequestMethod.GET, RequestMethod.POST})
    public String delAddress(Model m, @CookieValue(value = "userTicket", required = false) String uid,
                             HttpServletRequest req, String addressSID) {
        if (uid == null || !securityService.isUserLogin(uid)) {
            m.addAttribute("result", new AjaxMessageVO("0", "很抱歉，您还没有登录"));
            return null;
        }
        uid = securityService.getLoginUserId(uid).getMembersSid();
        MemberAddressVO old = memberService.getAddress(addressSID);
        if (old == null) {
            m.addAttribute("result", new AjaxMessageVO("0", "删除地址信息失败，地址信息不存在"));
            return null;
        }
        if (!uid.equals(old.getMembersSid())) {
            m.addAttribute("result", new AjaxMessageVO("0", "删除地址信息失败"));
            return null;
        }
        memberService.delAddress(addressSID);
        m.addAttribute("result", new AjaxMessageVO("1", "删除地址信息成功"));
        return null;
    }

    /**
     * 添加评论
     */
    @RequestMapping(value = "/member/commentAdd", method = RequestMethod.POST)
    public String addComment(Model m, @CookieValue(value = "userTicket", required = false) String uid,
                             HttpServletRequest req,String productListSid,String content) {
        if (uid == null || !securityService.isUserLogin(uid)) {
            m.addAttribute("result", new AjaxMessageVO("0", "很抱歉，您还没有登录，不能发表评论"));
            return null;
        }
        MemberVO memberVO = securityService.getLoginUserId(uid);
        uid = memberVO.getMembersSid();
        ProReviewsVO review = new ProReviewsVO();
        review.setContent(content);
        review.setProductListSid(productListSid);
        if (content == null || "".equals(content)) {
            m.addAttribute("result", new AjaxMessageVO("0", "添加评论失败"));
            return null;
        }
        if (productListSid == null || "".equals(productListSid)) {
            m.addAttribute("result", new AjaxMessageVO("0", "添加评论失败"));
            return null;
        }
        review.setMembersSid(uid);
        proReviewService.saveProReviews(review);
        m.addAttribute("result", new AjaxMessageVO("1", "添加评论成功，等待审核"));
        m.addAttribute("reviewer", memberVO.getMemName());
        return null;
    }

    /**
     * 修改密码
     *
     * @return String
     * @roseuid 4B515FDD003E
     */
    @RequestMapping(value = "/member/modifyPassword", method = {RequestMethod.GET, RequestMethod.POST})
    public String modifyPassword(Model m, @CookieValue(value = "userTicket", required = false) String uid,
                                 HttpServletRequest req, MemberVO memberVO) {
        String memEmail = memberVO.getMemEmail();
        String oldPwd = memberVO.getOldPwd();
        String memPwd = memberVO.getMemPwd();
        if (uid == null || !securityService.isUserLogin(uid)) {
            m.addAttribute("result", new AjaxMessageVO("0", "很抱歉，您还没有登录"));
            return null;
        }
        uid = securityService.getLoginUserId(uid).getMembersSid();
        memberVO.setMembersSid(uid);
        MemberVO member = memberService.getMemberByEmail(memEmail);
        if (member == null) {//判断邮箱地址是否正确
            m.addAttribute("result", new AjaxMessageVO("0", "邮箱地址不存在"));
            return null;
        }
        if (!uid.equals(member.getMembersSid())) {//判断是否修改的是当前登录用户的email
            m.addAttribute("result", new AjaxMessageVO("0", "邮箱地址不正确，请输入您注册时的邮箱地址"));
            return null;
        }
        if (oldPwd == null || !Codec.encodeMd5(oldPwd).equals(member.getMemPwd())) {//判断旧密码是否正确
            m.addAttribute("result", new AjaxMessageVO("0", "旧密码输入不正确"));
            return null;
        }
        memberService.modifyPassword(memberVO);
        m.addAttribute("result", new AjaxMessageVO("1", "修改密码成功"));
        return null;
   }

}
