package cn.jade.rjzxjjh.utils;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * Created by yhsk on 2018/8/2.
 */
public class URLEncoderHZ {

    private static String zhPattern = "[\\u4e00-\\u9fa5]";

    /**
     * 替换字符串卷
     *
     * @param str 被替换的字符串
     * @param charset 字符集
     * @return 替换好的
     * @throws UnsupportedEncodingException 不支持的字符集
     */
    public static String encode(String str, String charset) throws UnsupportedEncodingException {
        Pattern p = Pattern.compile(zhPattern);
        Matcher m = p.matcher(str);
        StringBuffer b = new StringBuffer();
        while (m.find()) {
            m.appendReplacement(b, URLEncoder.encode(m.group(0), charset));
        }
        m.appendTail(b);
        return b.toString();
    }
}
