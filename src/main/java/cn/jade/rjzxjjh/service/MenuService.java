package cn.jade.rjzxjjh.service;

import cn.jade.rjzxjjh.exception.MyException;
import cn.jade.rjzxjjh.mapper.MenuMapper;
import cn.jade.rjzxjjh.model.Menu;
import cn.jade.rjzxjjh.model.User;
import cn.jade.rjzxjjh.utils.MenuUtils;
import cn.jade.rjzxjjh.utils.SessionUtils;
import cn.jade.rjzxjjh.utils.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by sang on 2017/12/28.
 */
@Service
@Transactional
public class MenuService {
    @Autowired
    MenuMapper menuMapper;

    public List<Menu> getAllMenu(){
        return menuMapper.findAll();
    }

    public List<Menu> getMenusByUserId() {
//        User user = UserUtils.getCurrentUser();
        User user = (User) SessionUtils.get("logined_user");
        if (user == null) {
            user = new User();
        }
        return menuMapper.findByUserId(user.getId());
    }

    public int insert(Menu menu) {
        String id = getSequenceMenuId(menu.getPid());
        if (StringUtils.isBlank(id)) {
            return 0;
        }
        menu.setId(id);
        menu.setLevel(MenuUtils.getLevel(id));
        int rec = menuMapper.insert(menu);
        if (rec > 0) {
            rec = menuMapper.initSequenceMenuId(menu.getId());
        }
        return rec;
    }

    public String getSequenceMenuId(String pid){
        String id = menuMapper.getSequenceMenuId(pid);
        if (StringUtils.isNotBlank(id)) {
            menuMapper.updateSequenceMenuId(pid);
        }
        return id;
    }

    public int update(Menu menu) {
        return menuMapper.update(menu);
    }

    public int delete(Menu menu) {
        if (menu == null || StringUtils.isBlank(menu.getId())) {
            return 0;
        }

        int subCount = menuMapper.selectCountByPid(menu.getId());
        if (subCount > 0) {
            return 2;
        }

        int rec = menuMapper.delete(menu);
        if (rec == 0) {
            return 3;
        }

        return 1;
    }

    public long getCount(Menu role) {
        return menuMapper.getCount(role);
    }

    public int save(Menu menu) throws MyException {
        int rec = 0;

        if (StringUtils.isBlank(menu.getId())) {
            String msg = checkHistory(menu);
            if (StringUtils.isNotBlank(msg)) {
                throw new MyException(msg);
            }
            rec = menuMapper.insert(menu);
        } else {
            rec = menuMapper.update(menu);
        }

        return rec;
    }

    private String checkHistory(Menu menu) {
        Menu oldMenu = menuMapper.selectByPidAndName(menu);
        if (oldMenu != null) {
            return "同级菜单名不能重复";
        }

        oldMenu = menuMapper.selectByAuthority(menu);
        if (oldMenu != null) {
            return "权限标识不能重复";
        }

        return null;
    }
}
