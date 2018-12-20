package cn.jade.rjzxjjh.constant;

import java.util.HashMap;

/**
 * Created by yhsk on 2018/6/5.
 */
public class CommonConstant {
    public static final String TOOL_TYPE_OVERLAP = "overlap";

    public static final HashMap ANALYSIS_TYPE = new HashMap(){
        {
            put("SUM", "求和");
            put("MAX", "最大值");
            put("MIN", "最小值");
            put("AVG", "平均值");
            put("COUNT", "总数");
        }
    };

    //sde数据类型-数据集
    public static Integer SDE_DATATYPE_DATASET = 0;
    //sde数据类型-图层
    public static Integer SDE_DATATYPE_FEATURECLASS = 1;

    public static String PASSWORD_REGEX = "^^(?![a-zA-z]+$)(?!\\d+$)(?![!@#$%^&*_-]+$)(?![a-zA-z\\d]+$)(?![a-zA-z!@#$%^&*_-]+$)(?![\\d!@#$%^&*_-]+$)[a-zA-Z\\d!@#$%^&*_-]+$";
}
