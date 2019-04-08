package cn.jade.rjzxjjh.utils;

import cn.jade.rjzxjjh.mapper.LogMapper;
import cn.jade.rjzxjjh.model.Log;
import cn.jade.rjzxjjh.model.User;
import org.springframework.web.method.HandlerMethod;

import javax.servlet.http.HttpServletRequest;
import java.lang.reflect.Method;
import java.util.Date;
import java.util.Enumeration;

/**
 * 日志处理工具类
 */
public class LogUtils {

	public static final String ADMIN_PATH = "rj365zxjjh"; //后台访问地址

	private static LogMapper logDao = SpringContextHolder.getBean(LogMapper.class);

	/**
	 * 保存日志
	 */
	public static void saveLog(HttpServletRequest request, String title){
		saveLog(request, null, null, title);
	}
	
	/**
	 * 保存日志
	 */
	public static void saveLog(HttpServletRequest request, Object handler, Exception ex, String title){
	    User user = UserUtils.getCurrentUser();
		if (user != null && user.getId() != null){
			Log log = new Log();
			log.setTitle(title);
			log.setType(ex == null ? Log.TYPE_ACCESS : Log.TYPE_EXCEPTION);
			log.setRemoteAddr(StringUtils.getRemoteAddr(request));
			log.setUserAgent(request.getHeader("user-agent"));
			log.setRequestUri(request.getRequestURI());
			log.setParams(request.getParameterMap());
			log.setMethod(request.getMethod());
			log.setInterfaceUrl(request.getRequestURI());
			log.setUsername(user.getUsername());

			//获取方法名
			String methodName = "["+request.getRequestURI().split("/")[request.getRequestURI().split("/").length-1]+"] ";
			int operateType = 1;
			if (StringUtils.isNotBlank(methodName)){
				if (methodName.contains("insert") || methodName.contains("update")
				    || methodName.contains("save") || methodName.contains("edit") || methodName.contains("add")){
					operateType = 2;
				}else if (methodName.contains("delete")){
					operateType = 3;
				}else if (methodName.contains("login")){
					operateType = 0;
				}
			}
			log.setOperateType(operateType + "");   //操作类型 0：登录；1：查询；2：编辑数据；3：删除
			log.setOperateTime(DateUtils.formatDate(new Date(), "yyyy-MM-dd HH:mm:ss"));

			String condition = methodName;
			String paramName;
			String paramValue;
			Enumeration enumeration = request.getParameterNames();
			while (enumeration.hasMoreElements()) {
				paramName = (String) enumeration.nextElement();
				paramValue = request.getParameter(paramName);
				condition += paramName + ":" + paramValue + ",";
			}
			log.setOperateCondition(condition);

			// 异步保存日志
			if ("2".equals(log.getOperateType()) || "3".equals(log.getOperateType())) {
				new SaveLogThread(log, handler, ex).start();
			}
			/** 保存操作日志 --end */

		}
	}

	/**
	 * 保存日志线程
	 */
	public static class SaveLogThread extends Thread{
		
		private Log log;
		private Object handler;
		private Exception ex;
		
		public SaveLogThread(Log log, Object handler, Exception ex){
			super(SaveLogThread.class.getSimpleName());
			this.log = log;
			this.handler = handler;
			this.ex = ex;
		}

		@Override
		public void run() {
			// 获取日志标题
			if (StringUtils.isBlank(log.getTitle())){
				String permission = "";
				if (handler instanceof HandlerMethod){
					Method m = ((HandlerMethod)handler).getMethod();
					permission = m.getName();
				}
				log.setTitle(permission);
			}
			// 如果有异常，设置异常信息
			log.setException(ExceptionsUitls.getStackTraceAsString(ex));
			// 保存日志信息
			logDao.insert(log);
		}
	}

	/**
	 * 保存日志线程
	 */
	/*public static class SaveLogInfoThread extends Thread{

		private LogInfo logInfo;
		private Object handler;
		private Exception ex;

		public SaveLogInfoThread(LogInfo logInfo, Object handler, Exception ex){
			super(SaveLogThread.class.getSimpleName());
			this.logInfo = logInfo;
			this.handler = handler;
			this.ex = ex;
		}

		@Override
		public void run() {
			// 获取日志标题
			if (StringUtils.isBlank(logInfo.getTitle())){
				String permission = "";
				if (handler instanceof HandlerMethod){
					Method m = ((HandlerMethod)handler).getMethod();
					RequiresPermissions rp = m.getAnnotation(RequiresPermissions.class);
					permission = (rp != null ? StringUtils.join(rp.value(), ",") : "");
				}
				logInfo.setTitle(getMenuNamePath(logInfo.getInterfaceUrl(), permission));
			}
			// 如果有异常，设置异常信息
			logInfo.setEx(ExceptionsUitls.getStackTraceAsString(ex));
			// 如果无标题并无异常日志，则不保存信息
			if (StringUtils.isBlank(logInfo.getTitle()) && StringUtils.isBlank(logInfo.getEx())){
				return;
			}
			if (StringUtils.isBlank(logInfo.getEx())){
				logInfo.setOperateResult(1);
			} else {
				logInfo.setOperateResult(0);
			}
			// 保存日志信息
			logInfo.preInsert();
			logDao.insertLogInfo(logInfo);
		}
	}
*/
	/**
	 * 保存管理日志线程
	 */
	/*public static class SaveManagelogThread extends Thread{

		private Managelog managelog;
		private Object handler;
		private Exception ex;

		public SaveManagelogThread(Managelog managelog, Object handler, Exception ex){
			super(SaveLogThread.class.getSimpleName());
			this.managelog = managelog;
			this.handler = handler;
			this.ex = ex;
		}

		@Override
		public void run() {
			// 获取日志标题
			if (StringUtils.isBlank(managelog.getTitle())){
				String permission = "";
				if (handler instanceof HandlerMethod){
					Method m = ((HandlerMethod)handler).getMethod();
					RequiresPermissions rp = m.getAnnotation(RequiresPermissions.class);
					permission = (rp != null ? StringUtils.join(rp.value(), ",") : "");
				}
				managelog.setTitle(getMenuNamePath(managelog.getManageUrl(), permission));
			}
			// 如果有异常，设置异常信息
			managelog.setEx(ExceptionsUitls.getStackTraceAsString(ex));
			// 如果无标题并无异常日志，则不保存信息
			if (StringUtils.isBlank(managelog.getTitle()) && StringUtils.isBlank(managelog.getEx())){
				return;
			}
			if (StringUtils.isBlank(managelog.getEx())){
				managelog.setManageResult(1);
			} else {
				managelog.setManageResult(0);
			}
			// 保存日志信息
			managelog.preInsert();
			logDao.insertManagelog(managelog);
		}
	}
*/
	/**
	 * 获取菜单名称路径（如：系统设置-机构用户-用户管理-编辑）
	 */
	/*public static String getMenuNamePath(String requestUri, String permission){
		String href = StringUtils.substringAfter(requestUri, ConfigUtils.getAdminPath());
		@SuppressWarnings("unchecked")
		Map<String, String> menuMap = (Map<String, String>) CacheUtils.get(CACHE_MENU_NAME_PATH_MAP);
		if (menuMap == null){
			menuMap = Maps.newHashMap();
			List<Menu> menus = (List<Menu>) getCache(Cache.CACHE_MENU_ALL_LIST);
			if (menus == null || menus.size()<=0) {
				menus = menuDao.findAllList(new Menu());
				putCache(Cache.CACHE_MENU_ALL_LIST,menus);
			}
			   for (Menu menu : menus){
				// 获取菜单名称路径（如：系统设置-机构用户-用户管理-编辑）
				String namePath = "";
				if (menu.getParentIds() != null){
					List<String> namePathList = Lists.newArrayList();
					for (String id : StringUtils.split(menu.getParentIds(), ",")){
						if (Menu.getRootId().equals(id)){
							continue; // 过滤跟节点
						}
						for (Menu m : menus){
							if (m.getId().equals(id)){
								namePathList.add(m.getName());
								break;
							}
						}
					}
					namePathList.add(menu.getName());
					namePath = StringUtils.join(namePathList, "-");
				}
				// 设置菜单名称路径
				if (StringUtils.isNotBlank(menu.getUrl())){
					menuMap.put(menu.getUrl(), namePath);
				}else if (StringUtils.isNotBlank(menu.getPermission())){
					for (String p : StringUtils.split(menu.getPermission())){
						menuMap.put(p, namePath);
					}
				}

			}
			CacheUtils.put(CACHE_MENU_NAME_PATH_MAP, menuMap);
		}
		String menuNamePath = menuMap.get(href);
		if (menuNamePath == null){
			for (String p : StringUtils.split(permission)){
				menuNamePath = menuMap.get(p);
				if (StringUtils.isNotBlank(menuNamePath)){
					break;
				}
			}
			if (menuNamePath == null){
				return "";
			}
		}
		return menuNamePath;
	}
*/
	
}
