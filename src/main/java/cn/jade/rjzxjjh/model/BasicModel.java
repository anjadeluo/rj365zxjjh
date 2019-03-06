package cn.jade.rjzxjjh.model;

import cn.jade.rjzxjjh.utils.UserUtils;

import java.util.Date;

public class BasicModel<T> {
    protected Page<T> page;
    public Page<T> getPage() {
        return page;
    }
    public void setPage(Page<T> page) {
        this.page = page;
    }

    private String username;
    private Date createDate;
    private Date updateDate;
    private String updateUser;
    private String updateReason;
    private String remarks;

    public void preInsert() {
        this.username = UserUtils.getCurrentUser().getUsername();
        this.createDate = new Date();
    }

    public void preUpdate() {
        this.updateUser = UserUtils.getCurrentUser().getUsername();
        this.updateDate = new Date();
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    public Date getUpdateDate() {
        return updateDate;
    }

    public void setUpdateDate(Date updateDate) {
        this.updateDate = updateDate;
    }

    public String getUpdateUser() {
        return updateUser;
    }

    public void setUpdateUser(String updateUser) {
        this.updateUser = updateUser;
    }

    public String getUpdateReason() {
        return updateReason;
    }

    public void setUpdateReason(String updateReason) {
        this.updateReason = updateReason;
    }

    public String getRemarks() {
        return remarks;
    }

    public void setRemarks(String remarks) {
        this.remarks = remarks;
    }
}
