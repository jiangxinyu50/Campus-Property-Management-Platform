<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/include/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>南林在线物业管理</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0;" />
<meta content="yes" name="apple-mobile-web-app-capable" />


   <%-- <link href="${ctxStatic}/styles/bootstrap-responsive.css" rel="stylesheet" /> --%>
   <link href="${ctxStatic}/styles/bootstrap.min.css" rel="stylesheet" />
   <link href="${ctxStatic}/styles/NewGlobal.css" rel="stylesheet" />

<script src="${ctxStatic}/Scripts/jquery-1.7.2.min.js"></script>
<script src="${ctxStatic}/Scripts/bootstrap.min.js"></script>

</head>
<body>
 
 <div class="container">
 <div class="header"><a href="${ctx}/index">
 <img src="${ctxStatic}/Images/logo.png" style="height: 40px; margin: 10px 0px 0px 15px" /></a>
 </div>
     <div style="padding:0 5px 0 0;">
      
     <ul class="unstyled defaultlist pt20">
         <li class="f">
             <a href="${ctx}/baoxiu">
             <h3>在线报修</h3>
             <figure class="zxbx_icon"></figure>
             </a>
         </li>
         <li class="p">
            <a href="${ctx}/login">
            <h3> 管理页面</h3>
            <figure class="glym_icon"></figure>
            </a>
         </li>
     </ul>
     <ul class="unstyled defaultlist">
         <li class="t">
            <a href="${ctx}/tongzhi">
            <h3> 物业通知</h3>
            <figure class="wytz_icon"></figure>
            </a>
         </li>
         
         <li class="m">
             <a href="${ctx}/help">
            <h3> 帮助咨询</h3>
            <figure class="bzzx_icon"></figure>
              </a>
         </li>
       
     </ul>
     </div>
 </div>    
  

<!--网页底部-->
  <div class="footer">
  <div> 
      <a href="${ctx}/index" class="ui-link">首页</a> <font color="#878787">|</font> <a href="${ctx}/baoxiu" class="ui-link">在线报修</a> <font color="#878787">|</font> <a href="${ctx}/login" class="ui-link">管理页面</a> <font color="#878787">|</font> <a href="${ctx}/tongzhi" class="ui-link">物业通知</a><font color="#878787"> |</font> <a href="${ctx}/help" class="ui-link">帮助咨询</a></div>
      <p style="color:#bbb;">作者:蒋新宇&nbsp;&nbsp; &copy; &nbsp;&nbsp;毕业设计&nbsp;&nbsp;2016</p>
  </div>
  
  
</body>
</html>
