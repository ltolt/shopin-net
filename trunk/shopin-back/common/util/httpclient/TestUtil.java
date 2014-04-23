package util.httpclient;

public class TestUtil {
	public static String doTest(String url,String method,String params){
		HttpClient client = new HttpClient(url);
		 client.setParam("_method", method);
		 client.setParams(params);
		String content = client.getPostResult();
		System.out.println(content);
		return content;
	}
}
