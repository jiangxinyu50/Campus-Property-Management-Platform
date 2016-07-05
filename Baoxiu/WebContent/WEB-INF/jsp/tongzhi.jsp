<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/include/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>物业通知</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0;" />
<meta content="yes" name="apple-mobile-web-app-capable" />
<link href="${ctxStatic}/styles/bootstrap.min.css" rel="stylesheet" />
<link href="${ctxStatic}/styles/NewGlobal.css" rel="stylesheet" />
<script type="text/javascript" src="${ctxStatic}/Scripts/zepto.js"></script>

    <style type="text/css">
     /* CSS样式 */  
     ul{margin:15px 0 0 25px;}
     li{display:block;line-height: 30px; border: 1px;border-bottom: none;margin-left: 0px;margin-bottom: 0px;}/*通知样式,决定其能以行的样式显示(display不能用inline-block)*/
     #tab-list div li{height: 25px;line-height: auto;text-indent: 0px;margin-bottom: 5px;}/*通知的li标签样式,能让通知与通知之间看起来有间隔*/
     form{margin: 0 0 5px 5px;}
    </style>

</head>

<body>
    <%@ page import="com.test.web.info.*"%>
	<%@ page import="com.test.web.entity.*"%>
	<%@ page import="java.util.List" %>

 <div class="header">
 <a href="${ctx}/index" class="home">
            <span class="header-icon header-icon-home"></span>
            <span class="header-name">主页</span>
</a>
<div class="title" id="titleString">物业通知</div>
<a href="javascript:history.go(-1);" class="back">
            <span class="header-icon header-icon-return"></span>
            <span class="header-name">返回</span>
        </a>
 </div>

        <%int i =0; %>   <!-- 给id后面加编号 -->
    <div id="tab-list" >
          <ul>
      <c:forEach items="${list}" var="title">
		   <form id="jinru<%=i %>" name="jinru" action="${ctx}/news" method="post" >  <!-- 因为id的唯一性，所以最好在id的后面给其一个编号，让其自增。否则始终会锁定第一个id -->
		   <input  name="tztit" type="hidden" value="${title}"/>
            <li><a onclick="document.getElementById('jinru<%=i %>').submit();" style="font-size:15px;cursor: pointer;" id="tztit1" name="tztit1">${title} </a></li>
            </form>
            <%i++; %>  <!-- 编号自增 -->
      </c:forEach>
          </ul>
          <hr />
    </div>     
    <script type="text/javascript">
/*     	function jinru(){
    		document.getElementById("jinru").submit();
    		javascript:document.getElementById()"jinru").submit();
    	} */
    </script>                
  <div class="footer">
  <div> 
      <a href="${ctx}/index" class="ui-link">首页</a> <font color="#878787">|</font> <a href="${ctx}/baoxiu" class="ui-link">在线报修</a>
      <font color="#878787">|</font> <a href="${ctx}/login" class="ui-link">管理页面</a> <font color="#878787">|</font> 
      <a href="javascript:;" class="ui-link">物业通知</a></div>

      <p style="color:#bbb;">作者:蒋新宇&nbsp;&nbsp; &copy; &nbsp;&nbsp;毕业设计&nbsp;&nbsp;2016</p>
  </div>

</body>
</html>