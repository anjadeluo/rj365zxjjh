package cn.jade.rjzxjjh.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpUtils;

/**
 * Created by luoanyu on 2018/04/21.
 *
 */
@Controller
@RequestMapping("${rootPath}")
public class IndexController {

    /**
     * 首页
     * @param model
     * @param request
     * @param response
     */
    @RequestMapping(value = "/index")
    public String index(Model model, HttpServletRequest request, HttpServletResponse response) {
        return "index";
    }

    /**
     * 首页
     * @param request
     * @param response
     */
    @RequestMapping(value = "/index1")
    @ResponseBody
    public String index1(HttpServletRequest request, HttpServletResponse response) {
        String paramJson = request.getParameter("paramJson");
        String param2 = request.getParameter("param2");
        return paramJson;
    }
}
