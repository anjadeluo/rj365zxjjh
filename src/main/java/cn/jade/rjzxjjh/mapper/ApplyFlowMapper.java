package cn.jade.rjzxjjh.mapper;

import cn.jade.rjzxjjh.model.ApplyFlow;

import java.util.List;

public interface ApplyFlowMapper {

    int delete(Integer id);

    int insert(ApplyFlow record);

    ApplyFlow select(Integer id);

    int update(ApplyFlow record);

    List<ApplyFlow> findList(ApplyFlow applyFlow);

    Long findListCount(ApplyFlow applyFlow);

    ApplyFlow selectLastestApply(ApplyFlow applyFlow);

}