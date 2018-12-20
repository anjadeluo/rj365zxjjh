package cn.jade.rjzxjjh.controller;

import cn.jade.rjzxjjh.exception.MyException;
import cn.jade.rjzxjjh.model.User;
import cn.jade.rjzxjjh.service.UserService;
import cn.jade.rjzxjjh.utils.UserUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Created by yhsk on 2017/7/27.
 * 用户统一认证
 */
@Controller
@RequestMapping("${rootPath}")
public class LoginController extends BaseController {

    @Autowired
    private UserService userService;

    /**
     * 用户登陆
     * <p>
     * 1. /login 登录页面的常规显示
     * 2. /login?error 登录验证失败的展示
     * 3. /login?logout 注销登录的处理
     *
     * @param error
     * @param logout
     * @return
     */
    @RequestMapping(value = "/loginPage")
    public String loginPage(@RequestParam(value = "error", required = false) String error,
                            @RequestParam(value = "logout", required = false) String logout,
                            Model model, HttpServletRequest request, HttpServletResponse response) {

        if (error != null) {
            model.addAttribute("msg", "用户名或密码错误，请重新输入");
        }

        if (logout != null) {
            model.addAttribute("msg", "成功退出系统");
        }

        return "login";
    }

    @RequestMapping(value = {"/", "/main"})
    public String main(Model model, HttpServletRequest request) {
        model.addAttribute("user", UserUtils.getCurrentUser());
        return "main";
    }

    @RequestMapping("/menu")
    public String menu(Model model, HttpServletRequest request) {
        model.addAttribute("user", UserUtils.getCurrentUser());
        return "mainbody";
    }
}
