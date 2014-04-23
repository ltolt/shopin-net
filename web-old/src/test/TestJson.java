package test;

import net.shopin.web.view.DemoVO;
import org.codehaus.jackson.map.ObjectMapper;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by IntelliJ IDEA.
 * User: yanwt
 * Date: 2010-10-25
 * Time: 17:41:00
 */
public class TestJson {
    public static void main(String[] args) {
       ObjectMapper objectMapper = new ObjectMapper();
        Map map = new HashMap();
        List list = new ArrayList();
        for (int i = 0; i < 5; i++) {
           DemoVO vo = new DemoVO();
            vo.setUsername("user"+i);
            vo.setPassword("password"+i);
            list.add(vo);
        }
        map.put("result",list);
        try {

           String s =  objectMapper.writeValueAsString(map);
           System.out.println(""+objectMapper.writeValueAsString(s));
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
