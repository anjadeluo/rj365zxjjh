package cn.jade.rjzxjjh.utils;

import java.util.HashMap;
import java.util.Map;

/**
 * Created by yhsk on 2018/9/25.
 */
public class MenuUtils {

    public final static Integer LEVEL_1 = 1;
    public final static Integer LEVEL_2 = 2;
    public final static Integer LEVEL_3 = 3;
    public final static Integer LEVEL_4 = 4;
    public final static Integer LEVEL_5 = 5;
    public final static Integer LEVEL_6 = 6;
    public final static Integer LEVEL_7 = 7;

    public static Integer getLevel(String menuId) {
        if (StringUtils.isBlank(menuId)) {
            return 0;
        }

        return LEVEL_MAP.get(menuId.length()+"");
    }

    private static Map<String, Integer> LEVEL_MAP = new HashMap() {
        {
            put("2", LEVEL_1);
            put("5", LEVEL_2);
            put("8", LEVEL_3);
            put("11", LEVEL_4);
            put("14", LEVEL_5);
            put("17", LEVEL_6);
            put("20", LEVEL_7);
        }
    };
}
