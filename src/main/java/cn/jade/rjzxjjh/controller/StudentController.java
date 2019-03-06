package cn.jade.rjzxjjh.controller;

import cn.jade.rjzxjjh.model.Page;
import cn.jade.rjzxjjh.model.Student;
import cn.jade.rjzxjjh.service.StudentService;
import cn.jade.rjzxjjh.utils.JsonUtils;
import cn.jade.rjzxjjh.utils.ResponseResult;
import cn.jade.rjzxjjh.utils.StringUtils;
import cn.jade.rjzxjjh.utils.UserUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("${rootPath}/student")
public class StudentController {

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
     * 查看学生信息
     *
     * @param student
     * @param request
     * @param response
     */
    @RequestMapping(value = "/editInfo")
    @ResponseBody
    public void editInfo(Student student, HttpServletRequest request, HttpServletResponse response) {
        ResponseResult<Student> result = new ResponseResult();
        try {
            int rec = studentService.save(student);
            if (rec > 0) {
                result.setSuccess(true);
            } else {
                result.setSuccess(false);
            }
        } catch (Exception e) {
            result.setSuccess(false);
            result.setMessage("exception:" + e);
            logger.error("exception:", e);
        } finally {
            JsonUtils.writeJson(result, request, response);
        }
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
        if (StringUtils.isNotBlank(studentId)) {
            student = studentService.select(Integer.parseInt(studentId));
        } else {
            student = studentService.selectByUsername(UserUtils.getCurrentUser().getUsername());
        }
        model.addAttribute("student", student);

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
    public String saveStudent(Student student, Model model, HttpServletRequest request, HttpServletResponse response) {

        int rec = studentService.save(student);

        model.addAttribute("student", student);

        return "student/studentInfo";
    }
}
