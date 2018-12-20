package cn.jade.rjzxjjh.mapper;

import cn.jade.rjzxjjh.model.User;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by yhsk on 2018/5/14.
 */
@Repository("userMapper")
public interface UserMapper {

    List<User> selectAll();

    List<User> findList(User user);

    User findByUserName(User user);

    int update(User user);

    User findByUserNameAndPwd(User user);

    int setUserRole(User user);

    int updateRoleByUserId(User user);

    int insert(User user);

    Long getCount(User user);

    int deleteUserRole(@Param("userId") Integer userId);

    int delete(@Param("userId") Integer userId);

    int forbidden(@Param("userId") Integer userId);
}
