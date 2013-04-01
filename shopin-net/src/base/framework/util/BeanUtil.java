/**
 * 说 明     : Bean辅助对象
 * author: 陆湘星
 * data  : 2011-5-28
 * email : xiangxingchina@163.com
 **/
package base.framework.util;

import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import base.framework.util.json.JsonUtil;


public class BeanUtil {
	
	
	public static Map Obj2Map(Object obj){
		Map map = new HashMap();
//		try {
//			BeanUtils.populate(obj, map);
//		} catch (IllegalAccessException e) {
//			e.printStackTrace();
//		} catch (InvocationTargetException e) {
//			e.printStackTrace();
//		}
		//--OLD 实现方法
		GetObjAttrs(map, obj, obj.getClass());
		if(obj.getClass().getSuperclass()!=null){
			GetObjAttrs(map, obj,obj.getClass().getSuperclass());
			if(obj.getClass().getSuperclass().getSuperclass()!=null){
				GetObjAttrs(map, obj,obj.getClass().getSuperclass().getSuperclass());
			}
		}
		return map;
	}
	
	private static void GetObjAttrs(Map map,Object obj,Class clazz){
		Field[] fields = clazz.getDeclaredFields();
		 if (fields != null && fields.length > 0) {
	        	for (Field field : fields) {
	                try {
	                	String name = field.getName();
	                    String value = getMapStrValue(obj, field);
	                    if(value!=null && !"".equals(value)){
	                    	  map.put(name, value);
	                    }
	                } catch (NoSuchMethodException e) {
//	                    e.printStackTrace();
	                } catch (InvocationTargetException e) {
//	                    e.printStackTrace();
	                } catch (IllegalAccessException e) {
//	                    e.printStackTrace();
	                }
	        	}
	  }
		 
	}
	public static String Cond2UrlParams(Object obj){
		if(obj instanceof String) return obj.toString();
		Map map = Obj2Map(obj);
		StringBuffer param =  new StringBuffer();
		Set<Map.Entry<String, String>> set = map.entrySet();
        for (Iterator<Map.Entry<String, String>> it = set.iterator(); it.hasNext();) {
            Map.Entry<String, String> entry = (Map.Entry<String, String>) it.next();
            String key = entry.getKey();
            String val = entry.getValue();
            if(key!=null && val!=null && !"".equals(key) && !"".equals(val.trim())){
            	param.append(key+"="+val+",");
            }
        }
		return param.toString();
	}
	
	public static String Obj2UrlParams(Object obj){
		StringBuffer param =  new StringBuffer();
		Field[] fields = obj.getClass().getDeclaredFields();
        if (fields != null && fields.length > 0) {
        	for (Field field : fields) {
                try {
                	String name = field.getName();
                    String value = getStrValue(obj, field);
                    if(value!=null && !"".equals(value)){
                    	if(param.length()>3) param.append(", ");
                    	param.append(name).append("=").append(value);
                    }
                } catch (NoSuchMethodException e) {
//                    e.printStackTrace();
                } catch (InvocationTargetException e) {
//                    e.printStackTrace();
                } catch (IllegalAccessException e) {
//                    e.printStackTrace();
                }
        	}
        }
		return param.toString();
	}
	
	
    public static void converter(Object src, Object des) {
        Field[] fields = des.getClass().getDeclaredFields();
        if (fields != null && fields.length > 0) {
            for (Field field : fields) {
                try {
                    setValue(src, des, field);
                } catch (NoSuchMethodException e) {
//                    e.printStackTrace();
                } catch (InvocationTargetException e) {
//                    e.printStackTrace();
                } catch (IllegalAccessException e) {
//                    e.printStackTrace();
                }
            }
        }
    }

    /**
     * @param src
     * @param des
     * @param field
     * @throws SecurityException
     * @throws NoSuchMethodException
     * @throws InvocationTargetException
     * @throws IllegalAccessException
     */
    private static void setValue(Object src, Object des, Field field) throws SecurityException, NoSuchMethodException, InvocationTargetException, IllegalAccessException {
        Method setMethod = getMethodByPrefix(des, field, "set");
        if (setMethod != null) {
            Object val = getValue(src, field);
            if (val != null) {
                setMethod.invoke(des, val);
            }
        }
    }

    /**
     * @param obj
     * @param field
     * @param prefix
     * @return
     * @throws SecurityException
     * @throws NoSuchMethodException
     */
    private static Method getMethodByPrefix(Object obj, Field field, String prefix) throws SecurityException {
        Class[] parameters = null;
        if ("set".equals(prefix)) {
            parameters = new Class<?>[]{field.getType()};
        }
        StringBuffer methodName = new StringBuffer(prefix);
        String fieldName = field.getName();
        methodName.append(fieldName.substring(0, 1).toUpperCase());
        methodName.append(fieldName.substring(1, fieldName.length()));
        try {
            return obj.getClass().getMethod(methodName.toString(), parameters);
        } catch (NoSuchMethodException e) {
            return null;
        }
    }


    /**
     * @param obj
     * @param field
     * @return
     * @throws NoSuchMethodException
     * @throws InvocationTargetException
     * @throws IllegalAccessException
     */
    private static Object getValue(Object obj, Field field) throws NoSuchMethodException, InvocationTargetException, IllegalAccessException {
        Method getMethod = getMethodByPrefix(obj, field, "get");
        if (getMethod == null) {
            return null;
        }
        Class returnType = getMethod.getReturnType();
        Object objVal = getMethod.invoke(obj, null);
        if (objVal != null) {
            if (returnType == int.class || returnType == Integer.class) {
                return (Integer) objVal;
            } else if (returnType == String.class) {
                return (String) objVal;
            } else if (returnType == float.class || returnType == Float.class) {
                return (Float) objVal;
            } else if (returnType == double.class || returnType == Double.class) {
                return (Float) objVal;
            }

        } else {
            return null;
        }
        return null;
    }
    
    
    /**
     * @param obj
     * @param field
     * @return
     * @throws NoSuchMethodException
     * @throws InvocationTargetException
     * @throws IllegalAccessException
     */
    private static String getStrValue(Object obj, Field field) throws NoSuchMethodException, InvocationTargetException, IllegalAccessException {
        Method getMethod = getMethodByPrefix(obj, field, "get");
        if (getMethod == null) {
            return null;
        }
        Class returnType = getMethod.getReturnType();
        Object objVal = getMethod.invoke(obj, null);
        if (objVal != null) {
            if (returnType == int.class || returnType == Integer.class) {
            	int val =(Integer)objVal ;
            	if(val==0) return null;
                return  String.valueOf(objVal);
            } else if (returnType == String.class) {
                return  String.valueOf(objVal);
            } else if (returnType == float.class || returnType == Float.class) {
                return String.valueOf(objVal);
            } else if (returnType == double.class || returnType == Double.class) {
                return String.valueOf( objVal);
            }else if (returnType == List.class || returnType == ArrayList.class) {
                return JsonUtil.Object2Json(objVal);
            }

        } else {
            return null;
        }
        return null;
    }
    /**
     * @param obj
     * @param field
     * @return
     * @throws NoSuchMethodException
     * @throws InvocationTargetException
     * @throws IllegalAccessException
     */
    private static String getMapStrValue(Object obj, Field field) throws NoSuchMethodException, InvocationTargetException, IllegalAccessException {
        Method getMethod = getMethodByPrefix(obj, field, "get");
        if (getMethod == null) {
            return null;
        }
        Class returnType = getMethod.getReturnType();
        Object objVal = getMethod.invoke(obj, null);
        if (objVal != null) {
            if (returnType == int.class || returnType == Integer.class) {
            	int val =(Integer)objVal ;
                return  String.valueOf(objVal);
            } else if (returnType == String.class) {
                return  String.valueOf(objVal);
            } else if (returnType == float.class || returnType == Float.class) {
                return String.valueOf(objVal);
            } else if (returnType == double.class || returnType == Double.class) {
                return String.valueOf( objVal);
            }else if (returnType == List.class || returnType == ArrayList.class) {
                return JsonUtil.Object2Json(objVal);
            }

        } else {
            return null;
        }
        return null;
    }
}
