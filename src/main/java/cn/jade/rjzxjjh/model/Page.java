package cn.jade.rjzxjjh.model;

public class Page<T> {
    private Integer currentPage;
    private Integer PageSize = 20;
    private Integer totalPages;

    public Integer getCurrentPage() {
        return currentPage == null ? 0 : currentPage;
    }

    public void setCurrentPage(Integer currentPage) {
        this.currentPage = currentPage == null ? 0 : currentPage;
    }

    public Integer getPageSize() {
        return PageSize;
    }

    public void setPageSize(Integer pageSize) {
        PageSize = pageSize == null ? Integer.MAX_VALUE : pageSize;
    }

    public Integer getTotalPages() {
        return totalPages;
    }

    public void setTotalPages(Integer totalPages) {
        this.totalPages = totalPages;
    }
}
