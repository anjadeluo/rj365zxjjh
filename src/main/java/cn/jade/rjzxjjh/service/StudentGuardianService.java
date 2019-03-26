package cn.jade.rjzxjjh.service;

import cn.jade.rjzxjjh.mapper.StudentBankInfoMapper;
import cn.jade.rjzxjjh.mapper.StudentGuardianMapper;
import cn.jade.rjzxjjh.model.Student;
import cn.jade.rjzxjjh.model.StudentBankInfo;
import cn.jade.rjzxjjh.model.StudentGuardian;
import cn.jade.rjzxjjh.utils.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class StudentGuardianService {

    @Autowired
    private StudentGuardianMapper studentGuardianMapper;

    public int delete(StudentGuardian studentGuardian) {
        return studentGuardianMapper.deleteByPrimaryKey(studentGuardian.getId());
    }

    public int delete(Integer id) {
        return studentGuardianMapper.deleteByPrimaryKey(id);
    }

    public int save(StudentGuardian studentGuardian) {
        int result = 0;
        if (studentGuardian.getId() != null || StringUtils.isNotBlank(studentGuardian.getStrId())) {
            if (studentGuardian.getId() == null && StringUtils.isNotBlank(studentGuardian.getStrId())) {
                studentGuardian.setId(Integer.parseInt(studentGuardian.getStrId()));
            }
            studentGuardian.preUpdate();
            result = studentGuardianMapper.updateByPrimaryKeySelective(studentGuardian);
        } else {
            studentGuardian.preInsert();
            result = studentGuardianMapper.insertSelective(studentGuardian);
        }
        return result;
    }

    public int save(List<StudentGuardian> studentGuardianList) {
        int result = 0;

        if (studentGuardianList != null && studentGuardianList.size() > 0) {
            for (StudentGuardian studentGuardian : studentGuardianList) {
                result += save(studentGuardian);
            }
        }

        return result;
    }

    public StudentGuardian select(StudentGuardian studentGuardian) {
        return studentGuardianMapper.selectByPrimaryKey(studentGuardian.getId());
    }

    public int save(Student student) {
        int result = 0;
        if (student != null && student.getStudentGuardianList() != null && student.getStudentGuardianList().size() > 0) {
            for (StudentGuardian studentGuardian : student.getStudentGuardianList()) {
                studentGuardian.setStudentId(student.getId());
                result += save(studentGuardian);
            }
        }
        return result;
    }
}
