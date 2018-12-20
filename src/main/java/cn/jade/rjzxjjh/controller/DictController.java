package cn.jade.rjzxjjh.controller;

import cn.jade.rjzxjjh.model.Page;
import cn.jade.rjzxjjh.model.Dict;
import cn.jade.rjzxjjh.service.DictService;
import cn.jade.rjzxjjh.service.DictService;
import cn.jade.rjzxjjh.utils.JsonUtils;
import cn.jade.rjzxjjh.utils.ResponseResult;
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
@RequestMapping("${rootPath}/dict")
public class DictController {

    private Logger logger = Logger.getLogger(DictController.class.getName());

    @Autowired
    private DictService dictService;

    /**
     * 用户角色管理
     * @param dict
     * @param model
     * @param request
     * @param response
     */
    @RequestMapping(value = "/list")
    public String list(Dict dict, Model model, HttpServletRequest request, HttpServletResponse response) {
        long count = dictService.getCount(dict);
        model.addAttribute("totalCount", count);
        return "dict/dictList";
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
        ResponseResult<List<Dict>> result = new ResponseResult();
        try {
            Page<Dict> page = new Page();
            page.setCurrentPage(currentPage);
            page.setPageSize(pageSize);
            Dict dict = new Dict();
            dict.setPage(page);

            List<Dict> dictList = dictService.findList(dict);
            result.setSuccess(true);
            result.setData(dictList);
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
     * @param dict
     * @param model
     * @param request
     * @param response
     * @return
     */
    @RequestMapping(value = "/edit")
    public String edit(Dict dict, Model model, HttpServletRequest request, HttpServletResponse response) {
        if (dict.getId() != null) {
            dict = dictService.selectByTypeIndex(dict);
        }
        model.addAttribute("dict", dict);
        return "dict/dictForm";
    }

    @RequestMapping(value = "/saveDict")
    @ResponseBody
    public void saveDict(Dict dict, Model model, HttpServletRequest request, HttpServletResponse response) {
        ResponseResult result = new ResponseResult();
        int rec = dictService.saveDict(dict);
        if (rec > 0) {
            result.setSuccess(true);
        } else {
            result.setSuccess(false);
        }
        JsonUtils.writeJson(result, request, response);
    }

    /**
     * 删除角色
     * @param dictId
     * @param request
     * @param response
     */
    @RequestMapping(value = "/delete")
    @ResponseBody
    public void delete(Integer dictId, HttpServletRequest request, HttpServletResponse response){
        ResponseResult result = new ResponseResult();
        int rec = dictService.delete(dictId);
        if (rec > 0) {
            result.setSuccess(true);
        } else {
            result.setSuccess(false);
        }
        JsonUtils.writeJson(result, request, response);
    }
}
