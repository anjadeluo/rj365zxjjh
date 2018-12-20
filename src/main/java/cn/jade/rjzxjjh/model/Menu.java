package cn.jade.rjzxjjh.model;

/**
 * Created by yhsk on 2018/5/17.
 */
public class Menu {

    private String id;
    //权限名称
    private String name;
    //等级
    private Integer level;
    //权限标识
    private String authority;
    //权限描述
    private String description;
    //授权链接
    private String url;
    //请求方式
    private String method;
    //是否可见
    private String visible;
    //父节点id
    private String pid;
    //菜单类型（0-业务菜单，1-功能菜单）
    private String menuType;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getPid() {
        return pid;
    }

    public void setPid(String pid) {
        this.pid = pid;
    }

    public String getMenuType() {
        return menuType;
    }

    public void setMenuType(String menuType) {
        this.menuType = menuType;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getAuthority() {
        return authority;
    }

    public void setAuthority(String authority) {
        this.authority = authority;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public Integer getLevel() {
        return level;
    }

    public void setLevel(Integer level) {
        this.level = level;
    }

    public String getMethod() {
        return method;
    }

    public void setMethod(String method) {
        this.method = method;
    }

    public String getVisible() {
        return visible;
    }

    public void setVisible(String visible) {
        this.visible = visible;
    }
}
