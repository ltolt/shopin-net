package com.shopin.modules.security.jcaptcha;

import java.awt.image.BufferedImage;
import java.io.IOException;
import java.util.UUID;

import javax.imageio.ImageIO;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shopin.modules.utils.Codec;
import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import com.octo.captcha.service.CaptchaService;
import com.octo.captcha.service.CaptchaServiceException;

/**
 * 集成JCaptcha的Filter.
 */
public class JCaptchaFilter implements Filter {

    //web.xml中的参数名定义
    public static final String CAPTCHA_PARAMTER_NAME_PARAM = "captchaParamterName";
    public static final String CAPTCHA_SERVICE_ID_PARAM = "captchaServiceId";
    public static final String FILTER_IMAGE_URL_PARAM = "filterImageUrl";
    public static final String AUTO_PASS_VALUE_PARAM = "autoPassValue";
    public static final String FILTER_PROCESSES_METHOD = "filterProcessesMethod";

    //默认值定义
    public static final String DEFAULT_FILTER_IMAGE_URL = "/jcaptcha.jpg";
    public static final String DEFAULT_CAPTCHA_SERVICE_ID = "captchaService";
    public static final String DEFAULT_CAPTCHA_PARAMTER_NAME = "j_captcha";

    private static Logger logger = LoggerFactory.getLogger(JCaptchaFilter.class);

    private String failureUrl;
    private String filterImageUrl = DEFAULT_FILTER_IMAGE_URL;
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

        if (StringUtils.isNotBlank(fConfig.getInitParameter(FILTER_IMAGE_URL_PARAM))) {
            filterImageUrl = fConfig.getInitParameter(FILTER_IMAGE_URL_PARAM);
        }

        if (StringUtils.isNotBlank(fConfig.getInitParameter(CAPTCHA_SERVICE_ID_PARAM))) {
            captchaServiceId = fConfig.getInitParameter(CAPTCHA_SERVICE_ID_PARAM);
        }

        if (StringUtils.isNotBlank(fConfig.getInitParameter(CAPTCHA_PARAMTER_NAME_PARAM))) {
            captchaParamterName = fConfig.getInitParameter(CAPTCHA_PARAMTER_NAME_PARAM);
        }

        if (StringUtils.isNotBlank(fConfig.getInitParameter(AUTO_PASS_VALUE_PARAM))) {
            autoPassValue = fConfig.getInitParameter(AUTO_PASS_VALUE_PARAM);
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
        if (StringUtils.startsWith(servletPath, filterImageUrl)) {
            genernateCaptchaImage(request, response);
        } else {
            chain.doFilter(request, response);
        }
    }

    /**
     * 生成验证码图片.
     */
    private void genernateCaptchaImage(final HttpServletRequest request, final HttpServletResponse response)
            throws IOException {
        response.setHeader("Cache-Control", "no-store");
        response.setHeader("Pragma", "no-cache");
        response.setDateHeader("Expires", 0);
        response.setContentType("image/jpeg");
        String captchaId = Codec.encodeMd5(UUID.randomUUID().toString());
        Cookie cookie = new Cookie("captchaId", captchaId);
        cookie.setPath("/");
        response.addCookie(cookie);
        ServletOutputStream out = response.getOutputStream();
        try {
            BufferedImage challenge = (BufferedImage) captchaService.getChallengeForID(captchaId, request.getLocale());
            ImageIO.write(challenge, "jpg", out);
            out.flush();
        } catch (CaptchaServiceException e) {
            logger.error(e.getMessage(), e);
        } finally {
            out.close();
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
