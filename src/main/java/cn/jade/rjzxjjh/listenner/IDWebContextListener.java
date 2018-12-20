package cn.jade.rjzxjjh.listenner;

import cn.jade.rjzxjjh.utils.ConfigUtils;
import org.springframework.web.context.ContextLoaderListener;
import org.springframework.web.context.WebApplicationContext;

import javax.servlet.ServletContext;

/**
 * web启动监听类
 */
public class IDWebContextListener extends ContextLoaderListener {
	public static final String WEBAPPROOT = "webapp.root";
	@Override
	public WebApplicationContext initWebApplicationContext(ServletContext servletContext) {
		this.printSystemStartMessage();
		System.setProperty(WEBAPPROOT, servletContext.getRealPath("/"));
		return super.initWebApplicationContext(servletContext);
	}
	/**
	 * 获取Key加载信息
	 */
	public final void printSystemStartMessage(){
		ConfigUtils.getInstance(new String[]{"config.properties"});
		StringBuilder sb = new StringBuilder();
		sb.append("\r\n===========================================================================================================\r\n");
		sb.append("\r\n    欢迎使用 【" + ConfigUtils.getConfig("productName") + "】- Powered By 罗安玉  \r\n");
		sb.append("\r\n===========================================================================================================\r\n");
		System.out.println(sb.toString());
	}
}
