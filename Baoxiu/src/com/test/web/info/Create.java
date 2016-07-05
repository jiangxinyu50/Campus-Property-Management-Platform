package com.test.web.info;

import java.sql.DriverManager;

import com.mysql.jdbc.Connection;

public class Create {

	public static Connection getConn() {  //数据库连接

		Connection con = null;
		try {
			String url = "jdbc:mysql://localhost:3306/test";  //MySql的地址
			String username = "root";  //数据库用户名
			String password = "19941114";  //数据库密码
			Class.forName("com.mysql.jdbc.Driver");  //加载JDBC驱动
			con = (Connection) DriverManager.getConnection(url, username, password);  //进行数据库连接
		} catch (Exception e) {
			System.out.println("数据库连接失败,错误信息:"+e);
		}
		return con;
	}
}
