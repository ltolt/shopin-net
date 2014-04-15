package net.shopin.web.conf.sinaConf;

import net.shopin.web.util.LoadProperties;

public class Weboauth
{
  private static String CONSUMER_KEY = LoadProperties.readValue("SINA_API_KEY");
  private static String CONSUMER_SECRET = LoadProperties.readValue("SINA_API_SECRET");
}