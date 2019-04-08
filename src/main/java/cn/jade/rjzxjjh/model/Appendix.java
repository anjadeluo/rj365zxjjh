package cn.jade.rjzxjjh.model;

public class Appendix extends BasicModel<Appendix> {

    private Integer id;

    private String appendixId;

    private String appendixPath;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getAppendixId() {
        return appendixId;
    }

    public void setAppendixId(String appendixId) {
        this.appendixId = appendixId == null ? null : appendixId.trim();
    }

    public String getAppendixPath() {
        return appendixPath;
    }

    public void setAppendixPath(String appendixPath) {
        this.appendixPath = appendixPath == null ? null : appendixPath.trim();
    }
}