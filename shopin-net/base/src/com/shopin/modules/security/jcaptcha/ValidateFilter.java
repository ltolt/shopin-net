package com.shopin.modules.security.jcaptcha;

import com.octo.captcha.service.CaptchaService;
import com.octo.captcha.service.CaptchaServiceException;
import com.shopin.modules.utils.Codec;
import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import javax.imageio.ImageIO;
import javax.servlet.*;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.util.UUID;

/**
 * Created by IntelliJ IDEA.
 * User: yanwt
 * Date: 2010-1-26
 * Time: 13:37:38
 */
public class ValidateFilter implements Filter {

    //web.xml中的参数名定义
    public static final String CAPTCHA_PARAMTER_NAME_PARAM = "captchaParamterName";
    public static final String CAPTCHA_SERVICE_ID_PARAM = "captchaServiceId";
    public static final String FILTER_PROCESSES_METHOD = "filterProcessesMethod";

    //默认值定义
    public static final String DEFAULT_CAPTCHA_SERVICE_ID = "captchaService";
    public static final String DEFAULT_CAPTCHA_PARAMTER_NAME = "j_captcha";
    public static final String DEFAULT_FILTER_PROCESSES_METHOD = "ALL";

    private static Logger logger = LoggerFactory.getLogger(JCaptchaFilter.class);

    private String failureUrl;
    private String filterProcessesMethod = DEFAULT_FILTER_PROCESSES_METHOD;
    private String captchaServiceId = DEFAULT_CAPTCHA_SERVICE_ID;
    private String captchaParamterName = DEFAULT_CAPTCHA_PARAMTER_NAME;
    private String autoPassValue;

    private CaptchaService captchaService;

    public void init(final FilterConfig fConfig) throws ServletException {
        initParameters(fConfig);
        initCaptchaService(fConfig);
    }

    /**
     * 初始化web.xml中定义的filter init-param.
     */
    private void initParameters(final FilterConfig fConfig) {
        if (StringUtils.isNotBlank(fConfig.getInitParameter(FILTER_PROCESSES_METHOD))) {
            filterProcessesMethod = fConfig.getInitParameter(FILTER_PROCESSES_METHOD);
        }

        if (StringUtils.isNotBlank(fConfig.getInitParameter(CAPTCHA_SERVICE_ID_PARAM))) {
            captchaServiceId = fConfig.getInitParameter(CAPTCHA_SERVICE_ID_PARAM);
        }

        if (StringUtils.isNotBlank(fConfig.getInitParameter(CAPTCHA_PARAMTER_NAME_PARAM))) {
            captchaParamterName = fConfig.getInitParameter(CAPTCHA_PARAMTER_NAME_PARAM);
        }
    }

    /**
     * 从ApplicatonContext获取CaptchaService实例.
     */
    private void initCaptchaService(final FilterConfig fConfig) {
        ApplicationContext context = WebApplicationContextUtils.getWebApplicationContext(fConfig.getServletContext());
        captchaService = (CaptchaService) context.getBean(captchaServiceId);
    }

    public void destroy() {
    }

    public void doFilter(final ServletRequest theRequest, final ServletResponse theResponse, final FilterChain chain)
            throws IOException, ServletException {
        HttpServletRequest request = (HttpServletRequest) theRequest;
        HttpServletResponse response = (HttpServletResponse) theResponse;
        String servletPath = request.getServletPath();
        String method = request.getMethod().toUpperCase();
        //符合filterProcessesUrl为验证处理请求,其余为生成验证图片请求.
        if ((method.equals(filterProcessesMethod) || "ALL".equals(filterProcessesMethod))) {
            boolean validated = validateCaptchaChallenge(request);
            if (validated) {
                chain.doFilter(request, response);
            } else {
                redirectFailureUrl(request, response);
            }
        } else {
            chain.doFilter(request, response);
        }
    }

    /**
     * 验证验证码.
     */
    private boolean validateCaptchaChallenge(final HttpServletRequest request) {
        try {
            String captchaID = "";
            Cookie[] cookies = request.getCookies();
            if (cookies != null && cookies.length > 0) {
                for (int i = 0; i < cookies.length; i++) {
                    Cookie sCookie = cookies[i];
                    if (sCookie.getName().equals("captchaId")) {
                        captchaID = sCookie.getValue();
                        break;
                    }
                }
            }
            String challengeResponse = request.getParameter(captchaParamterName);

            //自动通过值存在时,检验输入值是否等于自动通过值
            if (autoPassValue != null && autoPassValue.equals(challengeResponse))
                return true;
            return captchaService.validateResponseForID(captchaID, challengeResponse);
        } catch (CaptchaServiceException e) {
            logger.error(e.getMessage(), e);
            return false;
        }
    }

    /**
     * 跳转到失败页面.
     * <p/>
     * 可在子类进行扩展，比如在session中放入SpringSecurity的Exception.
     */
    protected void redirectFailureUrl(final HttpServletRequest request, final HttpServletResponse response)
            throws IOException {
        request.setAttribute("error", "验证码错误！");
        response.sendRedirect(request.getHeader("Referer"));
    }
}
