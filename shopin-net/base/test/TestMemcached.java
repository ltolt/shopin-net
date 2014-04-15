//
//import com.shopin.modules.interceptor.CachedObject;
//import net.rubyeye.xmemcached.MemcachedClient;
//import net.rubyeye.xmemcached.exception.MemcachedException;
//import org.springframework.context.ApplicationContext;
//import org.springframework.context.support.ClassPathXmlApplicationContext;
//
//import java.util.HashMap;
//import java.util.Map;
//import java.util.concurrent.TimeoutException;
//
///**
// * Created by IntelliJ IDEA.
// * User: yanwt
// * Date: 2009-10-16
// * Time: 10:54:20
// */
//public class TestMemcached {
//
//
//    //private static MemcachedClient memcachedClient = null;
//    public static void main(String[] args) throws Exception{
//        ApplicationContext ctx = new ClassPathXmlApplicationContext("sessionCache.xml");
//
//        MemcachedClient memcachedClient = (MemcachedClient) ctx.getBean("slaveCache");
//        Object obj = memcachedClient.get("1b483d741c44bbfcd5aa87f0ad585ba3");
//        //memcachedClient.delete("b927755c984a15575f8ebf777d11b0c1");
//        //System.out.println(cachedObject.getBean());
//    }
//
//}
