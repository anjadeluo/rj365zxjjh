package cn.jade.rjzxjjh.model;

public class BasicModel<T> {
    protected Page<T> page;

    public Page<T> getPage() {
        return page;
    }

    public void setPage(Page<T> page) {
        this.page = page;
    }
}
