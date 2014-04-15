/**
 * 说 明     : Quartz 测试
 * author: 陆湘星
 * data  : 2011-5-26
 * email : xiangxingchina@163.com
 **/
package cron.demo;

import java.util.Date;
import java.util.logging.Logger;



public class TJob {
	
	private Logger logger = Logger.getLogger(this.getClass().getName());
	
    public void doJob(){
    	 logger.info("第一个任务：" +new Date().toLocaleString());
    }
    
    public void doJob2(){
   	 	logger.info("第二个任务：" +new Date().toLocaleString());
   }
   
}
