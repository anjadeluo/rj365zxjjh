package cn.jade.rjzxjjh.mapper;

import cn.jade.rjzxjjh.model.Log;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("logMapper")
public interface LogMapper {

    List<Log> findAll();

    Log select(Integer id);

    List<Log> selectByUsername(Log log);

    int delete(Integer id);

    int insert(Log log);

    Long findAllCount();

    Long selectByUsernameCount(Log log);
}
