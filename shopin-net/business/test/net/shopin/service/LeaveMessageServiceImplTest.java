/**
 * @Probject Name: business
 * @Path: net.shopin.service.LeaveMessageServiceImplTest.java
 * @Create By jingpeng
 * @Create In 2013-10-11 下午6:40:36
 * TODO
 */
package net.shopin.service;

import net.shopin.api.ILeaveMessageService;
import net.shopin.view.LeaveMessageTypeVO;
import net.shopin.view.LeaveMessageVO;

import org.junit.Before;
import org.junit.Test;
import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.shopin.modules.web.view.PageVO;

/**
 * @Class Name LeaveMessageServiceImplTest
 * @Author jingpeng
 * @Create In 2013-10-11
 */
public class LeaveMessageServiceImplTest {
	private static AbstractApplicationContext context;
	 private ILeaveMessageService leaveMessageService;
	 
    @Before
    public void setUp() throws Exception {
       context = new ClassPathXmlApplicationContext("spring.xml");
       leaveMessageService = (ILeaveMessageService) context.getBean("leaveMessageService");
    }
    
  //  @Test
    public void testFindAll()throws Exception {
    	PageVO<LeaveMessageVO> pageVO = new PageVO<LeaveMessageVO>(6,true);
    	pageVO.setPageSize(6);
    	LeaveMessageVO leaveMessageVO = new LeaveMessageVO();
    	pageVO = leaveMessageService.findLeaveMessage(pageVO, leaveMessageVO);
    	System.out.println(pageVO.getPageSize());
   	}
    @Test
    public void test() {
    	LeaveMessageVO vo = new LeaveMessageVO();
    	vo.setMsgContent("aaaaa");
    	LeaveMessageTypeVO typeVo = new LeaveMessageTypeVO();
   
    	typeVo.setTid("6");
    	vo.setLeaveMessageType(typeVo);
    	this.leaveMessageService.saveLeaveMessage(vo);
    }
}
