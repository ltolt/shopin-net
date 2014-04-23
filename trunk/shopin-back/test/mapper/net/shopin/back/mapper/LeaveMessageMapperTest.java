/**
 * @Probject Name: shopin-back-demo
 * @Path: net.shopin.back.mapperLeaveMessageMapperTest.java
 * @Create By jingpeng
 * @Create In 2013-8-15 上午9:15:30
 * TODO
 */
package net.shopin.back.mapper;

import java.util.Date;

import net.shopin.wms.domain.entity.LeaveMessage;
import net.shopin.wms.domain.entity.LeaveMessageType;
import net.shopin.wms.domain.view.LeaveMessageVO;
import net.shopin.wms.persistence.LeaveMessageMapper;
import net.shopin.wms.persistence.LeaveMessageTypeMapper;

import org.junit.Before;
import org.junit.Test;
import org.springframework.util.Assert;

import com.framework.testCase.AbstractTest;

/**
 * @Class Name LeaveMessageMapperTest
 * @Author jingpeng
 * @Create In 2013-8-15
 */
public class LeaveMessageMapperTest extends AbstractTest {
	
	LeaveMessageMapper leaveMessageMapper;
	LeaveMessageTypeMapper leaveMessageTypeMapper;
	
	@Before
	public void setUp() throws Exception {
		super.setUp();
		this.leaveMessageMapper = context.getBean(LeaveMessageMapper.class);
		this.leaveMessageTypeMapper = context.getBean(LeaveMessageTypeMapper.class);
		Assert.notNull(leaveMessageMapper, "mapper can not be null");
	}
	
	@Test
	public void testInsert() {
		LeaveMessageType lmt = this.leaveMessageTypeMapper.selectByPrimaryKey(1);
		LeaveMessage lm = new LeaveMessage();
		lm.setReplaycontent("replaycontent");
		lm.setTid(lmt.getTid());
		lm.setLeavemsgtime(new Date());
		lm.setReplaystatu(1);
		lm.setNeedreplay(0);
		lm.setBlanklist(1);
		lm.setCommonvisible(1);
		
		this.leaveMessageMapper.insert(lm);
	}
//	@Test
	public void testUpdate() {
		int msgid = 8;
		LeaveMessage lm = this.leaveMessageMapper.selectByPrimaryKey(msgid);
		if(lm == null) {
			System.out.println( "不存在");
		}
		lm.setCommonvisible(0);
		lm.setMsgcontent("msgcontent");
		lm.setReplaytime(new Date());
		lm.setReplayer("replayer");
		lm.setDisablereson("disablereson");
		lm.setUseremail("529474@163.com");
		lm.setUsername("username");
		lm.setTel("18612054104");
		lm.setOrderno("09");
		lm.setUserprovince("北京");
		this.leaveMessageMapper.updateByPrimaryKey(lm);
	}
	
//	@Test
	public void testSelectByParms() {
		LeaveMessageVO key = new LeaveMessageVO();
		key.setOrderKey("desc");
		key.setStart(0);
		key.setPageSize(2);
		System.out.println(this.leaveMessageMapper.selectByParms(key));
		
	}
}
