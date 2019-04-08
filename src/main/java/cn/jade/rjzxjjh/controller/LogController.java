package cn.jade.rjzxjjh.controller;

import cn.jade.rjzxjjh.model.Contributor;
import cn.jade.rjzxjjh.model.Log;
import cn.jade.rjzxjjh.model.Page;
import cn.jade.rjzxjjh.service.ContributorService;
import cn.jade.rjzxjjh.service.LogService;
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
@RequestMapping("${rootPath}/log")
public class LogController {

    private Logger logger = Logger.getLogger(LogController.class.getName());

    @Autowired
    LogService logService;

    /**
     * 列表入口
     *
     * @param log
     * @param model
     * @param request
     * @param response
     * @return
     */
    @RequestMapping(value = "/list")
    public String list(Log log, Model model, HttpServletRequest request, HttpServletResponse response) {
        long count = logService.getCount(log);
        model.addAttribute("totalCount", count);
        return "log/logList";
    }

    /**
     * 获取用户列表信息
     *
     * @param log
     * @param currentPage
     * @param pageSize
     * @param request
     * @param response
     */
    @RequestMapping(value = "/getListData")
    public void getListData(Log log, Integer currentPage, Integer pageSize, HttpServletRequest request, HttpServletResponse response) {
        ResponseResult<List<Log>> result = new ResponseResult<List<Log>>();
        try {
            Page<Log> page = new Page();
            page.setCurrentPage(currentPage);
            page.setPageSize(pageSize);
            log = log == null ? log = new Log() : log;
            log.setPage(page);

            List<Log> logList = logService.findList(log);
            result.setSuccess(true);
            result.setData(logList);
        } catch (Exception e) {
            result.setSuccess(false);
            result.setMessage("exception:" + e);
            logger.error("exception:", e);
        }
        JsonUtils.writeJson(result, request, response);
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
        int rec = logService.delete(id);
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