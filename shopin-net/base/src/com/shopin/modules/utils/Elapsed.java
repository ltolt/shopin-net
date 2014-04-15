package com.shopin.modules.utils;

import com.ocpsoft.pretty.time.PrettyTime;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;

/**
 * Created by IntelliJ IDEA.
 * User: wentao
 * Date: 2009-2-5
 * Time: 13:55:07
 */
public class Elapsed {

    static SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

    static PrettyTime prettyTime = new PrettyTime(new Locale("ZH_CN"));

    public static String calcElapsed(String date) {
        try {
            return prettyTime.format(formatter.parse(date));
        } catch (ParseException e) {
            e.printStackTrace();
            return "";
        }
    }

    public static String calcElapsed(Date date) {
        return prettyTime.format(date);
    }
}
