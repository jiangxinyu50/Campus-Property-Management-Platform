package com.test.web.info;

import java.sql.DriverManager;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.PreparedStatement;
import com.mysql.jdbc.Statement;
import com.test.web.entity.Tongzhi;

public class News {

	public static boolean addTongzhi(String tztit, String tzbody) { // 增加通知
		boolean flag = false;
		int i = 0;
		try {
			Connection conn = Create.getConn();

			String sql = "insert into tongzhi (tztitle,tzbody) values(?,?)";

			PreparedStatement pstmt = null;

			pstmt = (PreparedStatement) conn.prepareStatement(sql);

			pstmt.setString(1, tztit);
			pstmt.setString(2, tzbody);

			i = pstmt.executeUpdate();

			conn.close();
			pstmt.close();

			if (i == 1) {
				flag = true;
			}

		} catch (Exception e) {

		}
		return flag;
	}

	public static boolean deleTongzhi(String title) { // 删除通知
		boolean flag = false;
		int i = 0;
		try {
			Connection conn = Create.getConn();

			String sql = "delete from tongzhi where tztitle='" + title + "'";

			PreparedStatement pstmt = null;

			pstmt = (PreparedStatement) conn.prepareStatement(sql);

			i = pstmt.executeUpdate();

			conn.close();
			pstmt.close();

			if (i == 1) {
				flag = true;
			}

		} catch (Exception e) {

		}
		return flag;
	}

	public static List selectTitle() { // 查询(只查询标题)
		boolean flag = false;
		List<String> titleList = new ArrayList<String>();
		int u = 0;
		try {

			Connection con = Create.getConn();

			Statement st = (Statement) con.createStatement();// 创建sql执行对象
			ResultSet rs = st.executeQuery("SELECT * FROM tongzhi");

			while (rs.next()) {
				String str = new String();
				str = rs.getString("tztitle");
				titleList.add(str);
			}
			rs.close();
			con.close();

		} catch (Exception e) {
			System.out.println("查找失败!");
		}
		return titleList;
	}
	
	public static List selectByTitle(String title) { // 查询2(通过标题查询到内容)
		List<Tongzhi> titleList = new ArrayList<Tongzhi>();
		try {

			Connection con = Create.getConn();

			Statement st = (Statement) con.createStatement();// 创建sql执行对象
			ResultSet rs = st.executeQuery("SELECT * FROM tongzhi where tztitle='"+title+"'");

			while (rs.next()) {
				Tongzhi str = new Tongzhi();
				str.setTztitle(rs.getString("tztitle"));
				str.setTzbody(rs.getString("tzbody"));
				titleList.add(str);
			}
			System.out.println(titleList.get(0).getTzbody());
			rs.close();
			con.close();

		} catch (Exception e) {
			System.out.println("查找失败!");
		}
		return titleList;
	}
	
/*	public static void main(String[] args) {
		List<String> k = News.selectByTitle("今明将断水两天");


	}*/
}
