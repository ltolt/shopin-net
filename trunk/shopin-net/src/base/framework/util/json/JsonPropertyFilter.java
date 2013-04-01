package base.framework.util.json;

import net.sf.json.util.PropertyFilter;

/**说 明     : JSON 控制过滤器
 * @author K
 *
 */
public class JsonPropertyFilter implements PropertyFilter {

	 @Override  
	    public boolean apply(Object source, String name, Object value) {  
	        // 过滤掉为null的属性  和 ""
	        if (value == null || "".equals(value))  
	            return true;  
	        return false;  
	    }  
}
