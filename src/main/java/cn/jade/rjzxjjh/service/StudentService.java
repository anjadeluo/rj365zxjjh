package cn.jade.rjzxjjh.service;

import cn.jade.rjzxjjh.mapper.StudentMapper;
import cn.jade.rjzxjjh.model.Page;
import cn.jade.rjzxjjh.model.Student;
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

    public int delete(Student student) {
        return studentMapper.deleteByPrimaryKey(student.getId());
    }

    public int delete(Integer id) {
        return studentMapper.deleteByPrimaryKey(id);
    }

    public int save(Student student) {
        int result = 0;
        Integer studentId = studentMapper.getIdByUsername(student.getUsername());
        student.setId(studentId);
        if (studentId != null) {
            student.preUpdate();
            result = studentMapper.updateByPrimaryKeySelective(student);
        } else {
            student.preInsert();
            result = studentMapper.insertSelective(student);
            studentId = studentMapper.getIdByUsername(student.getUsername());
            student.setId(studentId);
        }

        if (student.getStudentBankInfo() != null) {
            studentBankInfoService.save(student);
        }

        if (student.getStudentGuardianList() != null && student.getStudentGuardianList().size() > 0) {
            studentGuardianService.save(student);
        }

        if (student.getStudentSchoolInfoList() != null && student.getStudentSchoolInfoList().size() > 0) {
            studentSchoolInfoService.save(student);
        }
        return result;
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
}
