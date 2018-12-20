package cn.jade.rjzxjjh.mapper;

import cn.jade.rjzxjjh.model.Log;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("logMapper")
public interface LogMapper {

    List<Log> findList();

    /**
     * 删除日志
     * @param id
     * @return
     */
    public int deletelog(Integer id);

    /**
     * 批量删除日志
     * @param ids
     * @return
     */
    public int delLogs(Integer[] ids);

    /**
     * 定时执行删除一个月以前的日志
     * @return
     */
    public int deleteAMonthAgoLogs();

    /**
     *删除所有日志信息
     */
    public int deleteAllLog();

    /**
     * 保存日志
     * @param log
     * @return
     */
    public int insert(Log log);

}
