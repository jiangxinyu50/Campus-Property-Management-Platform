<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/include/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>通知正文</title>
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
<div class="title" id="titleString">通知</div>
<a href="javascript:history.go(-1);" class="back">
            <span class="header-icon header-icon-return"></span>
            <span class="header-name">返回</span>
        </a>
 </div>


 <c:forEach items="${list}" var="list">

    <div class="container width90">
        <p class="newstitle" id="tzbiaoti" name="tzbiaoti">${list.tztitle}</p>
        <div style="font-size:11pt" id="tzneirong" name="tzneirong">${list.tzbody}</div>
    </div>

</c:forEach>
  <div class="footer">
  <div name="wytzfooter">
      
      <a href="${ctx}/tongzhi" class="ui-link">物业通知</a> <font color="#878787">|</font>
       <a href="${ctx}/baoxiu" class="ui-link">在线报修</a> <font color="#878787">|</font>
       <a href="${ctx}/help" class="ui-link">帮助咨询</a>
  </div>
  <div name="wytzfooter">
    <p style="color:#bbb;">作者：蒋新宇 &copy; 毕业设计 2016</p>
  </div>
  </div>

</body>
</html>