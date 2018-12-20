package cn.jade.rjzxjjh.controller;

import cn.jade.rjzxjjh.service.UserService;
import org.springframework.beans.factory.annotation.Value;

import javax.annotation.Resource;

/**
 * Created by yhsk on 2017/7/5.
 * 统一认证
 */
public abstract class BaseController {
    @Value("${rootPath}")
    protected String rootPath;
}
