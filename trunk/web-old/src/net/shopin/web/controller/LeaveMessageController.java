package net.shopin.web.controller;

import com.enterprisedt.net.ftp.FTPException;
import com.enterprisedt.net.ftp.FileTransferClient;
import com.shopin.modules.security.interceptor.MethodSecurity;
import com.shopin.modules.security.interceptor.ObjectSecurity;
import com.shopin.modules.utils.PageHelper;
import com.shopin.modules.web.view.PageVO;
import net.shopin.api.ILeaveMessageService;
import net.shopin.api.IMemberService;
import net.shopin.api.IOrderService;
import net.shopin.api.ISecurityService;
import net.shopin.view.*;
import net.shopin.web.util.CodeUtil;
import net.shopin.web.util.FTPUtil;
import net.shopin.web.util.FtpServerConf;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.Assert;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.ws.rs.core.Request;
import java.io.IOException;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

/**
 * @Company:www.shopin.net User: minxr
 * Date: 11-4-14
 * Time: 下午6:02
 * description:安全验证采用方法级别的，如果采用Object级别的会执行两次请求
 */
@Controller
public class LeaveMessageController {
    @Autowired
    private ILeaveMessageService leaveMessageService;
     @Autowired
   private ISecurityService securityService;

     @Autowired
   private IOrderService orderService;
     @Autowired
   private IMemberService memberService;

     @RequestMapping("/refund/readrule")
     @MethodSecurity
    public String readRefundRule(Model m,HttpServletRequest req){
        String typeId = trim(req.getParameter("typeId"));
        if(typeId.equals("")){
           return "redirect:/msg/common/1.html";
        }
        m.addAttribute("typeId",typeId);
       return "selfservice/refundrule";
    }


    @RequestMapping("/msg/next")
    public String next(){
        return "selfservice/orderinput";
    }


     //退货单明细
    @RequestMapping(value = "/refund/apply/{orderNo}", method = RequestMethod.GET)
    @MethodSecurity
    public String refundApply(Model m,@PathVariable("orderNo") String orderNo,
               @CookieValue(value="userTicket",required=false) String uid,HttpServletRequest req) {
            if(uid==null||"".equals(uid.trim())){
               return "redirect:/msg/common/1.html";
            }

            uid=securityService.getLoginUserId(uid).getMembersSid();
            String typeId = req.getParameter("typeId");
             if(typeId==null || typeId.equals("")){ //流程不正确，直接跳转到公共留言页面
                    return "redirect:/msg/common/1.html";
            }


        OrderVO order=orderService.getOrderByNO(orderNo);
         LeaveMessageTypeVO vo = leaveMessageService.getLeaveMessageTypeById(typeId);
        int refundCount=0;
         for(int i=0;i<order.getOrderDetails().size();i++){
             OrderDetailVO odv = order.getOrderDetails().get(i);
             if((Integer.parseInt(odv.getSaleSum())-Integer.parseInt(odv.getRefundNum()))>0){
                    refundCount++;
             }
         }
        //如果已经退过了，则没有可以退货的商品
         if(refundCount<1){
             m.addAttribute("error","订单["+orderNo+"]没有可退货商品！");
            return "selfservice/orderidInput";
         }
         m.addAttribute("vo",vo);

        if(order.getOrderNo() == null || !order.getOrderNo().equals(orderNo)){
             m.addAttribute("error","订单不存在！");
            return "selfservice/orderidInput";
        }

        if(!(order.getMembersSid()).equals(uid)){  //对订单的权限进行了控制
              m.addAttribute("error","您无权操作此订单!");
            return "selfservice/orderidInput";
        }
        //订单状态值小于2的则订单是无效订单
        Integer statu = Integer.parseInt(order.getOrderStatus());
        if(statu<2){
             m.addAttribute("error","订单已经失效！");
            return "selfservice/orderidInput";
        }

         String email =  memberService.getMemberBySid(order.getMembersSid()).getMemEmail();
        //退货原因
        List<RefundresonVO> reasons = leaveMessageService.getAllRefundresonVOs();
        m.addAttribute("orderNo",orderNo);
        m.addAttribute("reasons",reasons);
        m.addAttribute("order",order);
        m.addAttribute("email",email);
        m.addAttribute("typeId", typeId);
        return "selfservice/OrderDetail";
    }



    @RequestMapping("/msg/{pid}")
    @MethodSecurity
    public String leaveMessagePage(@CookieValue(value="userTicket",required=false) String uid,@PathVariable("pid")String pid,Model m ,HttpServletRequest request,HttpServletResponse response){
        LeaveMessageTypeVO parent =   null;
        List<LeaveMessageTypeVO>  subs = leaveMessageService.getSubMessageTypeByParentId(pid);
        if(subs.size()>0){
           parent = subs.get(0).getParentType();
        }else{

          //  return "redirect:/msg/common/1.html";
            parent=leaveMessageService.getLeaveMessageTypeById(pid);
            subs.add(parent);
        }
        //不存在的留言类型
        if(parent==null||parent.getTid()==null||"".equals(parent.getTid())){
            return "redirect:/msg/common/1.html";
        }

        if(uid!=null && !"".equals(uid)){
        String email = securityService.getLoginUserId(uid).getMemEmail();
            m.addAttribute("email",email);
        }
        m.addAttribute("subs",subs);
        m.addAttribute("parent",parent);

        return "selfservice/leavemsg";
    }

    @RequestMapping(value = "/leavemsg/commit")
    public String leaveMessageCommit(Model m , HttpServletRequest req){
        /**
         * 添加相应的业务逻辑
         * 1、登陆判断。
         * 2、有效性检查
         */
//        uid=securityService.getLoginUserId(uid).getMembersSid();
//        System.out.println("====hello====");
        LeaveMessageVO leaveMessageVO = this.prepareData(req);
       leaveMessageService.addLeaveMessage(leaveMessageVO);
        return "redirect:/commit/ok.html"; //提交成功进行重定向，防止重复提交
    }

    private LeaveMessageVO prepareData(HttpServletRequest req){
        LeaveMessageVO leaveMessageVO = new LeaveMessageVO();

        String msgType = trim(req.getParameter("leaveMessageType"));
        LeaveMessageTypeVO type = leaveMessageService.getLeaveMessageTypeById(msgType);
        if(type==null){
            throw new IllegalArgumentException("没有找到id为："+ msgType+" 的留言类型！");
        }
        leaveMessageVO.setLeaveMessageType(type);

        String orderId = trim(req.getParameter("orderId"));
        if(type.getOrderNoNeed().equals("1")){
            Assert.hasText(orderId,type.getCatename()+"的订单号是必须项，不能为空！");
        }
        leaveMessageVO.setOrderId(orderId);
        //留言用户的用户名
        String userName = trim(req.getParameter("userName"));
       // Assert.hasText(userName,"用户名不能为空！");
        leaveMessageVO.setUserName(userName);
        //用户邮箱不能为空
        String email = trim(req.getParameter("userEmail"));
        //Assert.hasText(email,"用户邮箱不能为空");
        leaveMessageVO.setUserEmail(email);
        //联系电话
        String tel = trim(req.getParameter("tel"));
        Assert.hasText(tel,"电话号码不能为空！");
        leaveMessageVO.setTel(tel);

        String province = trim(req.getParameter("userProvince"));
        Assert.hasLength(province,"请选择您所在的省市");
        leaveMessageVO.setUserProvince(province);

        String needReplay = trim(req.getParameter("needreplay"));
        Assert.hasLength(needReplay,"是否需要回复未选择");
        leaveMessageVO.setNeedReplay(needReplay);

        String msgContent = trim(req.getParameter("msgContent"));
        Assert.hasText(msgContent,"留言内容为空！请填写！");
        if(msgContent.length()>500){
            throw new IllegalArgumentException("留言内容不能超过500个字符！");
        }
        leaveMessageVO.setMsgContent(msgContent);

        return leaveMessageVO;

    }



    private String trim(String str){
        if(str == null){
            return "";
        }else{
            return str.trim();
        }
    }

    @RequestMapping("/refund/orderinput")
    @MethodSecurity
    public String refundDetail(Model m,HttpServletRequest req){
        String typeId = trim(req.getParameter("typeId"));
        if(typeId==null||typeId.equals("")){
             return "redirect:/msg/common/1.html";
        }
        LeaveMessageTypeVO vo = leaveMessageService.getLeaveMessageTypeById(typeId);
        m.addAttribute("vo",vo);
        return "selfservice/orderidInput";
    }

    @RequestMapping(value="/refundapply/commit",method = RequestMethod.POST)
    public String commitRefund(Model m,HttpServletRequest req,HttpServletResponse response,@CookieValue(value="userTicket",required=false) String uid){
        String typeId =trim(req.getParameter("typeId"));
        if(typeId.equals("")){
            return "redirect:/msg/common/1.html";
        }

        String orderId =trim(req.getParameter("orderId"));
        OrderVO orderVO =  orderService.getOrderByNO(orderId);
        List<RefundapplyinfoVO> refundapplyinfoVOList = new ArrayList<RefundapplyinfoVO>();
        if(orderVO!=null){
            for(OrderDetailVO orderDetail:orderVO.getOrderDetails()){
//                String pre = orderDetail.getProSku();
                String pre = orderDetail.getProSid();
                String parmName=pre+"_needRefund";
                String needRefund = trim(req.getParameter(parmName));
                //说明在退货商品里面
                if(needRefund.equals(pre)){
                    System.out.println(orderDetail.getProName()+"在退货商品里面");
                    RefundapplyinfoVO vo = new RefundapplyinfoVO();
                    vo.setOrderid(orderId);
                    vo.setPrice(orderDetail.getSalePrice());
                    vo.setProductName(orderDetail.getProName());
                    vo.setProNo(orderDetail.getProSku()); //商品编号
                     String rsid = trim(req.getParameter(pre+"_refundReson"));
                    String  picurls = trim(req.getParameter(pre+"_picurls"));
                    RefundresonVO refundresonVO = leaveMessageService.getRefundresonVoById(rsid);
                    if(rsid.equals("-1")||refundresonVO == null){
//                        throw new IllegalArgumentException("退货原因选择不正确");
                        m.addAttribute("picurls",req.getParameter("picurls"));
                        m.addAttribute("msgContent",trim(req.getParameter("msgContent")));
                        m.addAttribute("error","退货原因选择不正确");
                        return "redirect:/refund/apply/"+orderId+".html?typeId="+typeId ;
                    }

                    vo.setDescription(trim(req.getParameter(pre+"_description")));

                    if(refundresonVO.getImgrequire().equals("1")){
                        if(picurls.equals("")){
                            m.addAttribute("error","没有上传图片");
                            return "redirect:/refund/apply/"+orderId+".html?typeId="+typeId ;
                        }
                    }
                    vo.setPicurls(picurls);

                    int returnProcount = Integer.parseInt(trim(req.getParameter(pre+"_refund_qty")));
                    int buyCont = Integer.parseInt(orderDetail.getSaleSum());
                    int refundCount = Integer.parseInt(orderDetail.getRefundNum());
                    if(returnProcount>0 && returnProcount<=(buyCont-refundCount)){
                        vo.setProCount(returnProcount+"");//退货数量
                    } else{
                        m.addAttribute("picurls",req.getParameter("picurls"));
                        m.addAttribute("error","商品【"+orderDetail.getProName()+"】退货数量不正确！退货数量应该小于"+(buyCont-refundCount));
                       //  req.setAttribute("typeId",typeId);
                        //req.setAttribute("error","商品【"+orderDetail.getProName()+"】退货数量不正确！退货数量应该小于"+(buyCont-refundCount));
                        //return this.refundApply(m,orderId,uid,req);
                         return "redirect:/refund/apply/"+orderId+".html?typeId="+typeId ;

                       // throw new IllegalArgumentException("商品【"+orderDetail.getProName()+"】退货数量不正确！退货数量应该小于"+(buyCont-refundCount));
                    }

                    RefundresonVO reson = leaveMessageService.getRefundresonVoById(rsid);
                    vo.setRefundreson(reson);

                    refundapplyinfoVOList.add(vo);

                }
            }
        }else{
             return "redirect:/myshopin/orders.html";
        }

        LeaveMessageVO leaveMessageVO = new LeaveMessageVO();
        leaveMessageVO.setLeaveMessageType(leaveMessageService.getLeaveMessageTypeById(typeId));
         String msgContent = trim(req.getParameter("msgContent"));
        if(msgContent.length()>200){
            throw new IllegalArgumentException("留言内容超过了限制");
        }
        leaveMessageVO.setMsgContent(msgContent);
        leaveMessageVO.setNeedReplay(trim(req.getParameter("isNeedReplay")));
        leaveMessageVO.setUserEmail(req.getParameter("userEmail"));
        leaveMessageVO.setUserName(req.getParameter("userName"));
        leaveMessageVO.setTel(req.getParameter("tel"));
        leaveMessageVO.setUserProvince(req.getParameter("userProvince"));
        leaveMessageVO.setOrderId(orderVO.getOrderNo());

        leaveMessageService.addRefundMessage(leaveMessageVO,refundapplyinfoVOList);
        return "selfservice/ok"; //提交成功进行重定向，防止重复提交

    }

    @RequestMapping("/myshopin/myleavemsg/{pageNo}.html")
    @MethodSecurity
    public String myLeaveMessage(@PathVariable("pageNo")String pageNo,@CookieValue(value="userTicket",required=false) String uid,Model m,HttpServletRequest req) throws ParseException {
        String email = securityService.getLoginUserId(uid).getMemEmail();
        PageVO<LeaveMessageVO> pageVO = new PageVO<LeaveMessageVO>();
        pageVO.setPageSize(5);
         int pn = Integer.parseInt(pageNo);
        pageVO.setPageNo(pn);
        LeaveMessageVO messageVO = new LeaveMessageVO();
        if(email!=null && !email.equals("")){
            messageVO.setUserEmail(email);
        }
         messageVO.setOrderKey("desc");
        pageVO = leaveMessageService.findLeaveMessage(pageVO,messageVO);
        m.addAttribute("pageVO",pageVO);

        PageHelper pageHelper = new PageHelper(req, "page.ftl", "/myshopin/myleavemsg");
        m.addAttribute("page", pageHelper.getPageBreakStr(pageVO));
         //留言类型
        List<LeaveMessageTypeVO> messageTypes = leaveMessageService.getAllFirstLevelCate();
        m.addAttribute("messageTypes",messageTypes);
        leaveMessageService.findLeaveMessage(pageVO,messageVO);

        return "myshopin/myleavemsg";
    }


}

