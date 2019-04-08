package cn.jade.rjzxjjh.controller;

import cn.jade.rjzxjjh.exception.MyException;
import cn.jade.rjzxjjh.model.Menu;
import cn.jade.rjzxjjh.service.MenuService;
import cn.jade.rjzxjjh.utils.JsonUtils;
import cn.jade.rjzxjjh.utils.ResponseResult;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * 菜单管理
 *
 * @author luoanyu
 */
@Controller
@RequestMapping("${rootPath}/menu")
public class MenuController {

    private Logger logger = Logger.getLogger(MenuController.class.getName());

    @Autowired
    private MenuService menuService;

    @RequestMapping(value = "/list")
    public String list(Menu role, Model model, HttpServletRequest request, HttpServletResponse response) {
//        long count = menuService.getCount(role);
//        model.addAttribute("totalCount", count);
        return "menu/menuList";
    }

    /**
     * 获取菜单列表
     *
     * @param currentPage
     * @param request
     * @param response
     */
    @RequestMapping(value = "/getListData")
    @ResponseBody
    public void getListData(Integer currentPage, HttpServletRequest request, HttpServletResponse response) {
        ResponseResult result = new ResponseResult();
        try {
            List<Menu> list = menuService.getAllMenu();
            result.setData(list);
            result.setSuccess(true);
            result.setMessage("获取菜单成功");
        } catch (Exception e) {
            result.setSuccess(false);
            result.setMessage("系统繁忙，请稍后再试");
            logger.error("exception:", e);
        } finally {
            JsonUtils.writeJson(result, request, response);
        }
    }


    /**
     * 添加角色
     *
     * @param menu
     * @param model
     * @param request
     * @param response
     * @return
     */
    @RequestMapping(value = "/edit")
    public String edit(Menu menu, Model model, HttpServletRequest request, HttpServletResponse response) {
        if (menu.getId() != null) {
            menu = menuService.select(menu);
        }
        model.addAttribute("menu", menu);
        return "menu/menuForm";
    }


    @RequestMapping(value = "/saveMenu")
    @ResponseBody
    public void saveMenu(Menu menu, HttpServletRequest request, HttpServletResponse response) {
        ResponseResult result = new ResponseResult();

        try {
            int rec = menuService.save(menu);
            result.setSuccess(true);
            result.setMessage("保存成功！");
        } catch (MyException e) {
            result.setSuccess(false);
            result.setMessage(e.getMessage());
        } catch (Exception e) {
            result.setSuccess(false);
            result.setMessage("系统繁忙，请稍后再试");
        } finally {
            JsonUtils.writeJson(result, request, response);
        }
    }


    /**
     * 获取所有菜单列表
     *
     * @param request
     * @param response
     */
    @RequestMapping(value = "/listAll")
    @ResponseBody
    public void listAll(HttpServletRequest request, HttpServletResponse response) {
        ResponseResult result = new ResponseResult();
        try {
            List<Menu> list = menuService.getAllMenu();
            result.setData(list);
            result.setSuccess(true);
            result.setMessage("获取菜单成功");
        } catch (Exception e) {
            result.setSuccess(false);
            result.setMessage("系统繁忙，请稍后再试");
            logger.error("exception:", e);
        } finally {
            JsonUtils.writeJson(result, request, response);
        }
    }

    /**
     * 获取所有菜单列表
     *
     * @param request
     * @param response
     */
    @RequestMapping(value = "/insert")
    @ResponseBody
    public void insert(Menu menu, HttpServletRequest request, HttpServletResponse response) {
        ResponseResult result = new ResponseResult();
        try {
            int rec = menuService.insert(menu);
            if (rec > 0) {
                result.setMessage("添加成功");
                result.setSuccess(true);
            } else {
                result.setMessage("添加失败");
                result.setSuccess(false);
            }
        } catch (Exception e) {
            result.setSuccess(false);
            result.setMessage("系统繁忙，请稍后再试");
            logger.error("exception:", e);
        } finally {
            JsonUtils.writeJson(result, request, response);
        }
    }

    /**
     * 获取所有菜单列表
     *
     * @param request
     * @param response
     */
    @RequestMapping(value = "/update")
    @ResponseBody
    public void update(Menu menu, HttpServletRequest request, HttpServletResponse response) {
        ResponseResult result = new ResponseResult();
        try {
            int rec = menuService.update(menu);
            if (rec > 0) {
                result.setMessage("修改成功");
                result.setSuccess(true);
            } else {
                result.setMessage("修改失败");
                result.setSuccess(false);
            }
        } catch (Exception e) {
            result.setSuccess(false);
            result.setMessage("系统繁忙，请稍后再试");
            logger.error("exception:", e);
        } finally {
            JsonUtils.writeJson(result, request, response);
        }
    }

    /**
     * 获取所有菜单列表
     *
     * @param request
     * @param response
     */
    @RequestMapping(value = "/delete")
    @ResponseBody
    public void delete(Menu menu, HttpServletRequest request, HttpServletResponse response) {
        ResponseResult result = new ResponseResult();
        try {
            int rec = menuService.delete(menu);
            if (rec == 0) {
                result.setMessage("参数不能为空");
                result.setSuccess(false);
            } else if (rec == 1) {
                result.setMessage("删除成功");
                result.setSuccess(true);
            } else if (rec == 2) {
                result.setMessage("请先移除下级菜单");
                result.setSuccess(false);
            } else {
                result.setMessage("删除失败");
                result.setSuccess(false);
            }
        } catch (Exception e) {
            result.setSuccess(false);
            result.setMessage("系统繁忙，请稍后再试");
            logger.error("exception:", e);
        } finally {
            JsonUtils.writeJson(result, request, response);
        }
    }
}
