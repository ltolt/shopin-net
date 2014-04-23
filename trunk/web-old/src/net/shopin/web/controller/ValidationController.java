package net.shopin.web.controller;

import com.shopin.modules.security.interceptor.MethodSecurity;
import net.shopin.web.vo.ValidationVO;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import java.util.List;

/**
 * Created by IntelliJ IDEA.
 * User: yanwt
 * Date: 2010-1-11
 * Time: 20:44:38
 */
@Controller
public class ValidationController {
    @RequestMapping(value = "/validation111", method = RequestMethod.GET)
    public String getValidate(Model m) {
        return "test/validation";
    }

    /**
     * 
     * @param m
     * @param validationVO
     * @param results
     * @return
     *
     * 注意BindingResult参数必须在@Valid之后，且要紧接着@Valid参数
     */
    @RequestMapping(value = "/validation", method = RequestMethod.POST)
    @MethodSecurity
    public String postValidate(HttpServletRequest request, Model m, @Valid ValidationVO validationVO,BindingResult results) {
        if (results.hasErrors()) {
            List<FieldError> list = results.getFieldErrors();
            for (int i = 0; i < list.size(); i++) {
                FieldError fieldError = list.get(i);
                m.addAttribute(fieldError.getField()+"error",fieldError.getDefaultMessage());
            }
            System.out.println("error" + validationVO);
        }else{
            System.out.println("right" + validationVO);
        }
        m.addAttribute("validation", validationVO);
        return "test/validation";
    }
}
