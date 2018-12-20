package cn.jade.rjzxjjh.service;

import cn.jade.rjzxjjh.mapper.DictMapper;
import cn.jade.rjzxjjh.model.Dict;
import cn.jade.rjzxjjh.model.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class DictService {

    @Autowired
    private DictMapper dictMapper;

    public List<Dict> findList(Dict dict) {
        if (dict != null && dict.getPage() != null) {
            Page page = dict.getPage();
            page.setCurrentPage(page.getCurrentPage() * page.getPageSize());
        }
        return dictMapper.findList(dict);
    }

    public long getCount(Dict dict) {
        Long count = dictMapper.getCount(dict);
        return count == null ? 0 : count;
    }

    public int delete(Dict dict) {
        return dictMapper.delete(dict);
    }

    public int delete(Integer id) {
        return dictMapper.delete(new Dict(id));
    }

    public int save(Dict dict) {
        if (dict.getId() != null) {
            return dictMapper.update(dict);
        }
        return dictMapper.insert(dict);
    }

    public List<Dict> selectByType(Dict dict) {
        return dictMapper.selectByType(dict);
    }

    public Dict selectByTypeIndex(Dict dict) {
        return dictMapper.selectByTypeIndex(dict);
    }

    public int deleteType(String dictType){
        return dictMapper.deleteType(new Dict(dictType));
    }

    public int deleteType(Dict dict){
        return dictMapper.deleteType(dict);
    }

    public int saveDict(Dict dict) {
        if (dict == null) {
            return 0;
        }
        if (dict.getId() == null) {
            return dictMapper.insert(dict);
        } else {
            return dictMapper.update(dict);
        }
    }
}
