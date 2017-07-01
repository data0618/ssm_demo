<?xml version="1.0" encoding="UTF-8" ?>
<%@ include file="./common/bootstrap.jsp"%>
<%@ include file="./common/head.jsp"%>
<%@ include file="./common/tag.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>添加结果</title>
</head>
<body>
	<c:if test="${status == 1}">
		<p>操作成功！</p>
	</c:if>
	<BR />
	<a href="main">首页</a>
</body>
</html>