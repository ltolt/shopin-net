package com.shopin.modules.template.freemarker;

import freemarker.template.Template;
import freemarker.template.TemplateException;
import org.springframework.web.servlet.view.freemarker.FreeMarkerConfigurer;

import java.io.IOException;
import java.io.StringWriter;

/**
 * Created by IntelliJ IDEA.
 * User: yanwt
 * Date: 2009-12-16
 * Time: 13:30:09
 */
public class FreeMarkerTemplateUtils {
    /**
     * @param configurer    模板配置
     * @param templateName  模板名
     * @param model         map
     * @return
     * @throws IOException
     * @throws TemplateException
     */
    public static String processTemplateIntoString(FreeMarkerConfigurer configurer, String templateName, Object model)
            throws IOException, TemplateException {
        Template template = configurer.getConfiguration().getTemplate(templateName);
        StringWriter result = new StringWriter();
        template.process(model, result);
        return result.getBuffer().toString();
    }
}
