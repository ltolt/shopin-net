package net.shopin.web.vo;

import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotEmpty;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

/**
 * Created by IntelliJ IDEA.
 * User: yanwt
 * Date: 2010-1-11
 * Time: 20:46:57
 */
public class ValidationVO {
    @NotNull
    private String name;
    @Email
    private String email;
    @NotEmpty
    private String password;
    @Size(min=9,max=10)
    private String test;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getTest() {
        return test;
    }

    public void setTest(String test) {
        this.test = test;
    }

    @Override
    public String toString() {
        return "ValidationVO{" +
                "name='" + name + '\'' +
                ", email='" + email + '\'' +
                ", password='" + password + '\'' +
                ", test='" + test + '\'' +
                '}';
    }
}
