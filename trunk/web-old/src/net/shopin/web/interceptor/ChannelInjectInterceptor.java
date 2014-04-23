package net.shopin.web.interceptor;

import com.shopin.modules.utils.Codec;
import net.shopin.api.IChannelService;
import net.shopin.api.ISearchService;
import net.shopin.view.ChannelVO;
import net.shopin.view.PopSearchKeyVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.GenericTypeResolver;
import org.springframework.core.annotation.AnnotationUtils;
import org.springframework.web.servlet.DispatcherServlet;
import org.springframework.web.servlet.HandlerExecutionChain;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import org.springframework.web.util.UrlPathHelper;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by IntelliJ IDEA.
 * User: yanwt
 * Date: 2010-1-27
 * Time: 19:06:44
 */
public class ChannelInjectInterceptor extends HandlerInterceptorAdapter {
    @Autowired
    private IChannelService channelService;
    @Autowired
    private ISearchService searchService;

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
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
            if (channelVO.getSid()==null){
                channelVO = channelService.getChannelByName(channel);
            }
        } else {
            channelVO = channelService.getChannelByName(channel);
        }
        List<ChannelVO> channelList = channelService.findAllChannels();
        request.setAttribute("channelList", channelList);
        request.setAttribute("secondChannelList", channelService.findSubChannelsInChannel(channelVO.getSid()));
        request.setAttribute("channel", channelVO);
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
        try {
            List<PopSearchKeyVO> list = searchService.getPopSearchKey(channelVO.getProductClass());
            List<PopSearchKeyVO> newlist = new ArrayList<PopSearchKeyVO>();
            for (int i = 0; i < list.size(); i++) {
                PopSearchKeyVO popSearchKeyVO = list.get(i);
                popSearchKeyVO.setUrl(Codec.encode(popSearchKeyVO.getKey()));
                newlist.add(popSearchKeyVO);
            }
            modelAndView.addObject("popSearch", newlist);
        } catch (Exception e) {
        }
        super.postHandle(request, response, handler, modelAndView);
    }
}
