import net.rubyeye.xmemcached.MemcachedClient;
import net.rubyeye.xmemcached.exception.MemcachedException;
import org.aopalliance.intercept.MethodInvocation;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.security.util.SimpleMethodInvocation;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.concurrent.TimeoutException;

/**
 * Created by IntelliJ IDEA.
 * User: yanwt
 * Date: 2009-12-4
 * Time: 13:31:10
 */
public class TestTokyoTyrant {
    public static void main(String[] args) {
        ApplicationContext ctx = new ClassPathXmlApplicationContext("sessionCache.xml");
        MemcachedClient memcachedClient = (MemcachedClient) ctx.getBean("masterCache");
        try {
            //MethodInvocation invocation = new SimpleMethodInvocation();
            Map map = new HashMap();
            map.put("1",123);
            map.put("2",234);
            map.put("3",456);
            //map.put("invocation",invocation);

            memcachedClient.replace("testTT", 1, map);
            /*try {
                Thread.sleep(2000);
            } catch (InterruptedException e) {
                e.printStackTrace();
            }*/
            Map obj = (Map)memcachedClient.get("testTT");
            System.out.println("----"+obj.get("2"));
            memcachedClient.shutdown();
        } catch (TimeoutException e) {
            e.printStackTrace();
        } catch (InterruptedException e) {
            e.printStackTrace();
        } catch (MemcachedException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }

    }
}
