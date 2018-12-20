package cn.jade.rjzxjjh.utils;

import java.util.HashMap;
import java.util.Map;

/**
 * @author ZOSITE Team
 * @time:2015/11/5 10:12
 * @desc配置文件工具类
 * @Version:V1.0
 */
public class ConfigUtils {
    public static final String YES = "1";
    private static ConfigUtils configUtils = new ConfigUtils();
    private static Map<String, String> map = new HashMap();
    private static PropertiesUtils loader;

    /**
     * 获取当前对象实例
     * 默认使用zocomm.properties,非默认
     *
     * @param configResPaths
     * @see: ConfigUtils.getInstance("xx.properties");ConfigUtils.getConfig('key')
     */
    public static ConfigUtils getInstance(String... configResPaths) {
        if (configResPaths == null || configResPaths.length <= 0)
            configResPaths = new String[]{"config.properties"};
        loader = new PropertiesUtils(configResPaths);
        if (map == null) {
            map = new HashMap();
        }
        return configUtils;
    }

    /**
     * 获取配置
     *
     * @see ${fns:getConfig('rootPath')}
     */
    public static String getConfig(String key) {
        String value = map.get(key);
        if (value == null || "".equals(value)) {
            value = loader.getProperty(key);
            map.put(key, value != null ? value : "");
        }
        return value;
    }

    /**
     * 获取管理端根路径
     */
    public static String getRootPath() {
        String c = getConfig("rootPath");
        return getConfig("rootPath");
    }
}
