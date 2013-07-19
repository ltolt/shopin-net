/**
 * @Probject Name: framework
 * @Path: base.framework.json.JsonPropertyFilter.java
 * @Create By kongm
 * @Create In 2013-7-15 ����2:58:10
 * TODO
 */
package base.framework.json;

/**
 * @Class Name JsonPropertyFilter
 * @Author kongm
 * @Create In 2013-7-15
 */
/**
 * ˵ ��     : JSON ���ƹ�����
 * author: ½����
 * data  : 2011-6-20
 * email : xiangxingchina@163.com
 **/
import net.sf.json.util.PropertyFilter;

public class JsonPropertyFilter implements PropertyFilter {  
  
    public boolean apply(Object source, String name, Object value) {  
        // ���˵�Ϊnull������  �� ""
        if (value == null || "".equals(value))  
            return true;  
        return false;  
    }  
}
