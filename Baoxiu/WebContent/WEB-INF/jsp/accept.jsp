<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="/WEB-INF/include/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
<script src="${ctxStatic}/js/repair.js" type="text/javascript"></script>
<title>接受成功</title>
<style type="text/css">
* {padding: 0; margin: 0;}
.header{
    background: #6ac134;
    height: 60px;
    position: relative;
    width: 100%;
}
.header .title {
    margin-left: 110px;
    line-height: 1.5em;
    font-size: 1.5em;
    color: #fff;
    vertical-align: middle;
    padding: 0.7em 0px;
    font-family: "微软雅黑";
    width: 100%;
    overflow: hidden;
    height: 22px;
}

#return-module{
	margin-top:150px;
}
#return-module .span-font{
	font-size:2em;
	font-family: "微软雅黑";
}
#return-module .btn-return{
	margin: 15px;
    width: 115px;
    height: 45px;
    font-size:1.5em;
	font-family: "微软雅黑";
}
</style>
</head>
<body>
<div class="header">
<div class="title">接受成功</div>
 </div>
 
<%String str = "/url?id="+request.getParameter("id").replace(".jsp","");%>

<div id="return-module">
<center><span class="span-font">接受成功!请点击返回.</span> <br />
<button type="button" onclick="back('${ctx}<%=str %>')" class="btn-return">返回</button>
</center>
</div>

</body>
</html>