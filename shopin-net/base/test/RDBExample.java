///**
// * Created by IntelliJ IDEA.
// * User: yanwt
// * Date: 2009-11-18
// * Time: 10:39:30
// */
//import java.io.IOException;
//import java.net.InetSocketAddress;
//import java.util.HashMap;
//import java.util.Map;
//
//import tokyotyrant.RDB;
//import tokyotyrant.transcoder.DoubleTranscoder;
//import tokyotyrant.transcoder.IntegerTranscoder;
//
//public class RDBExample {
//	public static void main(String[] args) throws IOException {
//		Object key;
//		Object value;
//
//		// create the object
//		RDB db = new RDB();
//
//		// connect to the server
//		db.open(new InetSocketAddress("172.16.50.8", 11212));
//
//		// store records
//		if (!db.put("foo", "hop")
//				|| !db.put("bar", "step")
//				|| !db.put("baz", "jump")) {
//			System.err.println("put error");
//		}
//        Map map = new HashMap();
//        map.put("1",1);
//        map.put("2",2);
//        map.put("3",3);
//        map.put("4",4);
//        db.put("map",map);
//		// retrieve records
//		value = db.get("foo");
//		if (value != null) {
//			System.out.println(value);
//		} else {
//			System.err.println("get error");
//		}
//         map = (Map)db.get("map");
//        System.out.println(""+map.get("1"));
//		// traverse records
//		db.iterinit();
//		while ((key = db.iternext()) != null) {
//			value = db.get(key);
//			if (value != null) {
//				System.out.println(key + ":" + value);
//			}
//		}
//
//		// add int
//		db.put("int", 3, new IntegerTranscoder());
//		int i = db.addint("int", 4);
//		System.out.println(i);
//
//		// add double
//		db.put("d", 3.0D, new DoubleTranscoder());
//		double d = db.adddouble("d", 4.0D);
//		System.out.println(d);
//
//		// close the connection
//		db.close();
//	}
//}
