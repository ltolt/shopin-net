package net.shopin.web.view;

import com.sun.syndication.feed.rss.Channel;
import com.sun.syndication.feed.rss.Description;
import com.sun.syndication.feed.rss.Item;
import net.shopin.web.vo.RssItem;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.view.feed.AbstractRssFeedView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
/**
 * Created by IntelliJ IDEA.
 * User: yanwt
 * Date: 2010-2-24
 * Time: 18:02:46
 */
public class RssView extends AbstractRssFeedView {

    @Override
    protected void buildFeedMetadata(Map<String, Object> model, Channel feed, HttpServletRequest request) {
        String feedTitle = (String) model.get("feedTitle");
        String feedDesc = (String) model.get("feedDesc");
        String feedLink = (String) model.get("feedLink");
        feed.setTitle(feedTitle);
        feed.setDescription(feedDesc);
        feed.setLink(feedLink);
    }

    @Override
    protected List<Item> buildFeedItems(Map<String, Object> model, HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse) throws Exception {
        @SuppressWarnings("unchecked")
        List<RssItem> rssItems = (List<RssItem>) model.get("rssItemList");

        List<Item> feedItems = new ArrayList<Item>();
        for (RssItem rssItem : rssItems) {
            Item feedItem = new Item();
            feedItem.setTitle(rssItem.getTitle());
            feedItem.setAuthor(rssItem.getAuthor());
            feedItem.setPubDate(rssItem.getDatePublished());

            Description desc = new Description();
            desc.setType("text/html");
            desc.setValue(rssItem.getDescription());
            feedItem.setDescription(desc);

            feedItem.setLink(rssItem.getLink());
            feedItems.add(feedItem);
        }

        return feedItems;
    }
}
