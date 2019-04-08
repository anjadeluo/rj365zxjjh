package cn.jade.rjzxjjh.service;

import cn.jade.rjzxjjh.mapper.LogMapper;
import cn.jade.rjzxjjh.model.Log;
import cn.jade.rjzxjjh.model.Page;
import cn.jade.rjzxjjh.model.User;
import cn.jade.rjzxjjh.utils.UserUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class LogService {

    @Autowired
    private LogMapper logMapper;

    public List<Log> findList(Log log) {
        if (log != null && log.getPage() != null) {
            Page page = log.getPage();
            page.setCurrentPage(page.getCurrentPage() * page.getPageSize());
        }
        User user = UserUtils.getCurrentUser();
        if (user == null) {
            return new ArrayList();
        }

        if (User.SUPER_USER.equalsIgnoreCase(user.getUsername())) {
            return logMapper.findAll();
        }

        log.setUsername(user.getUsername());
        return logMapper.selectByUsername(log);
    }

    public long getCount(Log log) {
        User user = UserUtils.getCurrentUser();
        if (user == null) {
            return 0L;
        }

        Long count = 0L;
        if (User.SUPER_USER.equalsIgnoreCase(user.getUsername())) {
            count = logMapper.findAllCount();
        } else {
            log.setUsername(user.getUsername());
            count = logMapper.selectByUsernameCount(log);
        }

        return count == null ? 0 : count;
    }

    public int delete(Integer id) {
        return logMapper.delete(id);
    }

    public int save(Log log) {
        return logMapper.insert(log);
    }
}
