package cn.jade.rjzxjjh.mapper;

import cn.jade.rjzxjjh.model.Menu;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by yhsk on 2018/5/17.
 */
@Repository("menuMapper")
public interface MenuMapper {

    int insert(Menu menu);

    List<Menu> findAll();

    List<Menu> findByUserId(@Param("userId") int userId);

    int initSequenceMenuId(@Param("pid") String pid);

    int updateSequenceMenuId(@Param("pid") String pid);

    String getSequenceMenuId(@Param("pid") String pid);

    int update(Menu menu);

    int selectCountByPid(@Param("pid") String pid);

    int delete(Menu menu);

    long getCount(Menu role);

    Menu select(Menu menu);

    Menu selectByPidAndName(Menu menu);

    Menu selectByAuthority(Menu menu);
}
