package cn.jade.rjzxjjh.controller;

import cn.jade.rjzxjjh.exception.MyException;
import cn.jade.rjzxjjh.model.Page;
import cn.jade.rjzxjjh.model.User;
import cn.jade.rjzxjjh.service.UserService;
import cn.jade.rjzxjjh.utils.AuthUtils;
import cn.jade.rjzxjjh.utils.JsonUtils;
import cn.jade.rjzxjjh.utils.ResponseResult;
import cn.jade.rjzxjjh.utils.UserUtils;
import org.apache.commons.lang3.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * Created by luoanyu on 2018/05/24.
 * 用户管理
 */
@Controller
@RequestMapping("${rootPath}/user")
public class UserController {

    private Logger logger = Logger.getLogger(UserController.class.getName());

    @Autowired
    UserService userService;

    /**
     * 用户列表入口
     *
     * @param user
     * @param model
     * @param request
     * @param response
     * @return
     */
    @RequestMapping(value = "/list")
    public String list(User user, Model model, HttpServletRequest request, HttpServletResponse response) {
        long count = userService.getCount(user);
        model.addAttribute("totalCount", count);
        return "user/userList";
    }

    /**
     * 获取用户列表信息
     *
     * @param user
     * @param currentPage
     * @param pageSize
     * @param request
     * @param response
     */
    @RequestMapping(value = "/getListData")
    public void getListData(User user, Integer currentPage, Integer pageSize, HttpServletRequest request, HttpServletResponse response) {
        ResponseResult<List<User>> result = new ResponseResult<List<User>>();
        try {
            Page<User> page = new Page();
            page.setCurrentPage(currentPage);
            page.setPageSize(pageSize);
            user = user == null ? user = new User() : user;
            user.setPage(page);

            List<User> userList = userService.findList(user);
            result.setSuccess(true);
            result.setData(userList);
        } catch (Exception e) {
            result.setSuccess(false);
            result.setMessage("exception:" + e);
            logger.error("exception:", e);
        }
        JsonUtils.writeJson(result, request, response);
    }

    /**
     * 添加用户
     *
     * @param user
     * @param model
     * @param request
     * @param response
     * @return
     */
    @RequestMapping(value = "/edit")
    public String edit(User user, Model model, HttpServletRequest request, HttpServletResponse response) {
        if (user != null && StringUtils.isNotBlank(user.getUsername())) {
            user = userService.select(user.getUsername());
        }
        model.addAttribute("user", user);
        return "user/userForm";
    }

    /**
     * 查看用户信息
     *
     * @param username
     * @param request
     * @param response
     */
    @RequestMapping(value = "/info")
    @ResponseBody
    public void info(String username, HttpServletRequest request, HttpServletResponse response) {
        ResponseResult<User> result = new ResponseResult<User>();
        try {
            User user = null;
            String currentUser = AuthUtils.getAuthorizedUser();
            if (StringUtils.equals(currentUser, username)) {
                user = (User) AuthUtils.getAuthentication().getPrincipal();
            } else {
                user = userService.select(username);
            }
            result.setSuccess(true);
            result.setData(user);
        } catch (Exception e) {
            result.setSuccess(false);
            result.setMessage("exception:" + e);
            logger.error("exception:", e);
        }
        JsonUtils.writeJson(result, request, response);
    }

    /**
     * 查看用户信息
     *
     * @param username
     * @param request
     * @param response
     */
    @RequestMapping(value = "/getByUsername")
    @ResponseBody
    public void getByUsername(String username, HttpServletRequest request, HttpServletResponse response) {
        ResponseResult<User> result = new ResponseResult();
        try {
            User user = userService.select(username);
            if (user != null) {
                result.setSuccess(true);
            } else {
                result.setSuccess(false);
            }
        } catch (Exception e) {
            result.setSuccess(false);
            result.setMessage("exception:" + e);
            logger.error("exception:", e);
        } finally {
            JsonUtils.writeJson(result, request, response);
        }
    }

    /**
     * 删除用户
     *
     * @param userId
     * @param request
     * @param response
     */
    @RequestMapping(value = "/delete")
    @ResponseBody
    public void delete(Integer userId, HttpServletRequest request, HttpServletResponse response) {
        ResponseResult result = new ResponseResult();
        int rec = userService.delete(userId);
        if (rec > 0) {
            result.setSuccess(true);
        } else {
            result.setSuccess(false);
        }
        JsonUtils.writeJson(result, request, response);
    }

    /**
     * 禁用用户
     *
     * @param userId
     * @param request
     * @param response
     */
    @RequestMapping(value = "/forbiddenUser")
    @ResponseBody
    public void forbiddenUser(Integer userId, HttpServletRequest request, HttpServletResponse response) {
        ResponseResult result = new ResponseResult();
        int rec = userService.forbidden(userId);
        if (rec > 0) {
            result.setSuccess(true);
        } else {
            result.setSuccess(false);
        }
        JsonUtils.writeJson(result, request, response);
    }

    /**
     * 设置用户角色
     *
     * @param userId
     * @param newRole
     * @param request
     * @param response
     */
    @RequestMapping(value = "/setRole")
    @ResponseBody
    public void setRole(Integer userId, String newRole, HttpServletRequest request, HttpServletResponse response) {
        ResponseResult<User> result = new ResponseResult<User>();
        try {
            int rec = userService.updateRoleByUserId(userId);
            result.setSuccess(true);
        } catch (Exception e) {
            result.setSuccess(false);
            result.setMessage("exception:" + e);
            logger.error("exception:", e);
        }
        JsonUtils.writeJson(result, request, response);
    }

    /**
     * 设置用户角色
     *
     * @param userId
     * @param username
     * @param request
     * @param response
     */
    @RequestMapping(value = "/getRole")
    @ResponseBody
    public void getRole(Integer userId, String username, HttpServletRequest request, HttpServletResponse response) {
        ResponseResult<User> result = new ResponseResult<User>();
        try {
            int rec = userService.updateRoleByUserId(userId);
            result.setSuccess(true);
        } catch (Exception e) {
            result.setSuccess(false);
            result.setMessage("exception:" + e);
            logger.error("exception:", e);
        }
        JsonUtils.writeJson(result, request, response);
    }

    /**
     * 注册用户
     *
     * @param user
     * @param roleId
     * @param request
     * @param response
     */
    @RequestMapping(value = "/regeditUser")
    @ResponseBody
    public void regeditUser(User user, Integer roleId, boolean changePwd, HttpServletRequest request, HttpServletResponse response) {
        ResponseResult result = new ResponseResult();
        try {
            userService.regeditUser(user, roleId, changePwd);
            result.setSuccess(true);
            result.setMessage("注册成功");
        } catch (MyException e) {
            result.setSuccess(false);
            result.setMessage(e.getMessage());
            e.printStackTrace();
        } catch (Exception e) {
            result.setSuccess(false);
            result.setMessage("注册失败，请稍后再试");
            e.printStackTrace();
        } finally {
            JsonUtils.writeJson(result, request, response);
        }
    }

    /**
     * 用户注册入口
     *
     * @param user
     * @param model
     * @param request
     * @param response
     * @return
     */
    @RequestMapping(value = "/toRegeditUser")
    public String toRegeditUser(User user, Model model, HttpServletRequest request, HttpServletResponse response) {
        return "user/userForm";
    }

    /**
     * 修改密码
     *
     * @param user
     * @param request
     * @param response
     */
    @RequestMapping(value = "/updatepwd")
    @ResponseBody
    public void updatepwd(User user, String newPassword, HttpServletRequest request, HttpServletResponse response) {
        ResponseResult result = new ResponseResult();
        try {
            userService.updatePassword(user, newPassword);
            result.setSuccess(true);
            result.setMessage("修改成功");
        } catch (MyException e) {
            result.setSuccess(false);
            result.setMessage(e.getMessage());
            e.printStackTrace();
        } catch (Exception e) {
            result.setSuccess(false);
            result.setMessage("修改失败，请稍后再试");
            e.printStackTrace();
        } finally {
            JsonUtils.writeJson(result, request, response);
        }
    }
}
