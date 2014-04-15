package net.shopin.service;

import java.util.List;

import net.shopin.api.INoticeService;
import net.shopin.base.BaseTestContext;
import net.shopin.entity.ShopNotices;
import net.shopin.view.NoticeVO;

import org.junit.Before;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.util.Assert;

import com.shopin.modules.web.view.PageVO;


public class NoticeSerivicesImplTest extends BaseTestContext{

	@Autowired
	private INoticeService noticeService;

	@Test
	public void testFindNoticesByCate() {
		Assert.notNull(noticeService);
		List<NoticeVO> list = this.noticeService.findNoticesByCate("0");
		for (NoticeVO noticeVO : list) {
			System.out.println(list);
		}
	}
	
	@Test
	public void testGetNoticeById(){
		NoticeVO vo =  this.noticeService.getNoticeById("5");
		System.out.println(vo);
	}
	
	@Test
	public void testGetNoticePage(){
		PageVO<NoticeVO> pageVo = new PageVO<NoticeVO>();
		pageVo.setPageSize(20);
		pageVo =  this.noticeService.getNoticePage(pageVo, "1");
		System.out.println(pageVo);
	}
	
	
	
}
