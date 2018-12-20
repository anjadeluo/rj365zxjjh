package cn.jade.rjzxjjh.mapper;

import cn.jade.rjzxjjh.model.Role;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by yhsk on 2018/5/17.
 */
@Repository("roleMapper")
public interface RoleMapper {

    List<Role> findPage(Role role);

    List<Role> findList();

    List<Role> findByUserId(@Param("userId") int userId);

    Long getCount(Role role);

    Role select(Role role);

    int delete(@Param("roleId") Integer roleId);

    int deleteUserRole(@Param("roleId") Integer roleId);

    Role getByRolename(@Param("name") String name);

    int update(Role role);

    int insert(Role role);
}
