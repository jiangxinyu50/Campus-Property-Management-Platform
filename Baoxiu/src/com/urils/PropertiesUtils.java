package com.urils;

import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

/** 
* @author  LinShiqin: 
* @date 创建时间：2015年12月20日 上午9:31:58 
* @return 
*/  

public class PropertiesUtils {
	
	public static String getCvsFilePath() {
		String cvsFilePath = "";
		Properties prop = new Properties();
		InputStream in = Object.class.getResourceAsStream("/res.properties");
		try {
			prop.load(in);
			cvsFilePath = prop.getProperty("cvsFilePath").trim();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return cvsFilePath;
	}
}
