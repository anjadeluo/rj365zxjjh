package cn.jade.rjzxjjh.service;

import cn.jade.rjzxjjh.constant.CommonConstant;
import cn.jade.rjzxjjh.exception.MyException;
import cn.jade.rjzxjjh.mapper.ContributorMapper;
import cn.jade.rjzxjjh.mapper.MenuMapper;
import cn.jade.rjzxjjh.mapper.UserMapper;
import cn.jade.rjzxjjh.model.*;
import cn.jade.rjzxjjh.utils.SecurityUtils;
import cn.jade.rjzxjjh.utils.StringUtils;
import cn.jade.rjzxjjh.utils.UserUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;


/**
 * Created by yhsk on 2018/5/14.
 */
@Service
public class ContributorService {

    @Autowired
    private ContributorMapper contributorMapper;

    public List<Contributor> findList(Contributor contributor) {
        if (contributor != null && contributor.getPage() != null) {
            Page page = contributor.getPage();
            page.setCurrentPage(page.getCurrentPage() * page.getPageSize());
        }
        return contributorMapper.findList(contributor);
    }

    public long getCount(Contributor contributor) {
        Long count = contributorMapper.getCount(contributor);
        return count == null?0:count;
    }

    public int delete(Integer id) {
        return contributorMapper.delete(id);
    }

    public Contributor select(Integer id) {
        return contributorMapper.selectByPrimaryKey(id);
    }

    public Integer save(Contributor contributor) {
        if (contributor != null && contributor.getId() != null) {
            contributor.preUpdate();
            return contributorMapper.update(contributor);
        } else {
            contributor.preInsert();
            return contributorMapper.insertSelective(contributor);
        }
    }

    public List<Map<String, Object>> getMonthGroupData(){
        return contributorMapper.getMonthGroupData();
    }
}
