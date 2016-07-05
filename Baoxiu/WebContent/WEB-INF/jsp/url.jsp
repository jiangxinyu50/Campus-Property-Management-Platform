<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/include/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%@ include file="/WEB-INF/include/head.jsp"%>
</head>
<body>
	${baoxiu.id}<br/>
	<fmt:formatDate value="${baoxiu.time}" pattern="yyyy-MM-dd  HH:mm:ss" /><br/>
	${baoxiu.type}<br/>
	${baoxiu.name}<br/>
	${baoxiu.phone}<br/>
	<fmt:formatDate value="${baoxiu.exceptedTime}" pattern="yyyy-MM-dd  HH:mm:ss" /><br/>
	${baoxiu.address}<br/>
	${baoxiu.location}<br/>
</body>
</html>