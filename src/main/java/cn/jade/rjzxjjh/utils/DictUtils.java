package cn.jade.rjzxjjh.utils;

import cn.jade.rjzxjjh.model.Dict;
import cn.jade.rjzxjjh.service.DictService;

import java.util.List;

public class DictUtils {

    private static DictService dictService = SpringContextHolder.getBean(DictService.class);

    public static List<Dict> getDictByType(String dictType) {
        return dictService.selectByType(new Dict(dictType));
    }

    public static Dict getDictValue(String dictType, String dictIndex) {
        return dictService.selectByTypeIndex(new Dict(dictType,null, dictIndex));
    }
}
