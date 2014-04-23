package net.shopin.web.conf.renrenConf.model;

/**
 * 网站用户 model类
 */
import java.io.Serializable;

public class User implements Serializable {

	private static final long serialVersionUID = 175499944757799835L;
	private int id = 0;
	private String userName = "";
	private String password = "";
	private String email = "";
	private String name = "";
	private String headurl = "";

	public User() {
	}

	public User(String userName, String passWord, String name, String email) {
		this.setUserName(userName);
		this.setPassword(passWord);
		this.setName(name);
		this.setEmail(email);

	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getHeadurl() {
		return headurl;
	}

	public void setHeadurl(String headurl) {
		this.headurl = headurl;
	}
}
