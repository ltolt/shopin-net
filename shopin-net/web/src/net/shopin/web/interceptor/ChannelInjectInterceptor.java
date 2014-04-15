/**
 * 说明:
 *     拦截器  给所有的页面提供频道信息和热词
 */
package net.shopin.web.interceptor;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.shopin.api.IChannelService;
import net.shopin.api.INavigationService;
import net.shopin.view.ChannelVO;
import net.shopin.view.NavigationVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import org.springframework.web.util.UrlPathHelper;
/**
 * @Class Name ChannelInjectInterceptor
 * @Author kongm
 * @Create In 2013-7-18
 */
public class ChannelInjectInterceptor extends HandlerInterceptorAdapter {
    @Autowired
    private IChannelService channelService;
    @Autowired
    private INavigationService navigationService;
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        String requestUri = new UrlPathHelper().getLookupPathForRequest(request);
        String channel = "index";
        List<NavigationVO> navigationVOs = new ArrayList<NavigationVO>();
        ChannelVO channelVO = null;
        
        if (requestUri.indexOf("channel") > 0) {
        	//频道页
        	requestUri = requestUri.substring(0, requestUri.indexOf("."));
            channel = requestUri.substring(9);
            channelVO = channelService.getChannelByName(channel);
//            navigationVOs = this.navigationService.getNavigationsByChannel(Integer.parseInt(channelVO.getSid()));
            ChannelVO indexChannelVO = channelService.getChannelByName("index");
            if("man".equals(channel)||"shoes".equals(channel)||"sports".equals(channel)){
            	request.setAttribute("index", "index");
            }
            navigationVOs = this.navigationService.getNavigationsByChannel(Integer.parseInt(indexChannelVO.getSid()));
        } else if (requestUri.lastIndexOf("/") > 0) {
        	//其它页
            requestUri = requestUri.substring(1);
            channelVO = channelService.getChannelByName(requestUri.substring(0, requestUri.indexOf("/")));
            if (channelVO.getSid()==null){
                channelVO = channelService.getChannelByName(channel);
                navigationVOs = this.navigationService.getNavigationsByChannel(Integer.parseInt(channelVO.getSid()));
            }
            
            channelVO.setSid("");
        } else {
        	//首页
        	if("".equals(requestUri) || requestUri.indexOf("index") > 0){
        		channelVO = channelService.getChannelByName(channel);
        		navigationVOs = this.navigationService.getNavigationsByChannel(Integer.parseInt(channelVO.getSid()));
        		request.setAttribute("index", "index");
        	}
        }
        List<ChannelVO> channelList = channelService.findAllChannels();
        request.setAttribute("channelList", channelList);
//        request.setAttribute("secondChannelList", channelService.findSubChannelsInChannel(channelVO.getSid()));
        request.setAttribute("channel", channelVO);
        request.setAttribute("navigations", navigationVOs);
        return super.preHandle(request, response, handler);
    }

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
        String requestUri = new UrlPathHelper().getLookupPathForRequest(request);
        String channel = "index";
        ChannelVO channelVO = null;
        if (requestUri.indexOf("channel") > 0) {
            requestUri = requestUri.substring(0, requestUri.indexOf("."));
            channel = requestUri.substring(9);
            channelVO = channelService.getChannelByName(channel);
        } else if (requestUri.lastIndexOf("/") > 0) {
            requestUri = requestUri.substring(1);
            channelVO = channelService.getChannelByName(requestUri.substring(0, requestUri.indexOf("/")));
            if (channelVO == null){
                channelVO = channelService.getChannelByName(channel);
            }
        } else {
            channelVO = channelService.getChannelByName(channel);
        }
        super.postHandle(request, response, handler, modelAndView);
    }
}
