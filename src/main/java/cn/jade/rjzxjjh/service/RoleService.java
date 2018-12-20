package cn.jade.rjzxjjh.service;

import cn.jade.rjzxjjh.mapper.RoleMapper;
import cn.jade.rjzxjjh.model.Page;
import cn.jade.rjzxjjh.model.Role;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class RoleService {

    @Autowired
    private RoleMapper roleMapper;

    public List<Role> findList() {
        return roleMapper.findList();
    }

    public List<Role> findList(Role role) {
        if (role != null && role.getPage() != null) {
            Page page = role.getPage();
            page.setCurrentPage(page.getCurrentPage() * page.getPageSize());
        }
        return roleMapper.findPage(role);
    }

    public long getCount(Role role) {
        Long count = roleMapper.getCount(role);
        return count == null?0:count;
    }

    public Role select(Role role) {
        return roleMapper.select(role);
    }

    public int delete(Integer roleId) {
        int rec = roleMapper.delete(roleId);
        if (rec > 0) {
            roleMapper.deleteUserRole(roleId);
        }
        return rec;
    }

    public int getByRolename(String name) {
        Role role = roleMapper.getByRolename(name);
        if (role != null) {
            return 1;
        }
        return 0;
    }

    public int saveRole(Role role) {
        if (role.getId() != null) {
            return roleMapper.update(role);
        } else {
            return roleMapper.insert(role);
        }
    }
}
