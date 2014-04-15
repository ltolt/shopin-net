package com.shopin.modules.web.view;

import java.util.List;
import java.util.Map;
import java.util.ArrayList;
import java.util.HashMap;
import java.io.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.ServletOutputStream;

import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.springframework.web.servlet.view.document.AbstractExcelView;
import org.springframework.web.servlet.view.AbstractView;
import org.springframework.util.ResourceUtils;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.Resource;
import net.sf.jxls.transformer.XLSTransformer;


/**
 * 数据导出到Excel中
 * <p/>
 * Created by IntelliJ IDEA.
 * User: yanwt
 * Date: 2009-8-25
 * Time: 15:45:19
 */
public class ExcelView extends AbstractView {
    public ExcelView() {
        super();
        setContentType("application/vnd.ms-excel");
    }

    @Override
    protected final void renderMergedOutputModel(
            Map<String, Object> model, HttpServletRequest request, HttpServletResponse response) throws Exception {
        Resource resource = new ClassPathResource((String) model.get("Template"));
        HSSFWorkbook book = new XLSTransformer().transformXLS(resource.getInputStream(), model);
        response.setContentType(getContentType());
        ServletOutputStream out = response.getOutputStream();
        book.write(out);
        out.flush();
    }

}
