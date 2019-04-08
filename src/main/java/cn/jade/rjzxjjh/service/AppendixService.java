package cn.jade.rjzxjjh.service;

import cn.jade.rjzxjjh.mapper.AppendixMapper;
import cn.jade.rjzxjjh.model.Appendix;
import cn.jade.rjzxjjh.model.Page;
import cn.jade.rjzxjjh.utils.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;
import java.util.UUID;


/**
 * Created by yhsk on 2018/5/14.
 */
@Service
public class AppendixService {

    @Autowired
    private AppendixMapper appendixMapper;

    public List<Appendix> findList(Appendix appendix) {
        if (appendix != null && appendix.getPage() != null) {
            Page page = appendix.getPage();
            page.setCurrentPage(page.getCurrentPage() * page.getPageSize());
        }
        return appendixMapper.selectByAppendixId(appendix);
    }

    public int delete(Integer id) {
        return appendixMapper.delete(id);
    }

    public Appendix select(Integer id) {
        return appendixMapper.select(id);
    }

    public Appendix save(Appendix appendix) {
        if (appendix != null && appendix.getId() != null) {
            appendix.preUpdate();
            appendixMapper.update(appendix);
            return appendix;
        } else {
            if (StringUtils.isBlank(appendix.getAppendixId())) {
                appendix.setAppendixId(UUID.randomUUID().toString().replace("-", ""));
            }
            appendix.preInsert();
            appendixMapper.insert(appendix);
            return appendix;
        }
    }
}
