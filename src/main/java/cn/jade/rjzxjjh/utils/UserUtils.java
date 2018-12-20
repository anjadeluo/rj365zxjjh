package cn.jade.rjzxjjh.utils;

import cn.jade.rjzxjjh.model.Role;
import cn.jade.rjzxjjh.model.User;
import cn.jade.rjzxjjh.service.RoleService;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.FileSystemXmlApplicationContext;
import org.springframework.security.core.context.SecurityContextHolder;

import java.util.Date;
import java.util.List;

/**
 * Created by sang on 2017/12/30.
 */
public class UserUtils {

    public static final Integer NORMAL_ROLE_ID = 3;
    public static final String NORMAL_ROLE_NAME = "ROLE_USER";
    public static final String NORMAL_ROLE_DESCRIPTION = "普通用户";
    private static RoleService roleService = SpringContextHolder.getBean(RoleService.class);

    public static User getCurrentUser() {
        try {
            Object object = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
            if (object instanceof User) {
                return (User) object;
            }
        } catch (Exception e) {

        }
        return null;
    }

    public static List<Role> getRoleList() {
        return roleService.findList();
    }
}
