package com.test.web.info;

import java.sql.DriverManager;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.PreparedStatement;
import com.mysql.jdbc.Statement;
import com.test.web.entity.User;

public class Login {

	
	
	public static User login(String name, String psd) {

		User user = null;
		boolean flag = false;
		int aflag = 0;

		try {
			Connection con = Create.getConn();

			Statement st = (Statement) con.createStatement();// 创建sql执行对象

			ResultSet rs = st.executeQuery("SELECT * FROM admin");

			while (rs.next()) {
/*				System.out.println(rs.getString("adName") + "|||" + rs.getString("adPwd"));
				System.out.println(rs.getString("adState") + "|||" + rs.getString("adAuthor"));*/

				if (name.equals(rs.getString("adName")) && psd.equals(rs.getString("adPwd"))) {
					user = new User();
					user.setUserName(name);
					user.setUserPsw(psd);
					user.setUserAuthor(rs.getString("adAuthor"));
					user.setUserState("1");
					flag = true;
					break;
				}

			}
			if(flag){
			String sql = "update admin set adState ='" + "1" + "' where adName = '" + name + "' and  adPwd ='"
					+ psd + "'";
			PreparedStatement pstmt;
			pstmt = (PreparedStatement) con.prepareStatement(sql);
			pstmt.executeUpdate();
			pstmt.close();
			}
			con.close();
			st.close();
			rs.close();
			

		} catch (Exception e) {
			user = null;
		}

		return user;
	}
	
	public static void back(String name,String psd){//注销操作
		try{
			
			Connection con = Create.getConn();
			
			String sql = "update admin set adState ='0' where adName = '" + name + "' and  adPwd = '"
					+ psd + "'";
			PreparedStatement pstmt;
			pstmt = (PreparedStatement) con.prepareStatement(sql);
			pstmt.executeUpdate();

			con.close();
			pstmt.close();
			
		}catch(Exception e){
			
		}
	}
	public static boolean addAdmin(String name,String psd){ //增加管理员
		boolean flag = false;
		int i = 0;
		try{
			Connection conn = Create.getConn();
			
			String sql = "insert into admin (adName,adPwd,adAuthor,adState) values(?,?,?,?)";
			
			 PreparedStatement pstmt = null;
			 
			 pstmt = (PreparedStatement) conn.prepareStatement(sql);

			 
			 pstmt.setString(1, name);
			 pstmt.setString(2, psd);
			 pstmt.setString(3, "0");
			 pstmt.setString(4, "0");
			 
			 i = pstmt.executeUpdate();
			 
			 conn.close();
			 pstmt.close();
			 
			 if(i == 1){
				 flag =true;
			 }
			
			
		}catch(Exception e){
			
		}
		return flag;
	}
	public static boolean deleAdmin(String name){  //删除管理员
		boolean flag = false;
		int i = 0;
		try{
			Connection conn = Create.getConn();
			
			String sql = "delete from admin where adName='"+name+"'";
			
			System.out.println("name="+name);
			
			 PreparedStatement pstmt = null;
			 
			 pstmt = (PreparedStatement) conn.prepareStatement(sql);

			 i = pstmt.executeUpdate();
			 
			 conn.close();
			 pstmt.close();
			 
			 if(i == 1){
				 flag =true;
			 }
				
		}catch(Exception e){
			System.out.println("跳异常啦");
		}
		return flag;
	}
	public static boolean updatePsd(String name,String oldPsd,String newPsd){ //修改密码
		boolean flag = false;
		int u = 0;
		try{
			
            Connection con = Create.getConn();
			
			String sql = "update admin set adPwd='"+newPsd+"' where adName= '" + name + "' and  adPwd= '"+oldPsd+"'";
			PreparedStatement pstmt = null;
			pstmt = (PreparedStatement) con.prepareStatement(sql);
			 
			u = pstmt.executeUpdate();

			con.close();
			pstmt.close();
			
			 if(u == 1){
				 flag =true;
			 }
			
		}catch(Exception e){
			System.out.println("修改失败!错误:"+e);
		}
		return flag;
	}
	
	public static List selectName(){ //查询
		boolean flag = false;
		List<String> adMinNameList = new ArrayList<String>();
		int u = 0;
		try{
			
            Connection con = Create.getConn();
			
			String sql = "select adName from admin";
			Statement st = (Statement) con.createStatement();// 创建sql执行对象
			ResultSet rs = st.executeQuery("SELECT * FROM admin");
			
			while(rs.next()){
				String str = new String();
				str = rs.getString("adName");
				adMinNameList.add(str);
			}
			con.close();
			
			
		}catch(Exception e){
			System.out.println("查找失败!");
		}
		return adMinNameList;
	}
}
