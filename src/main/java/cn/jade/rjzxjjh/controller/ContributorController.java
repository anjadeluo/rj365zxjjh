package cn.jade.rjzxjjh.controller;

import cn.jade.rjzxjjh.exception.MyException;
import cn.jade.rjzxjjh.model.Contributor;
import cn.jade.rjzxjjh.model.Page;
import cn.jade.rjzxjjh.model.User;
import cn.jade.rjzxjjh.service.ContributorService;
import cn.jade.rjzxjjh.service.UserService;
import cn.jade.rjzxjjh.utils.AuthUtils;
import cn.jade.rjzxjjh.utils.JsonUtils;
import cn.jade.rjzxjjh.utils.ResponseResult;
import org.apache.commons.lang3.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by luoanyu on 2018/05/24.
 * 用户管理
 */
@Controller
@RequestMapping("${rootPath}/contributor")
public class ContributorController {

    private Logger logger = Logger.getLogger(ContributorController.class.getName());

    @Autowired
    ContributorService contributorService;

    /**
     * 列表入口
     *
     * @param contributor
     * @param model
     * @param request
     * @param response
     * @return
     */
    @RequestMapping(value = "/list")
    public String list(Contributor contributor, Model model, HttpServletRequest request, HttpServletResponse response) {
        long count = contributorService.getCount(contributor);
        model.addAttribute("totalCount", count);
        return "contributor/contributorList";
    }

    /**
     * 获取用户列表信息
     *
     * @param contributor
     * @param currentPage
     * @param pageSize
     * @param request
     * @param response
     */
    @RequestMapping(value = "/getListData")
    public void getListData(Contributor contributor, Integer currentPage, Integer pageSize, HttpServletRequest request, HttpServletResponse response) {
        ResponseResult<List<Contributor>> result = new ResponseResult<List<Contributor>>();
        try {
            Page<Contributor> page = new Page();
            page.setCurrentPage(currentPage);
            page.setPageSize(pageSize);
            contributor = contributor == null ? contributor = new Contributor() : contributor;
            contributor.setPage(page);

            List<Contributor> contributorList = contributorService.findList(contributor);
            result.setSuccess(true);
            result.setData(contributorList);
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
     * @param contributor
     * @param model
     * @param request
     * @param response
     * @return
     */
    @RequestMapping(value = "/editData")
    public String editData(Contributor contributor, Model model, HttpServletRequest request, HttpServletResponse response) {
        if (contributor != null && contributor.getId() != null) {
            contributor = contributorService.select(contributor.getId());
        }
        model.addAttribute("contributor", contributor);
        return "contributor/contributorForm";
    }

    /**
     * 保存信息
     *
     * @param contributor
     * @param request
     * @param response
     */
    @RequestMapping(value = "/save")
    @ResponseBody
    public Map<String, Object> save(@RequestBody Contributor contributor, HttpServletRequest request, HttpServletResponse response) {
        Map<String, Object> map = new HashMap();
        if (contributor == null) {
            map.put("success", false);
            map.put("msg", "提交信息不能为空！");
            return map;
        }
        try {
            contributorService.save(contributor);
            map.put("success", true);
            map.put("msg", "保存成功！");
        } catch (Exception e) {
            e.printStackTrace();
            map.put("success", false);
            map.put("msg", "保存失败！");
        }
        return map;
    }


    /**
     * 删除信息
     *
     * @param id
     * @param request
     * @param response
     */
    @RequestMapping(value = "/delete")
    @ResponseBody
    public void delete(Integer id, HttpServletRequest request, HttpServletResponse response) {
        ResponseResult result = new ResponseResult();
        int rec = contributorService.delete(id);
        if (rec > 0) {
            result.setSuccess(true);
            result.setMessage("删除成功");
        } else {
            result.setSuccess(false);
            result.setMessage("删除失败");
        }
        JsonUtils.writeJson(result, request, response);
    }
}