<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/include/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>管理员管理</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=1" />
    <meta content="yes" name="apple-mobile-web-app-capable" />
    <link href="${ctxStatic}/styles/bootstrap.min.css" rel="stylesheet" />
    <link href="${ctxStatic}/styles/NewGlobal.css" rel="stylesheet" />
    <script type="text/javascript" src="${ctxStatic}/Scripts/zepto.js"></script>
    <script src="${ctxStatic}/Scripts/repair.js" type="text/javascript"></script>
  </head>
  <body onload="load()">
    <div class="header">
      <div class="title" id="titleString">管理员管理</div>
    </div>
    
    <style type="text/css">
    #newadmin {
        display: inline-block;
        width: 70%;
        margin: 10px 2px 15px 1px;
    }
    #newadmin1 {
        display: inline-block;
        width: 70%;
        margin: 1px 1px 10px 0px;
    }
    .list {
        border-bottom: 1px dashed #DADADA; font-size: 10px; display: -webkit-inline-box; display: inline-flex; /* <!-- display用box或者flex都行--> */
        list-style-type:none;
    }
    .btn1 {
        margin:5px -10px 5px 20px;
    }
    .fl{float: left;}    .fr{float: right;}
    </style>
    <%@ page import="com.test.web.info.*"%>
	<%@ page import="com.test.web.entity.*"%>
	<%@ page import="java.util.List" %>
	<c:if test="${not empty result}">

    <c:if test="${result eq '1'}">
      		删除成功！
    </c:if>
    <c:if test="${result eq '0'}">
      		删除失败！
    </c:if>
    </c:if>
    <div>
      <!--管理用户-->
      <div>
        <div><h3 style="text-align: center;">管理操作</h3></div>
        <ul>
		 <%List adname = Login.selectName();
		 	for(int i=0;i<adname.size();i++){
		 		if(!adname.get(i).equals("admin")){
		 %>
         <li class="list"><span id="adminName" name="adminName" style="float: left; margin: 5px; font-size: 13pt;color: #1C86EE;"><%=adname.get(i)%></span>
           <button class="btn1" id="adminDo" name="adminDo" onclick="window.location.href='${ctx}/changePwd?name=<%=adname.get(i)%>'">更改密码</button>
           <form action="${ctx}/deleAdmin" method="post" target="_self" style="margin:0;">
           <input name="adPname" type="hidden" value="<%=adname.get(i)%>"> 
           <button class="btn1" id="tzdelete" name="tzdelete" type="submit" style="margin-left:74px" onclick="return sure()">删除用户</button>
           </form>
           <%}}%>
         </li>
		<li style="list-style-type:none; margin: 15px auto -15px 25px;"><a href="${ctx}/admin" style="font-size:20px; text-decoration: none !important;">删除过后，请点击此处刷新</a></li>
        </ul>
      </div>

      <hr />
      <!--添加新的用户处-->
      <h3 style="text-align: center;">新增用户</h3>
    <form action="${ctx}/addAdmin" method="post" target="_self">
      <div style="font-size:11pt" style="margin: 15px 0px 15px 5px;">
         <span style=" float: left;margin: 15px 5px 0 15px;color: #EB6100;">用　户　名：</span>
        <input id="newadmin" name="newadmin" class="coupon-input input" type="txt" placeholder="请输入新用户名"/>
      </div>

      <div style="font-size:11pt"  style="margin: 15px 0px 15px 5px;"><span style=" float: left;margin: 5px 5px 0 15px;color: #EB6100;">密　　　码：</span>
        <input id="newadmin1" name="newadmin1" class="coupon-input input" type="password" placeholder="请输入新用户密码"/>
      </div>

      <div class="control-group">
         <button type="submit" class="btn-large green button width100" id="addAdmin" name="addAdmin" onclick="return suc()">添加新用户</button>
      </div>
    </form>
    </div>
    <script type="text/javascript">
    	function load(){
    		var s = document.getElementById("tzdelete");
    		var n = document.getElementById("adminName");
    		
    		if(n.value == "admin"){
    			s.style.disabled="disabled";
    		}
    	}
    	
    	function sure(){
    		if(confirm("是否要删除？")){
        		alert("删除成功！");
    			return true;
    		}else{
    			return false;
    		}
    	}
    	
    	function suc(){
    		if(confirm("是否要添加新用户？")){
        		alert("添加成功！");
    			return true;
    		}else{
    			return false;
    		}
    	}
    </script>

    <div class="footer">
      <div name="wytzfooter">
        <a href="${ctx}/" class="ui-link">通知管理</a> <font color="#878787">|</font>
        <a href="${ctx}/list" class="ui-link">管理页面</a> <font color="#878787">|</font>
        <a href="${ctx}/help" class="ui-link">帮助咨询</a>
      </div>
      <div name="wytzfooter">
        <p style="color:#bbb;">作者：蒋新宇 &copy; 毕业设计 2016</p>
      </div>
    </div>
  </body>
</html>