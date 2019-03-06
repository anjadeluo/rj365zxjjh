package cn.jade.rjzxjjh.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Controller
@RequestMapping("${rootPath}/funding")
public class FundingController {
    @RequestMapping(value = "/application")
    public String index(Model model, HttpServletRequest request, HttpServletResponse response) {
        return "funding/application";
    }

}
