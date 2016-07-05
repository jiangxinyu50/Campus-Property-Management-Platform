<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/include/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<meta name="viewport"
	content="width=device-width,initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no" />
<link href="${ctxStatic}/styles/style2.css" type="text/css" rel="stylesheet" />
<link href="${ctxStatic}/styles/bootstrap.min.css" rel="stylesheet" />
<script src="${ctxStatic}/Scripts/jquery.js" type="text/javascript"></script>
<script src="${ctxStatic}/Scripts/repair.js" type="text/javascript"></script>
<style type="text/css">
* {
	padding: 0;
	margin: 0;
}
body{
	font-family: "微软雅黑";
}

.header {
	background: #6ac134;
	height: 60px;
	line-height: 60px;
	width: 100%;
	color: #fff;
	text-align: center;
	font-size:1.5em;
}

.header .title {
	margin-left: 110px;
	line-height: 1.5em;
	font-size: 1.5em;
	color: #fff;
	vertical-align: middle;
	padding: 0.7em 0px;
	font-family: "微软雅黑";
	overflow: hidden;
	height: 22px;
}
</style>
<title>报修用户资料</title>
</head>

<body onload="acceptRequest(${baoxiu.state},${baoxiu.delFlag})">
	<div class="header">用户资料</div>

	<div class="content">
		<ul>
				<li>
					<label class="left">报修时间</label>
					<div class="right"><fmt:formatDate value="${baoxiu.time}"
							pattern="yyyy-MM-dd  HH:mm:ss" />
					</div>
				</li>
				
				<li>
					<label class="left">报修类型</label>
					<div class="right">${baoxiu.type}</div>
				</li>
				
				<li>
					<label class="left">报修人</label>
					<div class="right">${baoxiu.name}</div>
				</li>
			
			
				<li>
					<label class="left">联系电话</label>
					<div class="right">${baoxiu.phone}</div>
				</li>
			
			
				<li>
					<label class="left">期望时间</label>
					<div class="right"><fmt:formatDate value="${baoxiu.exceptedTime}"
						pattern="yyyy-MM-dd  HH:mm:ss" />
					</div>
				</li>
			
			
				<li>
					<label class="left">地点</label>
					<div class="right">${baoxiu.location}</div>
				</li>
			
			
				<li>
					<label class="left">备注</label>
					<div class="right">${baoxiu.address}</div>
				</li>
		</ul>
		<div class="form">
			<form action="${ctx}/urlAccepet?keyId=${baoxiu.id}" method="post"
				onsubmit="return acceptRequest(${baoxiu.state})">
				<input id="btn_accept" name="accept" type="submit" class="btn1"
					value="接受" style="margin-top: -25px;" />
			</form>
		
			<form action="${ctx}/urlFinish?keyId=${baoxiu.id}" method="post"
				onsubmit="return (${baoxiu.state})">
				<input id="btn_finish" name="finish" type="submit" class="btn1"
					value="完成" style="margin-top: 5px;" />
			</form>
		</div>
	</div>
</body>
</html>