package cn.jade.rjzxjjh.service;

import cn.jade.rjzxjjh.mapper.StudentBankInfoMapper;
import cn.jade.rjzxjjh.model.Student;
import cn.jade.rjzxjjh.model.StudentBankInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class StudentBankInfoService {

    @Autowired
    private StudentBankInfoMapper studentBankInfoMapper;

    public int delete(StudentBankInfo studentBankInfo) {
        return studentBankInfoMapper.deleteByPrimaryKey(studentBankInfo.getId());
    }

    public int delete(Integer id) {
        return studentBankInfoMapper.deleteByPrimaryKey(id);
    }

    public int save(StudentBankInfo studentBankInfo) {
        int result = 0;
        if (studentBankInfo.getId() != null) {
            studentBankInfo.preUpdate();
            result = studentBankInfoMapper.updateByPrimaryKeySelective(studentBankInfo);
        } else {
            studentBankInfo.preInsert();
            result = studentBankInfoMapper.insertSelective(studentBankInfo);
        }
        return result;
    }

    public StudentBankInfo select(StudentBankInfo studentBankInfo) {
        return studentBankInfoMapper.selectByPrimaryKey(studentBankInfo.getId());
    }

    public int save(Student student) {
        int result = 0;
        if (student != null && student.getStudentBankInfo() != null) {
            student.getStudentBankInfo().setStudentId(student.getId());
            result = save(student.getStudentBankInfo());
        }

        return result;
    }
}
