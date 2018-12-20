package cn.jade.rjzxjjh.mapper;

import cn.jade.rjzxjjh.model.Dict;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by yhsk on 2018/5/17.
 */
@Repository("dictMapper")
public interface DictMapper {

    List<Dict> findList(Dict dict);

    List<Dict> selectByType(Dict dict);

    Dict selectByTypeIndex(Dict dict);

    int update(Dict dict);

    int insert(Dict dict);

    Long getCount(Dict dict);

    int delete(Dict dict);

    int deleteType(Dict dict);
}
