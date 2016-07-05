<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/include/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html;">
<title>管理员密码更改</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=1" />
    <meta content="yes" name="apple-mobile-web-app-capable" />
    <link href="${ctxStatic}/styles/bootstrap.min.css" rel="stylesheet" />
    <link href="${ctxStatic}/styles/NewGlobal.css" rel="stylesheet" />
    <script type="text/javascript" src="${ctxStatic}/Scripts/zepto.js"></script>
    <script src="${ctxStatic}/Scripts/repair.js" type="text/javascript"></script>
</head>
<body>
    <div class="header">
      <div class="title" id="titleString">密码修改</div>
      <a href="javascript:history.go(-1);" class="back">
        <span class="header-icon header-icon-return"></span>
        <span class="header-name">返回</span>
      </a>
    </div>
    
        <style type="text/css">
    #old {
        display: inline-block;
        width: 70%;
        margin: 10px 2px 15px 1px;
    }
    #new {
        display: inline-block;
        width: 70%;
        margin: 1px 1px 10px 0px;
    }
    #new1 {
        display: inline-block;
        width: 70%;
        margin: 1px 1px 10px 2px;
    }
    </style>
    <form id="updatepsd" action="${ctx}/updatePsd" method="post"> <!-- onsubmit="return checkPassword()" -->
     <div style="font-size:11pt" style="margin: 5px 0px 15px 5px;">
     <input id="name" name="name" value="<%=request.getParameter("name") %>" type="hidden" >
         <span style=" float: left;margin: 15px 5px 0 15px;color: #EB6100;">旧　密　码：</span>
        <input id="old" name="oldPwd" class="coupon-input input" type="password" placeholder="请输入现旧密码" value=""/>
      </div>

      <div style="font-size:11pt"  style="margin: 15px 0px 15px 5px;"><span style=" float: left;margin: 5px 5px 0 15px;color: #EB6100;">新　密　码：</span>
        <input id="new" name="newPwd" class="coupon-input input" type="password" placeholder="请输入新密码" value=""/>
      </div>
      
      <div style="font-size:11pt"  style="margin: 15px 0px 15px 5px;"><span style=" float: left;margin: 5px 5px 0 15px;color: #EB6100;">确 认 密  码：</span>
        <input id="new1" name="newPwd1" class="coupon-input input" type="password" placeholder="请再次输入新密码" value=""/>
      </div>

      <div class="control-group">
         <button id="changeMM" name="changeMM" class="btn-large green button width100" type="submit" onclick="return checkPassword()">确认更改</button>
         <!-- checkPassword()要传旧密码参数给JS判断 -->
      </div>
      </form>
    <div class="footer">
      <div name="mmfooter">
        <a href="#changeMM" class="ui-link">更改密码</a> <font color="#878787">|</font>
        <a href="${ctx}/list" class="ui-link">管理页面</a> <font color="#878787">|</font>
        <a href="${ctx}/help" class="ui-link">帮助咨询</a>
      </div>
      <div name="mmfooter">
        <p style="color:#bbb;">作者：蒋新宇 &copy; 毕业设计 2016</p>
      </div>
    </div>
</body>
</html>