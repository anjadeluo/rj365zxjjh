package cn.jade.rjzxjjh.mapper;

import cn.jade.rjzxjjh.model.Student;
import cn.jade.rjzxjjh.model.StudentBankInfo;
import cn.jade.rjzxjjh.model.StudentGuardian;
import cn.jade.rjzxjjh.model.StudentSchoolInfo;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface StudentMapper {

    List<Student> findList(Student student);

    int deleteByPrimaryKey(Integer id);

    int insert(Student record);

    int insertSelective(Student record);

    Student selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Student record);

    int updateByPrimaryKey(Student record);

    Long getCount(Student student);

    Student selectByUsername(@Param("username") String username);

    Integer getIdByUsername(String username);

    List<StudentGuardian> selectGuardian(Integer id);

    List<StudentSchoolInfo> selectSchoolInfo(Integer id);

    StudentBankInfo selectBankInfo(Integer id);
}