package cn.jade.rjzxjjh.model;

import java.util.Date;

public class Dict {
    private Integer id;
    private String dictType;
    private String dictName;
    private String dictIndex;
    private String dictValue;
    private String dictDescription;
    private Boolean visibled;
    private String createUser;
    private Date createDate;
    private String updateUser;
    private Date updateDate;

    private Page<Dict> page;

    public Dict(){}

    public Dict(String dictType){
        this.dictType = dictType;
    }

    public Dict(String dictType, String dictName){
        this.dictType = dictType;
        this.dictName = dictName;
    }

    public Dict(String dictType, String dictName, String dictIndex){
        this.dictType = dictType;
        this.dictName = dictName;
        this.dictIndex = dictIndex;
    }

    public Dict(String dictType, String dictName, String dictIndex, String dictValue){
        this.dictType = dictType;
        this.dictName = dictName;
        this.dictIndex = dictIndex;
        this.dictValue = dictValue;
    }

    public Dict(Integer id) {
        this.id = id;
    }

    public Page<Dict> getPage() {
        return page;
    }

    public void setPage(Page<Dict> page) {
        this.page = page;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getDictType() {
        return dictType;
    }

    public void setDictType(String dictType) {
        this.dictType = dictType;
    }

    public String getDictName() {
        return dictName;
    }

    public void setDictName(String dictName) {
        this.dictName = dictName;
    }

    public String getDictIndex() {
        return dictIndex;
    }

    public void setDictIndex(String dictIndex) {
        this.dictIndex = dictIndex;
    }

    public String getDictValue() {
        return dictValue;
    }

    public void setDictValue(String dictValue) {
        this.dictValue = dictValue;
    }

    public String getDictDescription() {
        return dictDescription;
    }

    public void setDictDescription(String dictDescription) {
        this.dictDescription = dictDescription;
    }

    public Boolean getVisibled() {
        return visibled;
    }

    public void setVisibled(Boolean visibled) {
        this.visibled = visibled;
    }

    public String getCreateUser() {
        return createUser;
    }

    public void setCreateUser(String createUser) {
        this.createUser = createUser;
    }

    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    public String getUpdateUser() {
        return updateUser;
    }

    public void setUpdateUser(String updateUser) {
        this.updateUser = updateUser;
    }

    public Date getUpdateDate() {
        return updateDate;
    }

    public void setUpdateDate(Date updateDate) {
        this.updateDate = updateDate;
    }
}
