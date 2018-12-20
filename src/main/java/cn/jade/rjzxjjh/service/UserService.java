package cn.jade.rjzxjjh.service;

import cn.jade.rjzxjjh.constant.CommonConstant;
import cn.jade.rjzxjjh.exception.MyException;
import cn.jade.rjzxjjh.model.Menu;
import cn.jade.rjzxjjh.mapper.MenuMapper;
import cn.jade.rjzxjjh.mapper.UserMapper;
import cn.jade.rjzxjjh.model.Page;
import cn.jade.rjzxjjh.model.Role;
import cn.jade.rjzxjjh.model.User;
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


/**
 * Created by yhsk on 2018/5/14.
 */
@Service
public class UserService implements UserDetailsService {

    @Autowired
    private UserMapper userDao;
    @Autowired
    private MenuMapper menuDao;

    public User select(String username) {
        return userDao.findByUserName(new User(username, null));
    }

    public List<User> findAll() {
        return userDao.selectAll();
    }

    public List<User> findList(User user) {
        if (user != null && user.getPage() != null) {
            Page page = user.getPage();
            page.setCurrentPage(page.getCurrentPage() * page.getPageSize());
        }
        return userDao.findList(user);
    }

    public User loadUserByUsername(String username) throws UsernameNotFoundException {

        User user = userDao.findByUserName(new User(username, null));
        if (user != null) {
            List<Menu> userMenus = menuDao.findByUserId(user.getId());
            List<GrantedAuthority> grantedAuthorities = new ArrayList();
            for (Menu menu : userMenus) {
                if (menu != null && menu.getName() != null) {
                    GrantedAuthority grantedAuthority = new SimpleGrantedAuthority(menu.getAuthority());
                    //1：此处将权限信息添加到 GrantedAuthority 对象中，在后面进行全权限验证时会使用GrantedAuthority 对象。
                    grantedAuthorities.add(grantedAuthority);
                }
            }
            if (user.getRole() != null) {
                grantedAuthorities.add(new SimpleGrantedAuthority(user.getRole().getName()));
            }

            user.setMenus(userMenus);
            user.setGrantedAuthorities(grantedAuthorities);

            //记录登录时间
            user.setLastLoginAt(new Date());
            userDao.update(user);

            return user;
        } else {
            throw new UsernameNotFoundException("user: " + username + " do not exist!");
        }
    }

    public User loadUserByUsername(String username, String password) throws MyException,UsernameNotFoundException {
        User user = userDao.findByUserNameAndPwd(new User(username, password));
        if (user != null) {
            if (!user.isEnabled()) {
                throw new MyException("您的账号已被禁用");
            }
            return loadUserByUsername(username);
        } else {
            throw new UsernameNotFoundException("user: " + username + " do not exist!");
        }

    }

    public int update(User user) {
        return userDao.update(user);
    }

    public int updateRoleByUserId(Integer id) {
        return userDao.updateRoleByUserId(new User(id));
    }

    public int regeditUser(User user, Integer roleId, boolean changePwd) throws MyException {
        user.setRole(new Role(roleId));
        return regeditUser(user, changePwd);
    }

    /**
     * 注册用户
     *
     * @param user
     * @return
     * @throws MyException
     */
    public int regeditUser(User user, boolean changePwd) throws MyException {
        if (user.getId() == null) {
            if (StringUtils.isBlank(user.getUsername()) || StringUtils.isBlank(user.getPassword())) {
                throw new MyException("请填写完善用户信息");
            }
            if (!user.getPassword().matches(CommonConstant.PASSWORD_REGEX)) {
                throw new MyException("密码复杂度不够（须同时包含数字、字母和特殊字符）");
            }

            User history = select(user.getUsername());
            if (history != null) {
                throw new MyException("该用户名已被注册");
            }
            user.setPassword(SecurityUtils.getMD5(user.getPassword()));
            user.setEnabled(true);
            int rec = userDao.insert(user);
            if (rec > 0) {
                //注册成功后，赋予用户默认权限
                User userrole = userDao.findByUserName(user);
                if (user.getRole() != null && user.getRole().getId() != null) {
                    userrole.setRole(new Role(user.getRole().getId()));
                } else {
                    userrole.setRole(new Role(UserUtils.NORMAL_ROLE_ID));
                }
                userDao.setUserRole(userrole);
                return rec;
            } else {
                throw new MyException("注册失败，稍后再试");
            }
        } else {
            if (changePwd) {
                if (!user.getPassword().matches(CommonConstant.PASSWORD_REGEX)) {
                    throw new MyException("密码复杂度不够（须同时包含数字、字母和特殊字符）");
                }
                user.setPassword(SecurityUtils.getMD5(user.getPassword()));
            }
            user.setUpdateDate(new Date());
            return userDao.update(user);
        }
    }

    /**
     * 修改密码
     *
     * @param user
     * @param newPassword
     * @return
     */
    public int updatePassword(User user, String newPassword) {
        //验证输入完整性
        if (user == null || StringUtils.isBlank(user.getUsername()) || StringUtils.isBlank(user.getPassword())) {
            throw new MyException("请完善用户信息");
        }

        //首先验证用户是否存在；如用户存在，则验证旧密码是否输入正确
        String oldPwd = user.getPassword();
        User history = select(user.getUsername());
        if (history == null) {
            throw new MyException("该用户名不存在");
        } else {
            if (!(SecurityUtils.getMD5(oldPwd).equals(history.getPassword()))){
                throw new MyException("旧密码输入错误");
            }
        }

        //验证新密码输入完整
        if (StringUtils.isBlank(newPassword)) {
            throw new MyException("新密码不能为空");
        }

        //验证新密码复杂度
        if (!newPassword.matches(CommonConstant.PASSWORD_REGEX)) {
            throw new MyException("密码复杂度不够（须同时包含数字、字母和特殊字符）");
        }

        //使用MD5加密存储
        user.setPassword(SecurityUtils.getMD5(newPassword));
        user.setUpdateDate(new Date());
        return userDao.update(user);
    }

    public long getCount(User user) {
        Long count = userDao.getCount(user);
        return count == null?0:count;
    }

    public int delete(Integer userId) {
        int rec = userDao.deleteUserRole(userId);
        if (rec > 0) {
            return userDao.delete(userId);
        }
        return rec;
    }

    public int forbidden(Integer userId) {
        return userDao.forbidden(userId);
    }
}
