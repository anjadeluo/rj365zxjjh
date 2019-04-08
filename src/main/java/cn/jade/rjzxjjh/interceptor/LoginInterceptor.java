package cn.jade.rjzxjjh.interceptor;

import cn.jade.rjzxjjh.model.User;
import cn.jade.rjzxjjh.utils.JsonUtils;
import cn.jade.rjzxjjh.utils.LogUtils;
import cn.jade.rjzxjjh.utils.ResponseResult;
import cn.jade.rjzxjjh.utils.SessionUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.core.NamedThreadLocal;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.text.SimpleDateFormat;

/**
 * 日志拦截器
 */
public class LoginInterceptor implements HandlerInterceptor {

    /**
     * 日志对象
     */
    protected Logger logger = LoggerFactory.getLogger(getClass());

    private static final ThreadLocal<Long> startTimeThreadLocal = new NamedThreadLocal<Long>("ThreadLocal StartTime");

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {

        String url = request.getRequestURI();
        if (logger.isDebugEnabled()) {
            long beginTime = System.currentTimeMillis();         //1、开始时间
            startTimeThreadLocal.set(beginTime);        //线程绑定变量（该数据只有当前请求的线程可见）
            logger.debug("开始计时: {}  URI: {}", new SimpleDateFormat("HH:mm:ss.SSS").format(beginTime), url);
        }
        return true;
    }

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
                           ModelAndView modelAndView) throws Exception {
        /*if (modelAndView != null){
			logger.info("ViewName: " + modelAndView.getViewName());
		}*/
    }

    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response,
                                Object handler, Exception ex) throws Exception {
        // 保存日志
        LogUtils.saveLog(request, handler, ex, null);
        // 打印JVM信息。
        if (logger.isDebugEnabled()) {
            long beginTime = startTimeThreadLocal.get();//得到线程绑定的局部变量（开始时间）
            long endTime = System.currentTimeMillis();    //2、结束时间
            logger.debug("计时结束：{}  耗时：{}  URI: {}",
                    new SimpleDateFormat("HH:mm:ss.SSS").format(endTime), new SimpleDateFormat("HH:mm:ss.SSS").format(endTime - beginTime),
                    request.getRequestURI());
        }
    }
}
