package com.shopin.modules.activemq;

import java.io.Serializable;

/**
 * Created by IntelliJ IDEA.
 * User: yanwt
 * Date: 2009-7-29
 * Time: 12:53:10
 */
public class MessageVO implements Serializable {
	private String id;     //消息id
    private String type;   //消息类型
    private String message;//提示信息

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }



    @Override
    public String toString() {
        return "MessageVO{" +
                "id='" + id + '\'' +
                ", type='" + type + '\'' +
                ", message='" + message + '\'' +
                '}';
    }
}
