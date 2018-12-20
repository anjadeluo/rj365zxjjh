package cn.jade.rjzxjjh.utils;

import java.util.concurrent.TimeUnit;

import com.google.common.cache.Cache;
import com.google.common.cache.CacheBuilder;

/**
 * Created by yhsk on 2018/11/2.
 */
public class SessionUtils {

    private SessionUtils() {
    }

    private static volatile Cache<String, Object> SESSION_REPOSITORY = null;

    public static void init(int expireMinute) {
        if (null == SESSION_REPOSITORY) {
            synchronized (SessionUtils.class) {
                if (null == SESSION_REPOSITORY) {
                    SESSION_REPOSITORY = CacheBuilder.newBuilder().maximumSize(Integer.MAX_VALUE).expireAfterAccess(expireMinute, TimeUnit.MINUTES).build();
                }
            }
        }
    }

    public static void put(String key, Object object) {
        SESSION_REPOSITORY.put(key, object);
    }

    public static Object get(String key) {
        return SESSION_REPOSITORY.getIfPresent(key);
    }

    public static void remove(String key) {
        SESSION_REPOSITORY.invalidate(key);
    }
}
