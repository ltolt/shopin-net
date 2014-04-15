package com.shopin.modules.utils;

import org.htmlparser.Attribute;
import org.htmlparser.Node;
import org.htmlparser.Tag;
import org.htmlparser.lexer.Lexer;
import org.htmlparser.nodes.TextNode;
import org.htmlparser.util.ParserException;

/**
 * Created by IntelliJ IDEA.
 * User: yanwt
 * Date: 2009-9-24
 * Time: 16:28:53
 */
public class SafeHtml {

    public static String makeSafe(String contents) {
        if (contents == null || contents.length() == 0) {
            return contents;
        }
        StringBuffer sb = new StringBuffer(contents.length());
        Lexer lexer = new Lexer(contents);
        Node node;
        try {
            while ((node = lexer.nextNode()) != null) {
                boolean isTextNode = node instanceof TextNode;
                if (isTextNode) {
                    String text = node.toHtml();
                    if (text.indexOf('>') > -1 || text.indexOf('<') > -1) {
                        StringBuffer tmp = new StringBuffer(text);
                        replaceAll(tmp, "<", "&lt;");
                        replaceAll(tmp, ">", "&gt;");
                        node.setText(tmp.toString());
                    }
                }else {
                    StringBuffer tmp = new StringBuffer(node.toHtml());
                    replaceAll(tmp, "<", "&lt;");
                    replaceAll(tmp, ">", "&gt;");
                    sb.append(tmp.toString());
                }
            }
        } catch (ParserException e) {
            e.printStackTrace();
        }
        return sb.toString();
    }

    public static String replaceAll(StringBuffer sb, String what, String with) {
        int pos = sb.indexOf(what);
        while (pos > -1) {
            sb.replace(pos, pos + what.length(), with);
            pos = sb.indexOf(what);
        }
        return sb.toString();
    }


}