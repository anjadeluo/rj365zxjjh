package cn.jade.rjzxjjh.model;

import java.util.Date;

/**
 * Created by yhsk on 2018/5/16.
 */
public class Role {
    private Integer id;
    private String name;
    private String description;
    private Date createDate;

    private Integer userCount;
    private Integer menuCount;

    private Page<Role> page;

    public Role(){}
    public Role(Integer id){
        this.id = id;
    }
    public Role(Integer id, String name){
        this.id = id;
        this.name = name;
    }
    public Role(Integer id, String name, String description){
        this.id = id;
        this.name = name;
        this.description = description;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    public Integer getUserCount() {
        return userCount;
    }

    public void setUserCount(Integer userCount) {
        this.userCount = userCount;
    }

    public Integer getMenuCount() {
        return menuCount;
    }

    public void setMenuCount(Integer menuCount) {
        this.menuCount = menuCount;
    }

    public Page<Role> getPage() {
        return page;
    }

    public void setPage(Page<Role> page) {
        this.page = page;
    }
}
