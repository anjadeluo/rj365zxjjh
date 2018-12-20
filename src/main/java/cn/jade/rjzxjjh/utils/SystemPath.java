package cn.jade.rjzxjjh.utils;

import java.io.File;
import java.net.URLDecoder;

/**
 * @author wanye
 * @description 得到当前应用的系统路径
 */
public class SystemPath {

	public static String getSysPath() {
		String classPath = SystemPath.class.getClassLoader().getResource("/").getPath();
		String  separator= File.separator;
		String rootPath  = "";
		if("\\".equals(separator)){
			rootPath  = classPath.substring(1,classPath.indexOf("/WEB-INF/classes"));
			rootPath = rootPath.replace("/", "/")+"/";
		}
		if("/".equals(separator)){
			rootPath  = classPath.substring(0,classPath.indexOf("/WEB-INF/classes"));
			rootPath = rootPath.replace("\\", "/")+"/";
		}
		return rootPath;
	}

	public static String getClassPath() {
		String path = Thread.currentThread().getContextClassLoader()
				.getResource("").toString();
		String temp = path.replaceFirst("file:/", "");
		String separator = System.getProperty("file.separator");
		String resultPath = temp.replaceAll("/", separator + separator);
		String  resultPath_;
		try {
			resultPath_ = URLDecoder.decode(resultPath, "utf-8");
			return resultPath_;
		} catch (Exception e) {
			e.printStackTrace();
			return resultPath;
		}
	}

	public static String getSystempPath() {
		return System.getProperty("java.io.tmpdir");
	}

	public static String getSeparator() {
		return System.getProperty("file.separator");
	}

	public static void main(String[] args) {
		System.out.println(getSysPath());
		System.out.println(System.getProperty("java.io.tmpdir"));
		System.out.println(getSeparator());
		System.out.println(getClassPath());
	}
}
