package cn.jade.rjzxjjh.service;

import cn.jade.rjzxjjh.mapper.ApplyFlowMapper;
import cn.jade.rjzxjjh.mapper.ContributorMapper;
import cn.jade.rjzxjjh.model.*;
import cn.jade.rjzxjjh.utils.StringUtils;
import cn.jade.rjzxjjh.utils.UserUtils;
import com.sun.corba.se.spi.ior.IdentifiableFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;


/**
 * Created by yhsk on 2018/5/14.
 */
@Service
public class ApplyFlowService {

    @Autowired
    private ApplyFlowMapper applyFlowMapper;
    @Autowired
    private StudentService studentService;

    public List<ApplyFlow> findList(ApplyFlow applyFlow) {
        if (applyFlow != null && applyFlow.getPage() != null) {
            Page page = applyFlow.getPage();
            page.setCurrentPage(page.getCurrentPage() * page.getPageSize());
        }
        return applyFlowMapper.findList(applyFlow);
    }

    public long getCount(ApplyFlow applyFlow) {
        Long count = applyFlowMapper.findListCount(applyFlow);
        return count == null ? 0 : count;
    }

    public int delete(Integer id) {
        return applyFlowMapper.delete(id);
    }

    public ApplyFlow select(Integer id) {
        return applyFlowMapper.select(id);
    }

    public Integer save(ApplyFlow applyFlow) {
        if (applyFlow != null && applyFlow.getId() != null) {
            return applyFlowMapper.update(applyFlow);
        } else {
            return applyFlowMapper.insert(applyFlow);
        }
    }

    public ApplyFlow selectLastestApply(ApplyFlow applyFlow) {
        User user = UserUtils.getCurrentUser();
        if (user == null || StringUtils.equalsIgnoreCase(user.getUsername(), UserUtils.SUPER_NAME)) {
            return null;
        }
        Student student = studentService.selectByUsername(user.getUsername());
        if (student == null) {
            return null;
        }
        applyFlow = applyFlow == null ? new ApplyFlow() : applyFlow;
        applyFlow.setStudentId(student.getId());
        applyFlow.setStudent(student);

        ApplyFlow applyFlow1 = applyFlowMapper.selectLastestApply(applyFlow);
        if (applyFlow1 == null) {
            student.setCurrentSchool(studentService.selectLatestSchool(student));
            return applyFlow;
        }

        applyFlow.getStudent().setCurrentSchool(applyFlow1.getStudent().getCurrentSchool());
        applyFlow1.setStudent(applyFlow.getStudent());

        return applyFlow1;
    }

}
