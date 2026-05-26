package com.ruoyi.system.unit;

import org.apache.logging.log4j.util.Strings;

//公共
public class Common2 {
    /**
     * 新增里面的内容删除 <p> 暂时不用这个了
     */
    public static String addDeleteP(String Content){
        if(Strings.isNotEmpty(Content)) {
            String neirong=Content;
            String neirong2=neirong.substring(3,neirong.length());
            String neirong3=neirong2.substring(0,neirong2.length()-4);
            return neirong3;}
        else {
            return "";
        }
    }
    /**
     * 修改里面的内容删除 <p> 暂时不用这个了
     */
    public static String editDeleteP(String Content){
        String neirong=Content;
        String neirong2="";
        String neirong3 ="";
        if(neirong.length() >= 4){
            neirong2=neirong.substring(3,neirong.length());
            neirong3=neirong2.substring(0,neirong2.length()-4);
        } else {
            neirong3 = neirong;
        }
        return neirong3;
    }

    /**
     *  *list展示的时候 将<P> </P>都去掉了
     */
    /**todo 优先用这个*/
    public static String editDeleteP2(String Content){
        // 定义正则表达式模式
        String plainText = Content.replace("<p>", "").replace("</p>", "");
        return plainText;
    }



}
