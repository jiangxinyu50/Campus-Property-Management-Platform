<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/include/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>通知管理</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=1" />
    <meta content="yes" name="apple-mobile-web-app-capable" />
    <link href="${ctxStatic}/styles/bootstrap.min.css" rel="stylesheet" />
    <link href="${ctxStatic}/styles/NewGlobal.css" rel="stylesheet" />
    <script type="text/javascript" src="${ctxStatic}/Scripts/zepto.js"></script>
    <script src="${ctxStatic}/Scripts/repair.js" type="text/javascript"></script>
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
      <div class="title" id="titleString">通知管理</div>
    </div>
    
    <style type="text/css">
    #tztitle {
        display: inline-block;
        width: 70%;
        margin: 10px 2px 15px 1px;
    }
    #tzbody {
        display: inline-block;
        width: 70%;
        margin: 1px 1px 10px 0px;
    }
    .list {
        border-bottom: 1px dashed #DADADA; font-size: 10px;
        list-style-type:none;
    }
    .btn1 {
        font-size: 16px;
    	width: 50px;
        margin:5px -10px 5px 50px;
    }
    </style>
    <div>
      <!--管理已发布过的通知-->
      <div>
        <div><h3 style="text-align: center;">已发通知管理</h3></div>
        <center><span>注:通知数量尽量保持在10条以内,谢谢!</span></center>
        <ul>
        <%List tztit = News.selectTitle();
		 	for(int i=0;i<tztit.size();i++){
		 %>
        <li class="list"><span id="tzlist" name="tzlist" style="float: left; margin: 8px 5px 5px -20px; font-size: 13pt;"><%=tztit.get(i)%></span>
        <form action="${ctx}/deleteTz" method="post" target="_self" style="margin:0;">
        <input name="tzTitle" type="hidden" value="<%=tztit.get(i)%>"> 
        <button class="btn1" id="tzdelete" name="tzdelete" type="submit" onclick="return sure()">删除</button></li>
        </form>
        <%} %>
        <li style="list-style-type:none; margin: 15px auto -15px 25px;"><center><a href="${ctx}/tzgl" style="font-size:20px; text-decoration: none !important;">请点击此处刷新</a></center></li>
        </ul>
      </div>

      <hr />
      <!--发布新的物业通知处-->
      <h3 style="text-align: center;">发布新通知</h3>
      <form action="${ctx}/addTz" method="post" target="_self">
      <div style="font-size:11pt" style="margin: 15px 0px 15px 5px;">
         <span style=" float: left;margin: 15px 5px 0 15px;color: #EB6100;">标　　题：</span>
        <input id="tztitle" name="tztitle" class="coupon-input input" type="txt" placeholder="请输入通知标题"/>
      </div>

      <div style="font-size:11pt"  style="margin: 15px 0px 15px 5px;"><span style=" float: left;margin: 15px 5px 0 15px;color: #EB6100;">内　　容：</span>
      <textarea id="tzbody" name="tzbody" rows="10" class="coupon-input input" placeholder="请输入通知内容" style="resize:none;"></textarea>
      </div>

      <div class="control-group">
         <button  id="fabu" name="fabu" class="btn-large green button width100" type="submit" onclick="return suc(this.form)" >发布通知</button>
      </div>
	</form>
  </div>

	<script type="text/javascript">
		function sure(){
			if(confirm("确定要删除该通知吗？")){
				alert("删除成功！");
				return true;
			}else{
				return false;	
			}
		}
	
		function suc(){
			if(confirm("确定要发布新的物业通知吗？")){
				alert("发布新物业通知成功！");
				return true;
			}else{
				return false;
			}			
		}
	</script>
    <div class="footer">
      <div name="wytzfooter">
        <a href="${ctx}/tongzhi" class="ui-link">物业通知</a> <font color="#878787">|</font>
        <a href="${ctx}/list" class="ui-link">管理页面</a> <font color="#878787">|</font>
        <a href="${ctx}/help" class="ui-link">帮助咨询</a>
      </div>
      <div name="wytzfooter">
        <p style="color:#bbb;">作者：蒋新宇 &copy; 毕业设计 2016</p>
      </div>
    </div>
  </body>
</html>