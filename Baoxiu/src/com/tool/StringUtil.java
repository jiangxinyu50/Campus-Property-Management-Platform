package com.tool;
/** 
* @author  LinShiqin: 
* @date 创建时间：2016年4月21日 上午9:20:45 
* @return  
*/
public class StringUtil {

	public static boolean strIsNotEmpty(String str){
		
		boolean flag = false;
		
		if(str != null && str.length()>0)
			flag = true;
		
		
		return flag;
	}
}
