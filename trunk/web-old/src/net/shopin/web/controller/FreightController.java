package net.shopin.web.controller;

import net.shopin.api.IFreightService;
import net.shopin.view.DistrictVO;
import net.shopin.view.ExpressTypeVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.ArrayList;
import java.util.List;

/**
 * 选择省市区的控制器
 * Description:FavorController.
 * User: Su Haibo
 * Date: 2010-1-22
 * To change this template use File | Settings | File Templates.
 */
@Controller
public class FreightController {
   @Autowired
   private IFreightService freightService;

   /**
    * 选择省份
    * @roseuid 4B515CFC01A5
    */
   @RequestMapping(value = "/district/selectprovince", method = {RequestMethod.GET,RequestMethod.POST})
   public String selectProvince(Model m,String provinceSID)
   {
     List<DistrictVO> list=freightService.getCities(provinceSID);
     m.addAttribute("citylist",list);
     return null;
   }

   /**
    * 选择地市
    * @roseuid 4B515CFC01A5
    */
   @RequestMapping(value = "/district/selectcity", method = {RequestMethod.GET,RequestMethod.POST})
   public String selectCity(Model m,String citySID)
   {
     List<ExpressTypeVO> expressTypes=freightService.getExpressTypeByCity(
                new Integer(citySID));
     List<String> typeids=new ArrayList<String>();
     for(ExpressTypeVO type:expressTypes){
       typeids.add(type.getSid());
     }
     boolean existCollect=false;//是否存在货到付款的方式
     for(ExpressTypeVO type:expressTypes){
           typeids.add(type.getSid());
           if("货到付款".equals(type.getExpressName())){
                   existCollect=true;
           }
     }
     m.addAttribute("typeids",typeids);
     m.addAttribute("existcollect",existCollect?"1":"0");
     return null;
   }

    

    
}
