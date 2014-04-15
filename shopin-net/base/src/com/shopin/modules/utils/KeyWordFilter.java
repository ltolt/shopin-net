package com.shopin.modules.utils;

import java.util.regex.Pattern;
import java.util.regex.Matcher;
import java.util.Properties;
import java.util.Enumeration;
import java.io.InputStream;
import java.io.IOException;

/**
 * Created by IntelliJ IDEA.
 * User: yanwt
 * Date: 2009-4-28
 * Time: 14:26:55
 */
public class KeyWordFilter {
    private static KeyWordFilter ourInstance = new KeyWordFilter();
    private Pattern pattern = null;

    public static KeyWordFilter getInstance() {
        return ourInstance;
    }

    private KeyWordFilter() {
        StringBuffer patternBuf = new StringBuffer("");
        try {
            InputStream in = KeyWordFilter.class.getClassLoader().getResourceAsStream("words.properties");
            Properties pro = new Properties();
            pro.load(in);
            Enumeration enu = pro.propertyNames();
            patternBuf.append("(");
            while (enu.hasMoreElements()) {
                patternBuf.append(enu.nextElement() + "|");
            }
            patternBuf.deleteCharAt(patternBuf.length() - 1);
            patternBuf.append(")");
            this.pattern = Pattern.compile(new String(patternBuf.toString().getBytes("ISO-8859-1"), "UTF-8"));
        } catch (IOException ioEx) {
            ioEx.printStackTrace();
        }
    }

    public String doFilter(String str) {
        Matcher m = KeyWordFilter.getInstance().getPattern().matcher(str);
        str = m.replaceAll("***");
        return str;
    }

    public Pattern getPattern() {
        return pattern;
    }

    public void setPattern(Pattern pattern) {
        this.pattern = pattern;
    }

}


