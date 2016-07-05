<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/include/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>管理员登陆</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0" />
<meta content="yes" name="apple-mobile-web-app-capable" />
<link href="/Baoxiu/static/styles/bootstrap.min.css" rel="stylesheet" />
<link href="/Baoxiu/static/styles/NewGlobal.css" rel="stylesheet" />
<script type="text/javascript">var ctx = '${ctx}', ctxStatic='${ctxStatic}';</script>
<script src="${ctxStatic}/Scripts/jquery-1.7.2.min.js" type="text/javascript"></script>
<script src="${ctxStatic}/Scripts/repair.js" type="text/javascript"></script>

</head>
<body>
 <div class="header">
 <a href="${ctx}/index" class="home">
            <span class="header-icon header-icon-home"></span>
            <span class="header-name">主页</span>
</a>
<div class="title" id="titleString">登陆</div>
<a href="javascript:history.go(-1);" class="back">
            <span class="header-icon header-icon-return"></span>
            <span class="header-name">返回</span>
        </a>
 </div>       
    <div class="container width80 pt20">
 <form name="jspForm"  id="jspForm"  method="post" action="${ctx}/list">
<div>
<input type="hidden" name="__EVENTTARGET" id="__EVENTTARGET" value="_______________" />
<input type="hidden" name="__EVENTARGUMENT" id="__EVENTARGUMENT" value="Login" />
</div> 
  <div class="control-group">
      <input name="name" type="text" id="txtUserName" value="" class="input width100 " style="margin-top: 15px; background: none repeat scroll 0 0 #F9F9F9;padding: 8px 0px 8px 4px" placeholder="请输入管理员帐号" />
  </div>
  <div class="control-group">
      <input name="psd" type="password" id="txtPassword" value="" class="width100 input" style="background: none repeat scroll 0 0 #F9F9F9;padding: 8px 0px 8px 4px" placeholder="请输入密码" />
  </div>
  <div class="control-group">
   
<!--       <label class="checkbox fl">
          <input name="saveCookie" type="checkbox" id="saveCookie" checked="" style="float: none;margin-left: 0px;" /> 记住账号
      </label> -->
 
  </div>
     <div class="control-group">
<!-- 	<input name="name" type="hidden" id="txtUserName" value=""/>
	<input name="psd" type="hidden" id="txtPassword" value=""/> -->
   </div>
  <div class="control-group">
         <button id="btnOK"  class="btn-large green button width100" type="submit" onclick="gogo()" style="margin-top: 25px;">立即登陆</button>
  </div>
</form>
  </div>


  <div class="footer">
  <div class="gezifooter">
      
      <a href="${ctx}/index" class="ui-link">首页</a> <font color="#878787">|</font>
      <a href="${ctx}/tongzhi" class="ui-link">物业通知</a> <font color="#878787">|</font> 
      <a href="#btnOK" class="ui-link">立即登陆</a> <font color="#878787">              
  </div>
  <div class="gezifooter">
    <p style="color:#bbb;">作者:蒋新宇&nbsp;&nbsp; &copy; &nbsp;&nbsp;毕业设计&nbsp;&nbsp;2016</p>
  </div>
  </div>
<script type="text/javascript">
function login(){
	var name = document.getElementsByName("name");
	var psd = document.getElementsByName("psd");
}
//------------------------------------------------------------------>
//点击登录然后跳转网页
function gogo(){
	document.getElementById("jspForm").submit();
	//window.location.href="${ctx}/loginResult"; //通过java定义的方法跳转
}

</script>
</body>
</html>
