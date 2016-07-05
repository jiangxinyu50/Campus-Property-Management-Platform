<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/include/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<link href="${ctxStatic}/styles/style1.css" type="text/css" rel="stylesheet" />
<base target="_blank" /><!-- 定义当前页面所有链接的打开方式 -->
<script type="text/javascript">var ctx = '${ctx}', ctxStatic='${ctxStatic}';</script>
<script src="${ctxStatic}/Scripts/jquery.js" type="text/javascript"></script>
<script src="${ctxStatic}/Scripts/paging.js" type="text/javascript"></script>
<script src="${ctxStatic}/Scripts/repair.js" type="text/javascript"></script>
<link href="${ctxStatic}/styles/bootstrap.min.css" rel="stylesheet" />
<script src="${ctxStatic}/zeroclipboard-master/dist/ZeroClipboard.min.js" type="text/javascript"></script>
<style type="text/css">
	body{ margin: 0 auto; font-family: 微软雅黑; background-size: 100%; }
    header{ width: 100%; height: 52px; background: #000; opacity: 0.5; }
    header ul{
        padding: 0;
        margin: 0;
        margin-left:200px;
    }
    header ul li{
        list-style: none;
        float: left;       
    }
    header ul li a{
        color:#fff;
        display: block;
/*         text-decoration: none !important; */
        padding: 15px 30px;
        cursor: pointer;
    }
    header ul li a:hover{
        background: #06f;
    }
    header ul li a.active{
        background: #06f;
    }
</style>
<title>报修结果</title>
</head>

<body>
	<%@ page import="com.test.web.info.*"%>
	<%@ page import="com.test.web.entity.*"%>
<% 
   User flag = null;  
   String login="";
   String loginFlag="";
%>
<% if(null!= request.getParameter("Login")) { 
	login = request.getParameter("Login"); 
	}%>
<% 
   if(null!= request.getParameter("__EVENTTARGET")) { 
	
	loginFlag = request.getParameter("__EVENTTARGET"); 
	}
%>



<% if("_______________".equals(request.getParameter("__EVENTTARGET"))){  //判断是不是从login.jsp登录进入的
   flag = Login.login(request.getParameter("name"),request.getParameter("psd"));  //登录验证用户名,密码
   
	if(null == flag){%>  <!-- 为空就登录失败 ,执行下面js-->
	<script type="text/javascript">
	
	function fal(){
		alert("登陆失败,可能是账号密码不对.请重新登录...");
		window.location.href="${ctx}/login";   //跳转回登录界面
		}
		fal();
	</script>
<%}else{%>
<%
if(flag.getUserState().equals("1")){ 
%>
<header>
    <ul id="menu">
        <li><a href="${ctx}/index" onclick="addclass(this);" class="active" titile="点击进入首页">首页</a></li>
        <li><a href="${ctx}/tzgl" onclick="addclass(this);" titile="发布物业通知,删除物业通知点这里">物业通知管理</a></li>
        <%if(flag.getUserAuthor().equals("1")){ %>  <!-- 判断账号权限,权限为超级管理员则显示,反之亦然 -->
        <li><a href="${ctx}/admin"  onclick="addclass(this);" titile="管理员管理管理员">管理员管理</a></li><!-- -->
        <%} %>
        <li><a href="${ctx}/changePwd?name=<%=request.getParameter("name") %>" onclick="addclass(this);" titile="觉得密码不安全可以换哦">更改密码</a></a></li>
<%--         <li><a href="${ctx}/mlist" onclick="addclass(this);" titile="移动办公,方便快捷">手机版</a></li> --%>
        <li><a target="_self" id="tuichu" titile="工作结束了,该下班了" onclick="tuichu()">注销退出</a></li>
        <li><a href="${ctx}/help" onclick="addclass(this);" titile="如有不明白可以点击这里查看方法">帮助咨询</a></li>
    </ul>
</header>

	<div style="float:right; margin-top: 30px;">
	<input type="button" id="btn_copy" title="点击复制可以将框内链接复制,按下快捷键Ctrl+V可进行粘贴.注意:要点击两次." 
		class="right btn" data-clipboard-target="link" onclick="jsCopy()" value="复制" style="clear:both;"/>
	<input type="text" id="link" class="right" value=""/>
	<label id="promt" class="right">请复制此链接:</label>
	</div>
	<center style="margin-top:100px;">
		<div>
			<div>
				<div class="border">
					<table id="customers" class="table">
						<thead>
							<tr onmouseover="this.bgColor='#E2E8EA'" onmouseout="this.bgColor=''" bgcolor="">
								<th id="id" name="id">工单号</th>
								<th id="style" name="style">类型</th>
								<th id="personName" name="personName">报修人</th>
								<th id="address" name="address">地点</th>
								<th id="phoneNumber" name="phoneNumber">联系电话</th>
								<th id="repairTimes" name="repairTimes">报修时间</th>
								<th id="hopeTimes" name="hopeTimes">期望时间</th>
								<th id="address" name="address">备注</th>
								<th id="repairStatus" name="repairStatus">报修状态</th>
								<th id="btn_copy" name="btn_copy"></th>
								<th id="btn_cancel" name="btn_cancel"></th>
							</tr>
						</thead>
						<tbody id="group_one">
						<!-- tr标签id自增1,以便后面隐藏id序号为1-6的内容 -->
						<c:set value="1" var="loop"></c:set>
							<c:forEach items="${list}" var="list">
								<tr id="${loop}" onmouseover="this.bgColor='#E2E8EA'" onmouseout="this.bgColor=''" bgcolor="">
									<c:set value="${loop+1}" var="loop"></c:set>
									<td style="width: 150px;white-space:nowrap;">${list.id}</td>
									<td>${list.type}</td>
									<td>${list.name}</td>
									<td style="width:100px; white-space: nowrap;overflow: hidden;text-overflow: ellipsis;">
									<input style="width:100px; white-space: nowrap;overflow: hidden;text-overflow: ellipsis;border:none;" value="${list.location}"/></td>
									<td>${list.phone}</td>
									<td><fmt:formatDate value="${list.time}"
											pattern="yyyy-MM-dd  HH:mm:ss" /></td>
									<td><fmt:formatDate value="${list.exceptedTime}"
											pattern="yyyy-MM-dd  HH:mm:ss" /></td>
									<td style="width:100px;">
									<input style="width:100px; white-space: nowrap;overflow: hidden;text-overflow: ellipsis;border:none;" value="${list.address}"/></td>
									<c:choose>
										<c:when test="${list.delFlag eq '1'}">
											<td class="cancel">已取消</td>
										</c:when>
										<c:when test="${list.state eq '0'}">
											<td class="no">未维修</td>
										</c:when>
										<c:when test="${list.state eq '1'}">
											<td class="wait">维修中</td>
										</c:when>
										<c:when test="${list.state eq '2'}">
											<td class="yes">已维修</td>
										</c:when>
										<c:otherwise>
											<td class="cancel">出问题了</td>
										</c:otherwise>
									</c:choose>
									<td><button id="btn_link" name="btn_copy" type="button"
											class="btn_td" onclick="jsLink('${ctx}${list.url}')"
											title="点击链接可以生成报修人资料链接">链接</button></td>
									<td><form action="${ctx}/cancel?id=${list.id}&name=<%=request.getParameter("name") %>&psd=<%=request.getParameter("psd") %>" method="post" target="_self"> <!--  onsubmit="return changebtn(${baoxiu.delFlag})" -->
									<button id="btn_cancel" name="btn_cancel" type="submit" 
											class="btn_td" title="点击取消可以取消该报修记录">取消</button></form></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<a href="javascript:void(0);" onclick="page.firstPage();return false;">首页</a> 
					<a href="javascript:void(0);" onclick="page.prePage();return false;">上一页</a>
					 <!-- 第 <span id="pageIndex"></span>页 -->　　
					<a href="javascript:void(0);" onclick="page.nextPage();return false;">下一页</a>
					<a href="javascript:void(0);" onclick="page.lastPage();return false;">尾页</a>
				</div>
				<br />
				<button id="wClose" class="btn" type="button" onclick="wClose()">关闭</button>
			</div>
		</div>
	</center>
<%} }}else{ %>
   <center><h1>怎么滴,没有我的同意,想进来?</h1>
   	<button id="denglu" class="btn" type="button">返回登录</button>
   </center>
  <% }%>
<script type="text/javascript">
window.onload = function(){
	//设置每页显示多少行,和table,tbody
	page = new Page(6,'customers','group_one'); 
};
function addclass(obj){   //标题栏控制函数
    var a=document.getElementById("menu").getElementsByTagName("a");
    for(var i=0;i<a.length;i++)
    {
        a[i].className="";
    }
    obj.className="active";
}
	var dl = document.getElementById("denglu");   //返回登录按钮的函数
	dl.onclick=function (){
		window.location.href="${ctx}/login";
	}
	
	function tuichu(){         //注销
		if (confirm("您确定要关闭本页吗？")) {
		addclass(this);
		window.location.href="${ctx}/login";
		return true;
		}else{
			return false;
		}
	}	
	
	function guanli(){
		document.getElementById('guanli').submit();
		
	}
/* 	function changebtn(delFlag){
		if (delFlag == "1") {
			var c = document.getElementById("btn_link");
			c.value = "已取消";
			document.getElementById("btn_link").value = c.value;
			document.getElementById("btn_link").disabled = true;
			c.style.background = "#C4C4C4";
		}
	} */
</script>
</body>
</html>