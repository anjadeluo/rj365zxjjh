package cn.jade.rjzxjjh.controller;

import cn.jade.rjzxjjh.model.Page;
import cn.jade.rjzxjjh.model.Role;
import cn.jade.rjzxjjh.service.RoleService;
import cn.jade.rjzxjjh.utils.JsonUtils;
import cn.jade.rjzxjjh.utils.ResponseResult;
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
 * Created by luoanyu on 2018/04/21.
 *
 */
@Controller
@RequestMapping("${rootPath}/role")
public class RoleController {

    private Logger logger = Logger.getLogger(RoleController.class.getName());

    @Autowired
    private RoleService roleService;

    /**
     * 用户角色管理
     * @param role
     * @param model
     * @param request
     * @param response
     */
    @RequestMapping(value = "/list")
    public String list(Role role, Model model, HttpServletRequest request, HttpServletResponse response) {
        long count = roleService.getCount(role);
        model.addAttribute("totalCount", count);
        return "role/roleList";
    }

    /**
     * 获取角色列表数据
     * @param currentPage
     * @param pageSize
     * @param request
     * @param response
     */
    @RequestMapping(value = "/getListData")
    @ResponseBody
    public void getListData(Integer currentPage, Integer pageSize, HttpServletRequest request, HttpServletResponse response) {
        ResponseResult<List<Role>> result = new ResponseResult();
        try {
            Page<Role> page = new Page();
            page.setCurrentPage(currentPage);
            page.setPageSize(pageSize);
            Role role = new Role();
            role.setPage(page);

            List<Role> roleList = roleService.findList(role);
            result.setSuccess(true);
            result.setData(roleList);
        } catch (Exception e) {
            result.setSuccess(false);
            result.setMessage("exception:" + e);
            logger.error("exception:", e);
        }
        JsonUtils.writeJson(result, request, response);
    }


    /**
     * 添加角色
     *
     * @param role
     * @param model
     * @param request
     * @param response
     * @return
     */
    @RequestMapping(value = "/edit")
    public String edit(Role role, Model model, HttpServletRequest request, HttpServletResponse response) {
        if (role.getId() != null) {
            role = roleService.select(role);
        }
        model.addAttribute("role", role);
        return "role/roleForm";
    }

    @RequestMapping(value = "/saveRole")
    @ResponseBody
    public void saveRole(Role role, Model model, HttpServletRequest request, HttpServletResponse response) {
        ResponseResult result = new ResponseResult();
        int rec = roleService.saveRole(role);
        if (rec > 0) {
            result.setSuccess(true);
        } else {
            result.setSuccess(false);
        }
        JsonUtils.writeJson(result, request, response);
    }

    /**
     * 删除角色
     * @param roleId
     * @param request
     * @param response
     */
    @RequestMapping(value = "/delete")
    @ResponseBody
    public void delete(Integer roleId, HttpServletRequest request, HttpServletResponse response){
        ResponseResult result = new ResponseResult();
        int rec = roleService.delete(roleId);
        if (rec > 0) {
            result.setSuccess(true);
        } else {
            result.setSuccess(false);
        }
        JsonUtils.writeJson(result, request, response);
    }

    /**
     * 删除角色
     * @param name
     * @param request
     * @param response
     */
    @RequestMapping(value = "/getByRolename")
    @ResponseBody
    public void getByRolename(String name, HttpServletRequest request, HttpServletResponse response){
        ResponseResult result = new ResponseResult();
        int rec = roleService.getByRolename(name);
        if (rec > 0) {
            result.setSuccess(true);
        } else {
            result.setSuccess(false);
        }
        JsonUtils.writeJson(result, request, response);
    }

}
