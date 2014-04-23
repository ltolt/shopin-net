package net.shopin.web.view;

import com.sun.syndication.feed.atom.Content;
import com.sun.syndication.feed.atom.Entry;
import com.sun.syndication.feed.rss.Channel;
import com.sun.syndication.feed.rss.Description;
import com.sun.syndication.feed.rss.Item;
import net.shopin.web.vo.RssItem;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.view.feed.AbstractAtomFeedView;
import org.springframework.web.servlet.view.feed.AbstractRssFeedView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
/**
 * Created by IntelliJ IDEA.
 * User: yanwt
 * Date: 2010-1-16
 * Time: 18:24:01
 */
public class AtomView extends AbstractAtomFeedView {

    @Override
    protected List<Entry> buildFeedEntries(Map<String, Object> model, HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse) throws Exception {
        List<RssItem> rssItems = (List<RssItem>) model.get("rssItemList");

        List<Entry> feedItems = new ArrayList<Entry>();
        for (RssItem rssItem : rssItems) {
            Entry feedItem = new Entry();
            feedItem.setTitle(rssItem.getTitle());
            //feedItem.s(rssItem.getAuthor());
            feedItem.setPublished(rssItem.getDatePublished());
            Content summary = new Content();
			summary.setValue(rssItem.getDescription());
            feedItem.setSummary(summary);
            //feedItem.s(rssItem.getLink());
            feedItems.add(feedItem);
        }

        return feedItems;
    }


}