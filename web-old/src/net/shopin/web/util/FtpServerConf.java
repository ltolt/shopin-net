package net.shopin.web.util;

/**
 * Created by IntelliJ IDEA.
 * User: lqw
 * Date: 2010-2-8
 * Time: 20:45:35
 * To change this template use File | Settings | File Templates.
 */
public class FtpServerConf {
    private String host;
    private String username;
    private String password;

    public String getHost() {
        return host;
    }

    public void setHost(String host) {
        this.host = host;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    @Override
    public String toString() {
        return "FtpServerConf{" +
                "host='" + host + '\'' +
                ", username='" + username + '\'' +
                ", password='" + password + '\'' +
                '}';
    }
}
