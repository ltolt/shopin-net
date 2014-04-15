package net.shopin.web.view;

import org.hibernate.validator.constraints.NotEmpty;

import javax.validation.constraints.Size;

/**
 * Created by IntelliJ IDEA.
 * User: user
 * Date: 2010-1-17
 * Time: 16:42:13
 * To change this template use File | Settings | File Templates.
 */
public class DemoVO {

    @Size(min=6,max=10)
    private String username;
    @NotEmpty
    @Size(min=6,max=10)
    private String password;

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
        return "DemoVO{" +
                "username='" + username + '\'' +
                ", password='" + password + '\'' +
                '}';

}
}
