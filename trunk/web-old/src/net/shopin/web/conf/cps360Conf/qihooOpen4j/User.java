package net.shopin.web.conf.cps360Conf.qihooOpen4j;


/*
 Copyright (c) 2007-2009, Yusuke Yamamoto
 All rights reserved.
 */

import java.util.ArrayList;
import java.util.List;

import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

import net.shopin.web.conf.cps360Conf.qihooOpen4j.http.Response;
import net.shopin.web.conf.cps360Conf.qihooOpen4j.json.JSONArray;
import net.shopin.web.conf.cps360Conf.qihooOpen4j.json.JSONException;
import net.shopin.web.conf.cps360Conf.qihooOpen4j.json.JSONObject;

/**
 * A data class representing Basic user information element
 */
public class User extends QihooResponse implements java.io.Serializable {
    private static final long serialVersionUID = -5902515666255590830L;
    private String id;
    private String name;
    private String avatar;
    private String sex;
    private String area;
    static final String[] POSSIBLE_ROOT_NAMES = new String[]{"user",
            "sender", "recipient", "retweeting_user"};



    public User(Response res, QihooSDK QihooSDK) throws QihooException {
        super(res);
        Element elem = res.asDocument().getDocumentElement();
        init(elem, QihooSDK);
    }

    public User(Response res, Element elem, QihooSDK QihooSDK)
            throws QihooException {
        super(res);
        init(elem, QihooSDK);
    }

    public User(JSONObject json) throws QihooException {
        super();
        init(json);
    }

    private void init(JSONObject json) throws QihooException {
        if (json != null) {
            try {
                name = json.getString("name");
                id = json.getString("id");
                avatar = json.getString("avatar");
                area=json.getString("area");
                sex=json.getString("sex");
            } catch (JSONException jsone) {
                throw new QihooException(jsone.getMessage() + ":"
                        + json.toString(), jsone);
            }
        }
    }

    private void init(Element elem, QihooSDK QihooSDK) throws QihooException {
        ensureRootNodeNameIs(POSSIBLE_ROOT_NAMES, elem);
        id = getChildText("id", elem);
        name = getChildText("name", elem);
    }

    /**
     * Returns the uid of the user
     *
     * @return the uid of the user
     */
    public String getId() {
        return id;
    }

    /**
     * Returns the name of the user
     *
     * @return the name of the user
     */
    public String getName() {
        return name;
    }

    public String getSex() {
        return sex;
    }

    public String getArea() {
        return area;
    }


    public static List<User> constructUser(Response res) throws QihooException {

        JSONObject json = res.asJSONObject();
        try {
            JSONArray list = json.getJSONArray("");
            int size = list.length();
            List<User> users = new ArrayList<User>(size);
            for (int i = 0; i < size; i++) {
                users.add(new User(list.getJSONObject(i)));
            }
            return users;

        } catch (JSONException je) {
            throw new QihooException(je);
        }

    }

    public static List<User> constructUsers(Response res, QihooSDK QihooSDK)
            throws QihooException {
        Document doc = res.asDocument();
        if (isRootNodeNilClasses(doc)) {
            return new ArrayList<User>(0);
        } else {
            try {
                ensureRootNodeNameIs("users", doc);
                NodeList list = doc.getDocumentElement().getChildNodes();
                List<User> users = new ArrayList<User>(list.getLength());
                Node node;
                for (int i = 0; i < list.getLength(); i++) {
                    node = list.item(i);
                    if (node.getNodeName().equals("user")) {
                        users.add(new User(res, (Element) node, QihooSDK));
                    }
                }

                return users;
            } catch (QihooException te) {
                if (isRootNodeNilClasses(doc)) {
                    return new ArrayList<User>(0);
                } else {
                    throw te;
                }
            }
        }
    }

    public static List<User> constructUsers(Response res) throws QihooException {
        try {
            JSONArray list = res.asJSONArray();
            int size = list.length();
            List<User> users = new ArrayList<User>(size);
            for (int i = 0; i < size; i++) {
                users.add(new User(list.getJSONObject(i)));
            }
            return users;
        } catch (JSONException jsone) {
            throw new QihooException(jsone);
        } catch (QihooException te) {
            throw te;
        }
    }

    /**
     * @param res
     * @return
     * @throws QihooException
     */
    public static List<User> constructResult(Response res)
            throws QihooException {
        JSONArray list = res.asJSONArray();
        try {
            int size = list.length();
            List<User> users = new ArrayList<User>(size);
            for (int i = 0; i < size; i++) {
                users.add(new User(list.getJSONObject(i)));
            }
            return users;
        } catch (JSONException e) {
        }
        return null;
    }

    @Override
    public int hashCode() {
        int uid = Integer.parseInt(id);
        final int prime = 31;
        int result = 1;
        result = prime * result + (int) (uid ^ (uid >>> 32));
        return result;
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null) {
            return false;
        }
        if (getClass() != obj.getClass()) {
            return false;
        }
        User other = (User) obj;
        if (id.equals(other.id)) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "User{" + " id = " + id
                + "\n name = " + name
                + "\n avatar = " + avatar
                + "}";
    }
}