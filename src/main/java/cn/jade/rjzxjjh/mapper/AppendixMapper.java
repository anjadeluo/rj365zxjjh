package cn.jade.rjzxjjh.mapper;

import cn.jade.rjzxjjh.model.Appendix;

import java.util.List;

public interface AppendixMapper {

    int delete(Integer id);

    int insert(Appendix record);

    Appendix select(Integer id);

    List<Appendix> selectByAppendixId(Appendix appendix);

    int update(Appendix record);
}