package cn.jade.rjzxjjh.utils;

import java.util.Properties;

public class HDFSProperties extends Properties {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	{//初始化
		setOozieUseSystemLibPath(true);
	}

	public Object setProperty(String key, String value)
	{
		System.out.println("设置参数:" + key +" = " + value);
		return super.setProperty(key, value);
	}
	
	public void setJobTracker(String jobTracker)
	{
		setProperty("jobTracker", jobTracker);
	}
	
	public void setMapreduceJobUserName(String userName)
	{
		setProperty("mapreduce.job.user.name", userName);
	}
	
	public void setNameNode(String nameNode)
	{
		setProperty("nameNode", nameNode);	
	}
	
	private void setOozieUseSystemLibPath(boolean bvalue)
	{//这个的默认值是True
		
		if(bvalue)
			setProperty("oozie.use.system.libpath", "True");
		else
			setProperty("oozie.use.system.libpath", "False");
	}
	
	public void setUserName(String userName)
	{
		setProperty("user.name", userName);
	}
	
	public void setOozieServerURL(String oozieServerURL)
	{
		setProperty("oozieServerURL", oozieServerURL);
	}
	
	public String getOozieServerURL()
	{
		return getProperty("oozieServerURL");
	}
	
	public String getUserName()
	{
		return getProperty("user.name");
	}
	
	public Properties getProperties()
	{
		return this;
	}
	
	public static void main(String[] args) {
		//执行工作流需要用到的hdfs的参数
		String nameNode = "hdfs://nameservice1";
		String hadoop_user_name = "hdfs";//贵阳为hadoop
		String jobTracker = "hadoop1:8032";
		String oozieServerURL = "http://hadoop1:11000/oozie";
		
		HDFSProperties p = new HDFSProperties();
		
		p.setJobTracker(jobTracker);
		p.setMapreduceJobUserName(hadoop_user_name);
		p.setNameNode(nameNode);
		p.setOozieUseSystemLibPath(true);
		p.setUserName(hadoop_user_name);
		p.setOozieServerURL(oozieServerURL);
		
		String username = p.getProperty("user.name");
		System.out.println(username);
	}
	
}
