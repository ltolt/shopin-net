package net.shopin.web.controller;

import com.shopin.modules.template.freemarker.FreeMarkerTemplateUtils;
import freemarker.template.TemplateException;
import net.shopin.web.view.DemoVO;
import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.view.freemarker.FreeMarkerConfigurer;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import java.io.IOException;
import java.util.List;

/**
 * Channel Controller.
 * User: Suhaibo
 * Date: 2010-1-9
 * post,get的demo
 */
@Controller
public class DemoController {
    @RequestMapping(value = "/demo/control/loginForm", method = RequestMethod.GET)
    public String form(Model m) {
        return  "demo/loginForm";
    }

    @RequestMapping(value = "/demo/control/{username}/{password}", method = RequestMethod.GET)
    public String login(@PathVariable("username") String param1,@PathVariable("password") String param2,Model m) {
        m.addAttribute("username",param1);
        m.addAttribute("password",param2);
        if("aa".equals(param1)&&"aa".equals(param2)){
            m.addAttribute("flag",true);
        }else{
            m.addAttribute("flag",false);
        }
        return "demo/loginGetResult";
    }

    @RequestMapping(value = "/demo/control/loginPost", method = RequestMethod.POST)
    public String login(Model m,@ModelAttribute DemoVO member) {
        m.addAttribute("member",member);
        if("aa".equals(member.getUsername())&&"aa".equals(member.getPassword())){
            m.addAttribute("flag",true);
        }else{
            m.addAttribute("flag",false);
        }
        return "demo/loginPostResult";
    }

    @RequestMapping(value = "/demo/control/loginAjax", method = RequestMethod.POST)
    public String loginJax(Model m,@ModelAttribute DemoVO member) {
        m.addAttribute("member",member);
        if("aa".equals(member.getUsername())&&"aa".equals(member.getPassword())){
            m.addAttribute("msg","成功");
        }else{
            m.addAttribute("msg","失败");
        }
        return "demo/loginForm";
    }

   @RequestMapping(value = "/demo/control/loginValidate", method = RequestMethod.POST)
    public String postValidate( Model m, @Valid DemoVO member,BindingResult results) {
       m.addAttribute("member", member);
       if(doValidate(m,results)){
            return "demo/loginForm";
       }
       return  "demo/loginForm";
    }

    public boolean doValidate(Model m,BindingResult results){
       if(m==null||results==null){
           return true;
       }
       if(!results.hasErrors()){
           return true;
       }
       List<FieldError> list = results.getFieldErrors();
       for (int i = 0; i < list.size(); i++) {
            FieldError fieldError = list.get(i);
            m.addAttribute(fieldError.getField()+"_error",fieldError.getDefaultMessage());
       }
       return false;
    }

}

