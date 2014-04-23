package net.shopin.web.controller;

import com.enterprisedt.net.ftp.FileTransferClient;
import com.shopin.modules.utils.PageHelper;
import com.shopin.modules.web.view.PageVO;
import net.shopin.api.ILeaveMessageService;
import net.shopin.api.IMemberService;
import net.shopin.api.IOrderService;
import net.shopin.api.ISecurityService;
import net.shopin.view.AjaxMessageVO;
import net.shopin.view.LeaveMessageTypeVO;
import net.shopin.view.LeaveMessageVO;
import net.shopin.view.OrderVO;
import net.shopin.web.util.FTPUtil;
import net.shopin.web.util.FtpServerConf;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.text.ParseException;
import java.util.Iterator;
import java.util.List;

/**
 * @Company:www.shopin.net User: minxr
 * Date: 11-4-18
 * Time: 下午3:25
 */
@Controller
public class PublicHelpCenter {
     @Autowired
    private ILeaveMessageService leaveMessageService;

    @Autowired
    FtpServerConf ftpServer;

    @Autowired
   private IOrderService orderService;
      @Autowired
   private ISecurityService securityService;

   @Autowired
   private IMemberService memberService;

    // 限制文件的上传大小
    private int maxPostSize = 1024 * 1024;

    @RequestMapping("/msg/common/{pageNo}.html")
    public String viewCommonLeaveMessagePage(@PathVariable("pageNo")String pageNo,Model m ,HttpServletRequest request,HttpServletResponse response) throws ParseException {
        PageVO<LeaveMessageVO> pageVO = new PageVO<LeaveMessageVO>();
        String pageSize = request.getParameter("pageSize");
        int pageSizeInt = 6;
        if(null!=pageSize && !"".equals(pageSize)){
            try{
               pageSizeInt = Integer.parseInt(pageSize);
            }catch (Exception e){
                System.out.println("PublicHelpCenter--》页面参数错误！"+e.getMessage());
            }
        }

        pageVO.setPageSize(pageSizeInt);
        int pn = Integer.parseInt(pageNo);
        pageVO.setPageNo(pn);
        LeaveMessageVO messageVO = new LeaveMessageVO();
        messageVO.setCommonVisible("1");
        String keyword = request.getParameter("keyword");
//        keyword = URLDecoder.decode(keyword,"utf-8");
        if(null!=keyword&&!"".equals(keyword.trim())){
            messageVO.setMsgContent(keyword.trim());
            messageVO.setReplayContent(keyword.trim());
        }
        messageVO.setOrderKey("desc");
        pageVO = leaveMessageService.findLeaveMessage(pageVO,messageVO);
        m.addAttribute("pageVO",pageVO);
        PageHelper pageHelper = new PageHelper(request, "page.ftl", "/msg/common");
        m.addAttribute("page", pageHelper.getPageBreakStr(pageVO));

        //留言类型
        List<LeaveMessageTypeVO> messageTypes = leaveMessageService.getAllFirstLevelCate();
        m.addAttribute("messageTypes",messageTypes);
        m.addAttribute("keyword",keyword);
        return "selfservice/public";
    }


    @RequestMapping("/commit/ok")
    public String commitOK(){
      return "selfservice/ok";
    }


    @RequestMapping(value = "/photoUpload/{fileDic}.html", method = {RequestMethod.GET, RequestMethod.POST})
    public void register(Model m,  @PathVariable("fileDic") String fileDic, HttpServletRequest request,HttpServletResponse response) {
        DiskFileItemFactory factory = new DiskFileItemFactory();
       factory.setSizeThreshold(4096);
       response.setContentType("text/plain");
        response.setCharacterEncoding("utf-8");
        PrintWriter writer =null;
        try {
             writer= response.getWriter();
        } catch (IOException e) {
           writer.write("error");
        }
       ServletFileUpload upload = new ServletFileUpload(factory);
       upload.setSizeMax(maxPostSize);
       OutputStream out = null;
       String fileName="";
       try {
          List fileItems = upload.parseRequest(request);
            Iterator iter = fileItems.iterator();
            while (iter.hasNext()) {
                FileItem item = (FileItem) iter.next();
                if (!item.isFormField()) {
                String temp = item.getName();
                if(temp!=null&&!temp.trim().equals("")){
                    int index = temp.lastIndexOf(".");
                    if(index>0){
                     fileName=System.currentTimeMillis()+temp.substring(index);
                    }else{
                        fileName=temp;
                    }
                }
//                String fileDic = "promotions";
                  // 保存图片到FTP
                FTPUtil.saveToFTP(out, fileDic, fileName, item, ftpServer.getHost(), ftpServer.getUsername(), ftpServer.getPassword());
                }
            }
        } catch (FileUploadException e) {
          writer.write("error");
        }
        writer.write(fileName);

    }

    @RequestMapping(value="/validate/orderNo", method = {RequestMethod.GET,RequestMethod.POST})
    public String  getOrderByOrderNo(@CookieValue(value="userTicket",required=false) String uid,HttpServletRequest request,Model m) {
       if(uid==null ||uid.equals("")){
           m.addAttribute("message",new AjaxMessageVO("0","登录信息丢失，请重新登录！"));
       }else{
             String orderId = request.getParameter("orderId");
            if(orderId==null||orderId.trim().equals("")){
                m.addAttribute("message",new AjaxMessageVO("0","订单编号为空！"));
                 return null;
            }else{
            /*    try{
               Integer.parseInt(orderId);
           }catch (Exception e){
                m.addAttribute("message",new AjaxMessageVO("0","订单编号不正确！"));
               return null;
           }*/
                 OrderVO orderVO =  orderService.getOrderByNO(orderId);

                if(orderVO==null||orderVO.getOrderId()==null||!orderVO.getOrderNo().equals(orderId)){
                    m.addAttribute("message",new AjaxMessageVO("0","订单编号为"+orderId+"的订单不存在！"));
                     return null;
                }else{
                     String email =  memberService.getMemberBySid(orderVO.getMembersSid()).getMemEmail();
                        if(uid!=null&&!uid.equals("")){
                            if(!email.equals(securityService.getLoginUserId(uid).getMemEmail())){
                               m.addAttribute("message",new AjaxMessageVO("0","您无权对此订单操作，如有疑问请联系客服！"));
                               return null;
                            }
                }
                    m.addAttribute("order",orderVO);
                    m.addAttribute("email",email);
                     return null;
                }
            }
       }
        return null;
    }

    @RequestMapping("/myleavemsg/getLeaveMessageVOById")
    public String getLeaveMessageVOById(HttpServletRequest request,Model m){
         String msgId = request.getParameter("msgId");
         if(msgId!=null && !msgId.trim().equals("")){
             LeaveMessageVO msgVO = leaveMessageService.getLeaveMessageById(msgId);
             if(msgVO!=null && msgVO.getMsgId()!=null && msgVO.getMsgId().equals(msgId)){
                 m.addAttribute("msg",msgVO);
             }
         }
        return "myshopin/leavemsgDetail";
    }
}
