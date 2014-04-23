package net.shopin.web.controller;

import net.shopin.api.ICategoryService;
import net.shopin.api.IProductService;
import net.shopin.view.ProductCateVO;
import net.shopin.view.ProductQueryVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.List;

/**
 * Description:Category Controller(品类控制类)
 * User: Peter Wei
 * Date: 2010-1-22
 * Version:1.0
 */
@Controller
public class CategoryController {

    @Autowired
    private IProductService productService;
    //品类查询

    @RequestMapping(value = "/channel/categorylist", method = RequestMethod.GET)
    public String queryCategory(Model m) {
        m.addAttribute("catelists", productService.findCurrentCateList(new ProductQueryVO()));
        return "channel/categorylist";
    }
}
