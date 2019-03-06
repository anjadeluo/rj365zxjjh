package cn.jade.rjzxjjh.service;

import cn.jade.rjzxjjh.mapper.StudentSchoolInfoMapper;
import cn.jade.rjzxjjh.model.Student;
import cn.jade.rjzxjjh.model.StudentSchoolInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class StudentSchoolInfoService {

    @Autowired
    private StudentSchoolInfoMapper studentSchoolInfoMapper;

    public int delete(StudentSchoolInfo studentSchoolInfo) {
        return studentSchoolInfoMapper.deleteByPrimaryKey(studentSchoolInfo.getId());
    }

    public int delete(Integer id) {
        return studentSchoolInfoMapper.deleteByPrimaryKey(id);
    }

    public int save(StudentSchoolInfo studentSchoolInfo) {
        int result = 0;
        if (studentSchoolInfo.getId() != null) {
            studentSchoolInfo.preUpdate();
            result = studentSchoolInfoMapper.updateByPrimaryKeySelective(studentSchoolInfo);
        } else {
            studentSchoolInfo.preInsert();
            result = studentSchoolInfoMapper.insertSelective(studentSchoolInfo);
        }
        return result;
    }

    public int save(List<StudentSchoolInfo> StudentSchoolInfoList) {
        int result = 0;

        if (StudentSchoolInfoList != null && StudentSchoolInfoList.size() > 0) {
            for (StudentSchoolInfo studentSchoolInfo : StudentSchoolInfoList) {
                result += save(studentSchoolInfo);
            }
        }

        return result;
    }

    public int save(Student student) {
        int result = 0;
        if (student != null && student.getStudentSchoolInfoList() != null && student.getStudentSchoolInfoList().size() > 0) {
            for (StudentSchoolInfo studentSchoolInfo : student.getStudentSchoolInfoList()) {
                studentSchoolInfo.setStudentId(student.getId());
                result += save(studentSchoolInfo);
            }
        }
        return result;
    }

    public StudentSchoolInfo select(StudentSchoolInfo studentSchoolInfo) {
        return studentSchoolInfoMapper.selectByPrimaryKey(studentSchoolInfo.getId());
    }
}
