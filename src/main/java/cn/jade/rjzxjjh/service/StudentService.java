package cn.jade.rjzxjjh.service;

import cn.jade.rjzxjjh.mapper.StudentMapper;
import cn.jade.rjzxjjh.model.*;
import cn.jade.rjzxjjh.utils.StringUtils;
import cn.jade.rjzxjjh.utils.UserUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class StudentService {

    @Autowired
    private StudentMapper studentMapper;
    @Autowired
    private StudentBankInfoService studentBankInfoService;
    @Autowired
    private StudentGuardianService studentGuardianService;
    @Autowired
    private StudentSchoolInfoService studentSchoolInfoService;

    public List<Student> findList(Student student) {
        if (student != null && student.getPage() != null) {
            Page page = student.getPage();
            page.setCurrentPage(page.getCurrentPage() * page.getPageSize());
        }
        return studentMapper.findList(student);
    }

    public long getCount(Student student) {
        Long count = studentMapper.getCount(student);
        return count == null ? 0 : count;
    }

    public Student select(Student student) {
        return studentMapper.selectByPrimaryKey(student.getId());
    }

    public Student select(Integer studentId) {
        return studentMapper.selectByPrimaryKey(studentId);
    }

    public Student selectByUsername(String username) {
        return studentMapper.selectByUsername(username);
    }

    public int delete(Student student) {
        return studentMapper.deleteByPrimaryKey(student.getId());
    }

    public int delete(Integer id) {
        return studentMapper.deleteByPrimaryKey(id);
    }

    public Integer save(Student student) throws Exception {
        Integer studentId = studentMapper.getIdByUsername(UserUtils.getCurrentUser().getUsername());
        student.setId(studentId);
        if (studentId != null) {
            student.preUpdate();
            studentMapper.updateByPrimaryKeySelective(student);
        } else {
            student.preInsert();
            studentMapper.insertSelective(student);
            studentId = studentMapper.getIdByUsername(student.getUsername());
            student.setId(studentId);
        }

        return studentId;
    }

    public int save(StudentGuardian guardian) throws Exception {
        return studentGuardianService.save(guardian);
    }

    public int save(StudentSchoolInfo schoolInfo) throws Exception {
        return studentSchoolInfoService.save(schoolInfo);
    }

    public int save(StudentBankInfo bankInfo) throws Exception {
        return studentBankInfoService.save(bankInfo);
    }

    public List<StudentGuardian> selectGuardian(Student student) {
        return studentMapper.selectGuardian(student.getId());
    }

    public List<StudentGuardian> selectGuardian(Integer studentId) {
        return studentMapper.selectGuardian(studentId);
    }

    public List<StudentSchoolInfo> selectSchoolInfo(Student student) {
        return studentMapper.selectSchoolInfo(student.getId());
    }

    public List<StudentSchoolInfo> selectSchoolInfo(Integer studentId) {
        return studentMapper.selectSchoolInfo(studentId);
    }

    public StudentBankInfo selectBankInfo(Student student) {
        return studentMapper.selectBankInfo(student.getId());
    }

    public StudentBankInfo selectBankInfo(Integer studentId) {
        return studentMapper.selectBankInfo(studentId);
    }

    public int delete(Integer id, String itemType) {
        if ("SchoolInfo".equals(itemType)) {
            return studentSchoolInfoService.delete(id);
        }
        if ("Guardians".equals(itemType)) {
            return studentGuardianService.delete(id);
        }
        return -1;
    }
}
