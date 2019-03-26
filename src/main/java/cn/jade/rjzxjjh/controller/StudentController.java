package cn.jade.rjzxjjh.controller;

import cn.jade.rjzxjjh.constant.CommonConstant;
import cn.jade.rjzxjjh.model.*;
import cn.jade.rjzxjjh.service.StudentService;
import cn.jade.rjzxjjh.utils.JsonUtils;
import cn.jade.rjzxjjh.utils.ResponseResult;
import cn.jade.rjzxjjh.utils.StringUtils;
import cn.jade.rjzxjjh.utils.UserUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("${rootPath}/student")
public class StudentController extends BaseController{

    private Logger logger = Logger.getLogger(UserController.class.getName());

    @Autowired
    private StudentService studentService;

    /**
     * 学生信息列表
     *
     * @param model
     * @param request
     * @param response
     * @return
     */
    @RequestMapping(value = "/list")
    public String list(Student student, Model model, HttpServletRequest request, HttpServletResponse response) {
        long count = studentService.getCount(student);
        model.addAttribute("totalCount", count);
        return "student/studentList";
    }

    /**
     * 获取学生信息列表数据
     *
     * @param request
     * @param response
     * @return
     */
    @RequestMapping(value = "/listData")
    @ResponseBody
    public void listData(Student student, Integer currentPage, Integer pageSize, HttpServletRequest request, HttpServletResponse response) {
        ResponseResult<List<Student>> result = new ResponseResult<List<Student>>();
        try {
            Page<Student> page = new Page();
            page.setCurrentPage(currentPage);
            page.setPageSize(pageSize);
            student = student == null ? student = new Student() : student;
            student.setPage(page);

            List<Student> userList = studentService.findList(student);
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
     * 个人信息详情
     *
     * @param studentId
     * @param request
     * @param response
     */
    @RequestMapping(value = "/studentInfo")
    public String studentInfo(String studentId, Model model, HttpServletRequest request, HttpServletResponse response) {
        Student student = null;
        String username = UserUtils.getCurrentUser().getUsername();
        if (StringUtils.isNotBlank(studentId)) {
            student = studentService.select(Integer.parseInt(studentId));
        } else {
            student = studentService.selectByUsername(username);
        }
        if (student != null) {
            StudentBankInfo studentBankInfo = studentService.selectBankInfo(student);
            model.addAttribute("studentBankInfo", studentBankInfo);
        }
        model.addAttribute("student", student);
        model.addAttribute("username", username);

        return "student/studentInfo";
    }

    /**
     * 保存个人信息
     *
     * @param student
     * @param request
     * @param response
     */
    @RequestMapping(value = "/saveStudent")
    @ResponseBody
    public Map<String, Object> saveStudent(@RequestBody Student student, HttpServletRequest request, HttpServletResponse response) {
        Map<String, Object> map = new HashMap();
        if (student == null) {
            map.put("success", false);
            map.put("msg", "提交信息不能为空！");
            return map;
        }
        try {
            Integer studentId = studentService.save(student);
            map.put("success", true);
            map.put("studentId", studentId);
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
     * @param itemType
     * @param request
     * @param response
     */
    @RequestMapping(value = "/deleteItem")
    @ResponseBody
    public Map<String, Object> deleteItem(Integer id, String itemType, HttpServletRequest request, HttpServletResponse response) {
        Map<String, Object> map = new HashMap();
        if (id == null) {
            map.put("success", false);
            map.put("msg", "请选择要删除的数据");
            return map;
        }
        if (!"SchoolInfo".equals(itemType) && !"Guardians".equals(itemType)) {
            map.put("success", false);
            map.put("msg", "删除的数据类型不对");
            return map;
        }
        try {
            studentService.delete(id, itemType);
            map.put("success", true);
            map.put("msg", "删除成功！");
        } catch (Exception e) {
            e.printStackTrace();
            map.put("success", false);
            map.put("msg", "删除失败！");
        }
        return map;
    }

    /**
     * 保存监护人信息
     *
     * @param guardian
     * @param request
     * @param response
     */
    @RequestMapping(value = "/saveStudentGuardian")
    @ResponseBody
    public Map<String, Object> saveStudentGuardian(@RequestBody StudentGuardian guardian, HttpServletRequest request, HttpServletResponse response) {
        Map<String, Object> map = new HashMap();
        if (guardian == null) {
            map.put("success", false);
            map.put("msg", "提交信息不能为空！");
            return map;
        }
        if (guardian.getStudentId() == null) {
            map.put("success", false);
            map.put("msg", "请先填写基础信息！");
            return map;
        }
        try {
            studentService.save(guardian);
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
     * 保存就学信息
     *
     * @param schoolInfo
     * @param request
     * @param response
     */
    @RequestMapping(value = "/saveStudentSchool")
    @ResponseBody
    public Map<String, Object> saveStudentSchool(@RequestBody StudentSchoolInfo schoolInfo, HttpServletRequest request, HttpServletResponse response) {
        Map<String, Object> map = new HashMap();
        if (schoolInfo == null) {
            map.put("success", false);
            map.put("msg", "提交信息不能为空！");
            return map;
        }
        if (schoolInfo.getStudentId() == null) {
            map.put("success", false);
            map.put("msg", "请先填写基础信息！");
            return map;
        }
        try {
            studentService.save(schoolInfo);
            map.put("success", true);
            map.put("msg", "保存成功！");
        } catch (Exception e) {
            map.put("success", false);
            map.put("msg", "保存失败！");
        }
        return map;
    }

    /**
     * 保存银行账户信息
     *
     * @param bankInfo
     * @param request
     * @param response
     */
    @RequestMapping(value = "/saveStudentBank")
    @ResponseBody
    public Map<String, Object> saveStudentBank(@RequestBody StudentBankInfo bankInfo, HttpServletRequest request, HttpServletResponse response) {
        Map<String, Object> map = new HashMap();
        if (bankInfo == null) {
            map.put("success", false);
            map.put("msg", "提交信息不能为空！");
            return map;
        }
        if (bankInfo.getStudentId() == null) {
            map.put("success", false);
            map.put("msg", "请先填写基础信息！");
            return map;
        }
        try {
            studentService.save(bankInfo);
            map.put("success", true);
            map.put("msg", "保存成功！");
        } catch (Exception e) {
            map.put("success", false);
            map.put("msg", "保存失败！");
        }
        return map;
    }

    /**
     * 获取监护人列表信息
     *
     * @param studentId
     * @param request
     * @param response
     */
    @RequestMapping(value = "/getGuardianListData")
    public void getGuardianListData(Integer studentId, HttpServletRequest request, HttpServletResponse response) {
        ResponseResult<List<StudentGuardian>> result = new ResponseResult<List<StudentGuardian>>();
        try {
            List<StudentGuardian> studentGuardianList = studentService.selectGuardian(studentId);
            result.setSuccess(true);
            result.setData(studentGuardianList);
        } catch (Exception e) {
            result.setSuccess(false);
            result.setMessage("exception:" + e);
            logger.error("exception:", e);
        }
        JsonUtils.writeJson(result, request, response);
    }

    /**
     * 获取就学信息列表
     *
     * @param studentId
     * @param request
     * @param response
     */
    @RequestMapping(value = "/getSchoolListData")
    public void getSchoolListData(Integer studentId, HttpServletRequest request, HttpServletResponse response) {
        ResponseResult<List<StudentSchoolInfo>> result = new ResponseResult<List<StudentSchoolInfo>>();
        try {
            List<StudentSchoolInfo> studentSchoolInfoList = studentService.selectSchoolInfo(studentId);
            result.setSuccess(true);
            result.setData(studentSchoolInfoList);
        } catch (Exception e) {
            result.setSuccess(false);
            result.setMessage("exception:" + e);
            logger.error("exception:", e);
        }
        JsonUtils.writeJson(result, request, response);
    }

    /**
     * 获取就学信息列表
     *
     * @param studentId
     * @param request
     * @param response
     */
    @RequestMapping(value = "/getBankData")
    public void getBankData(Integer studentId, HttpServletRequest request, HttpServletResponse response) {
        ResponseResult<StudentBankInfo> result = new ResponseResult<StudentBankInfo>();
        try {
            StudentBankInfo studentBankInfo = studentService.selectBankInfo(studentId);
            result.setSuccess(true);
            result.setData(studentBankInfo);
        } catch (Exception e) {
            result.setSuccess(false);
            result.setMessage("exception:" + e);
            logger.error("exception:", e);
        }
        JsonUtils.writeJson(result, request, response);
    }
}
