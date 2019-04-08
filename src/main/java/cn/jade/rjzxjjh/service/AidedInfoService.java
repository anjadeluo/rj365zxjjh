package cn.jade.rjzxjjh.service;

import cn.jade.rjzxjjh.mapper.AidedInfoMapper;
import cn.jade.rjzxjjh.mapper.ContributorMapper;
import cn.jade.rjzxjjh.model.AidedInfo;
import cn.jade.rjzxjjh.model.Contributor;
import cn.jade.rjzxjjh.model.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;


/**
 * Created by yhsk on 2018/5/14.
 */
@Service
public class AidedInfoService {

    @Autowired
    private AidedInfoMapper aidedInfoMapper;

    public List<AidedInfo> findList(AidedInfo aidedInfo) {
        if (aidedInfo != null && aidedInfo.getPage() != null) {
            Page page = aidedInfo.getPage();
            page.setCurrentPage(page.getCurrentPage() * page.getPageSize());
        }
        return aidedInfoMapper.findList(aidedInfo);
    }

    public long getCount(AidedInfo aidedInfo) {
        Long count = aidedInfoMapper.getCount(aidedInfo);
        return count == null?0:count;
    }

    public int delete(Integer id) {
        return aidedInfoMapper.delete(id);
    }

    public AidedInfo select(Integer id) {
        return aidedInfoMapper.selectByPrimaryKey(id);
    }

    public Integer save(AidedInfo aidedInfo) {
        if (aidedInfo != null && aidedInfo.getId() != null) {
            aidedInfo.preUpdate();
            return aidedInfoMapper.update(aidedInfo);
        } else {
            aidedInfo.preInsert();
            return aidedInfoMapper.insertSelective(aidedInfo);
        }
    }

    public List<Map<String, Object>> getMonthGroupData(){
        return aidedInfoMapper.getMonthGroupData();
    }
}
