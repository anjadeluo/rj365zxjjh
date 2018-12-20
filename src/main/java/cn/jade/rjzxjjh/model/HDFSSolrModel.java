package cn.jade.rjzxjjh.model;

import org.apache.solr.client.solrj.beans.Field;

import java.util.Date;

/**
 * Created by yhsk on 2018/9/8.
 */
public class HDFSSolrModel {

    @Field
    private String id;
    @Field
    private String name;
    @Field
    private String path;
    @Field
    private String parent;
    @Field
    private boolean isDir;
    @Field
    private long fileLength;
    @Field
    private Date createDate;
    @Field
    private String keyword;
    @Field
    private String content;
    @Field
    private String dataType;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPath() {
        return path;
    }

    public void setPath(String path) {
        this.path = path;
    }

    public String getParent() {
        return parent;
    }

    public void setParent(String parent) {
        this.parent = parent;
    }

    public boolean isDir() {
        return isDir;
    }

    public void setDir(boolean dir) {
        isDir = dir;
    }

    public long getFileLength() {
        return fileLength;
    }

    public void setFileLength(long fileLength) {
        this.fileLength = fileLength;
    }

    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    public String getKeyword() {
        return keyword;
    }

    public void setKeyword(String keyword) {
        this.keyword = keyword;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getDataType() {
        return dataType;
    }

    public void setDataType(String dataType) {
        this.dataType = dataType;
    }
}
