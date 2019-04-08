package cn.jade.rjzxjjh.controller;

import cn.jade.rjzxjjh.model.*;
import cn.jade.rjzxjjh.service.AidedInfoService;
import cn.jade.rjzxjjh.service.ApplyFlowService;
import cn.jade.rjzxjjh.service.ContributorService;
import cn.jade.rjzxjjh.service.StudentService;
import cn.jade.rjzxjjh.utils.*;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.*;

@Controller
@RequestMapping("${rootPath}/funding")
public class FundingController {

    private Logger logger = Logger.getLogger(FundingController.class.getName());

    @Autowired
    private ContributorService contributorService;
    @Autowired
    private AidedInfoService aidedInfoService;
    @Autowired
    private ApplyFlowService applyFlowService;
    @Autowired
    private StudentService studentService;

    /**
     * 查看申请信息
     *
     * @param model
     * @return
     */
    @RequestMapping(value = "/applicationInfo")
    public String applicationInfo(ApplyFlow applyFlow, Model model) {
        if (applyFlow != null && applyFlow.getId() != null) {
            applyFlow = applyFlowService.select(applyFlow.getId());
        }
        model.addAttribute("applyFlow", applyFlow);
        return "funding/applicationInfo";
    }

    /**
     * 编辑信息
     *
     * @param model
     * @return
     */
    @RequestMapping(value = "/editApplication")
    public String editApplication(ApplyFlow applyFlow, Model model) {
        if (applyFlow != null && applyFlow.getId() != null) {
            applyFlow = applyFlowService.select(applyFlow.getId());
        } else {
            applyFlow = applyFlowService.selectLastestApply(applyFlow);
        }

        model.addAttribute("applyFlow", applyFlow);
        return "funding/applicationForm";
    }

    /**
     * 进入审批列表
     *
     * @param applyFlow
     * @param model
     * @return
     */
    @RequestMapping(value = "/applicationList")
    public String applicationList(ApplyFlow applyFlow, Model model) {
        User user = UserUtils.getCurrentUser();
        long count = 0L;
        boolean canApply = false;
        String cannotMsg = "管理员无此操作";
        if (user != null && StringUtils.isNotBlank(user.getUsername()) && !UserUtils.SUPER_NAME.equals(user.getUsername())) {
            Student student = studentService.selectByUsername(user.getUsername());
            if (student != null) {
                applyFlow.setStudentId(student.getId());
                count = applyFlowService.getCount(applyFlow);

                StudentSchoolInfo ccrrentSchool = studentService.selectLatestSchool(student);
                if (ccrrentSchool != null) {
                    canApply = true;
                } else {
                    cannotMsg = "请先去个人信息中添加在读学校信息，再来申请";
                }
            } else {
                cannotMsg = "请先去完善个人信息，再来申请";
            }
        }

        model.addAttribute("canApply", canApply);
        model.addAttribute("cannotMsg", cannotMsg);
        model.addAttribute("totalCount", count);
        return "funding/applicationList";
    }

    /**
     * 获取列表数据
     *
     * @param applyFlow
     * @param currentPage
     * @param pageSize
     * @param request
     * @param response
     */
    @RequestMapping(value = "/getApplicationListData")
    public void getApplicationListData(ApplyFlow applyFlow, Integer currentPage, Integer pageSize, HttpServletRequest request, HttpServletResponse response) {
        ResponseResult<List<ApplyFlow>> result = new ResponseResult<List<ApplyFlow>>();
        try {
            Page<ApplyFlow> page = new Page();
            page.setCurrentPage(currentPage);
            page.setPageSize(pageSize);
            applyFlow = applyFlow == null ? applyFlow = new ApplyFlow() : applyFlow;
            applyFlow.setPage(page);


            User user = UserUtils.getCurrentUser();
            List<ApplyFlow> applyFlowList = new ArrayList<>();
            if (user != null && StringUtils.isNotBlank(user.getUsername()) && UserUtils.SUPER_NAME.equals(user.getUsername())) {
                Student student = studentService.selectByUsername(user.getUsername());
                applyFlow.setStudentId(student.getId());
                applyFlowList = applyFlowService.findList(applyFlow);
            }

            result.setSuccess(true);
            result.setData(applyFlowList);
        } catch (Exception e) {
            result.setSuccess(false);
            result.setMessage("exception:" + e);
            logger.error("exception:", e);
        }
        JsonUtils.writeJson(result, request, response);
    }

    /**
     * 申请历史列表
     *
     * @param applyFlow
     * @param model
     * @param request
     * @param response
     * @return
     */
    @RequestMapping(value = "/applicationHistory")
    public String applicationHistory(ApplyFlow applyFlow, Model model, HttpServletRequest request, HttpServletResponse response) {
        User user = UserUtils.getCurrentUser();
        long count = 0L;
        if (user != null && StringUtils.isNotBlank(user.getUsername())) {
            Student student = studentService.selectByUsername(user.getUsername());
            applyFlow.setStudentId(student.getId());
            count = applyFlowService.getCount(applyFlow);
        }
        model.addAttribute("totalCount", count);
        return "funding/applicationHistory";
    }

    /**
     * 获取历史列表数据
     *
     * @param applyFlow
     * @param currentPage
     * @param pageSize
     * @param request
     * @param response
     */
    @RequestMapping(value = "/getApplicationHistoryData")
    public void getApplicationHistoryData(ApplyFlow applyFlow, Integer currentPage, Integer pageSize, HttpServletRequest request, HttpServletResponse response) {
        ResponseResult<List<ApplyFlow>> result = new ResponseResult<List<ApplyFlow>>();
        try {
            Page<ApplyFlow> page = new Page();
            page.setCurrentPage(currentPage);
            page.setPageSize(pageSize);
            applyFlow = applyFlow == null ? applyFlow = new ApplyFlow() : applyFlow;
            applyFlow.setPage(page);

            User user = UserUtils.getCurrentUser();
            List<ApplyFlow> applyFlowList = new ArrayList<>();
            if (user != null && StringUtils.isNotBlank(user.getUsername())) {
                Student student = studentService.selectByUsername(user.getUsername());
                applyFlow.setStudentId(student.getId());
                applyFlowList = applyFlowService.findList(applyFlow);
            }
            result.setSuccess(true);
            result.setData(applyFlowList);
        } catch (Exception e) {
            result.setSuccess(false);
            result.setMessage("exception:" + e);
            logger.error("exception:", e);
        }
        JsonUtils.writeJson(result, request, response);
    }

    /**
     * 保存信息
     *
     * @param applyFlow
     * @param request
     * @param response
     */
    @RequestMapping(value = "/saveApplication")
    @ResponseBody
    public Map<String, Object> saveApplication(@RequestBody ApplyFlow applyFlow, HttpServletRequest request, HttpServletResponse response) {
        Map<String, Object> map = new HashMap();
        if (applyFlow == null) {
            map.put("success", false);
            map.put("msg", "提交信息不能为空！");
            return map;
        }
        try {
            applyFlowService.save(applyFlow);
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
    @RequestMapping(value = "/deleteApplication")
    @ResponseBody
    public void deleteApplication(Integer id, HttpServletRequest request, HttpServletResponse response) {
        ResponseResult result = new ResponseResult();
        try {
            applyFlowService.delete(id);
            result.setSuccess(true);
            result.setMessage("删除成功");
        } catch (Exception e) {
            result.setSuccess(false);
            result.setMessage("删除失败");
        }
        JsonUtils.writeJson(result, request, response);
    }

    /**
     * 首页资金流动情况曲线图
     *
     * @param request
     * @param response
     */
    @RequestMapping(value = "/getLineData")
    public void getLineData(HttpServletRequest request, HttpServletResponse response) {
        ResponseResult result = new ResponseResult();
        Map retMap = new HashMap();
        try {
            String[] xData = new String[12];
            double[][] seriesData = new double[2][12];
            List<Map<String, Object>> contributorData = contributorService.getMonthGroupData();
            List<Map<String, Object>> aidedData = aidedInfoService.getMonthGroupData();

            for (int i = 0; i < xData.length; i++) {
                xData[i] = DateUtils.getDateAddMonth(i - 11, "yyyy/MM");
                for (Map map : contributorData) {
                    if (xData[i].equals(map.get("month"))) {
                        seriesData[0][i] = Double.parseDouble(map.get("money").toString());
                        break;
                    }
                }
                for (Map map : aidedData) {
                    if (xData[i].equals(map.get("month"))) {
                        seriesData[1][i] = Double.parseDouble(map.get("money").toString());
                        break;
                    }
                }
            }
            retMap.put("xAxisData", xData);
            retMap.put("seriesData", seriesData);
            result.setData(retMap);
            result.setSuccess(true);
        } catch (Exception e) {
            result.setSuccess(false);
            result.setMessage("exception:" + e);
            logger.error("exception:", e);
        }
        JsonUtils.writeJson(result, request, response);
    }
}
