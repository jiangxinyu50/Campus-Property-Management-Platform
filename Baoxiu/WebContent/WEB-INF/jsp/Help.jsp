<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/include/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html;  charset=utf-8">
<title>南林在线物业管理帮助咨询</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0;" />
<meta content="yes" name="apple-mobile-web-app-capable" />
   <link href="${ctxStatic}/styles/bootstrap.min.css" rel="stylesheet" />
   <link href="${ctxStatic}/styles/NewGlobal.css" rel="stylesheet" />

<script type="text/javascript" src="${ctxStatic}/Scripts/zepto.js"></script>
</head>

<body>
<div class="header">
 <a href="${ctx}/index" class="home">
            <span class="header-icon header-icon-home"></span>
            <span class="header-name">主页</span>
</a>
<div class="title" id="titleString">帮助咨询</div>
<a href="javascript:history.go(-1);" class="back">
            <span class="header-icon header-icon-return"></span>
            <span class="header-name">返回</span>
        </a>
 </div>

        
    <div class="container width90 pt20">
        <img src="${ctxStatic}/Images/help/0.jpg"/>
        <img src="${ctxStatic}/Images/help/1.jpg"/>
        <img src="${ctxStatic}/Images/help/2.jpg"/>
        <img src="${ctxStatic}/Images/help/3.jpg"/>
        <img src="${ctxStatic}/Images/help/4.jpg"/>
    </div>


  <div class="footer">
  <div> 
      <a href="${ctx}/index" class="ui-link">首页</a> <font color="#878787">|</font> <a href="${ctx}/baoxiu" class="ui-link">在线报修</a> <font color="#878787">|</font> <a href="${ctx}/login" class="ui-link">管理页面</a> <font color="#878787">|</font> <a href="${ctx}/tongzhi" class="ui-link">物业通知</a></div>

      <p style="color:#bbb;">作者:蒋新宇&nbsp;&nbsp; &copy; &nbsp;&nbsp;毕业设计&nbsp;&nbsp;2016</p>
  </div>

</body>
</html>