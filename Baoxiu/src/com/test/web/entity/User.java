package com.test.web.entity;

public class User {

	private String userName; /*管理员账号*/
	private String userPsw;  /*管理员密码*/
	private String userState;  /*管理员登录状态*/
	private String userAuthor;  /*管理员权限*/
	
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserPsw() {
		return userPsw;
	}
	public void setUserPsw(String userPsw) {
		this.userPsw = userPsw;
	}
	public String getUserState() {
		return userState;
	}
	public void setUserState(String userState) {
		this.userState = userState;
	}
	public String getUserAuthor() {
		return userAuthor;
	}
	public void setUserAuthor(String userAuthor) {
		this.userAuthor = userAuthor;
	}
	
	
}
