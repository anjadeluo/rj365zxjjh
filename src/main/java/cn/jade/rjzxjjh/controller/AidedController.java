package cn.jade.rjzxjjh.controller;

import cn.jade.rjzxjjh.model.AidedInfo;
import cn.jade.rjzxjjh.model.Page;
import cn.jade.rjzxjjh.service.AidedInfoService;
import cn.jade.rjzxjjh.utils.JsonUtils;
import cn.jade.rjzxjjh.utils.ResponseResult;
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
@RequestMapping("${rootPath}/aided")
public class AidedController {

    private Logger logger = Logger.getLogger(AidedController.class.getName());

    @Autowired
    AidedInfoService aidedService;

    /**
     * 列表入口
     *
     * @param aided
     * @param model
     * @param request
     * @param response
     * @return
     */
    @RequestMapping(value = "/list")
    public String list(AidedInfo aided, Model model, HttpServletRequest request, HttpServletResponse response) {
        long count = aidedService.getCount(aided);
        model.addAttribute("totalCount", count);
        return "aided/aidedList";
    }

    /**
     * 获取用户列表信息
     *
     * @param aided
     * @param currentPage
     * @param pageSize
     * @param request
     * @param response
     */
    @RequestMapping(value = "/getListData")
    public void getListData(AidedInfo aided, Integer currentPage, Integer pageSize, HttpServletRequest request, HttpServletResponse response) {
        ResponseResult<List<AidedInfo>> result = new ResponseResult<List<AidedInfo>>();
        try {
            Page<AidedInfo> page = new Page();
            page.setCurrentPage(currentPage);
            page.setPageSize(pageSize);
            aided = aided == null ? aided = new AidedInfo() : aided;
            aided.setPage(page);

            List<AidedInfo> aidedList = aidedService.findList(aided);
            result.setSuccess(true);
            result.setData(aidedList);
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
     * @param aided
     * @param model
     * @param request
     * @param response
     * @return
     */
    @RequestMapping(value = "/editData")
    public String editData(AidedInfo aided, Model model, HttpServletRequest request, HttpServletResponse response) {
        if (aided != null && aided.getId() != null) {
            aided = aidedService.select(aided.getId());
        }
        model.addAttribute("aided", aided);
        return "aided/aidedForm";
    }

    /**
     * 保存信息
     *
     * @param aided
     * @param request
     * @param response
     */
    @RequestMapping(value = "/save")
    @ResponseBody
    public Map<String, Object> save(@RequestBody AidedInfo aided, HttpServletRequest request, HttpServletResponse response) {
        Map<String, Object> map = new HashMap();
        if (aided == null) {
            map.put("success", false);
            map.put("msg", "提交信息不能为空！");
            return map;
        }
        try {
            aidedService.save(aided);
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
        int rec = aidedService.delete(id);
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