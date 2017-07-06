<?xml version="1.0" encoding="UTF-8" ?>
<%@ include file="common/bootstrap.jsp"%>
<%@ include file="common/head.jsp"%>
<%@ include file="common/tag.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>SSM web系统</title>
<%@ include file="common/navigationBar.jsp"%>
</head>
<body>
<DIV>
<BR />
<DIV>
<FORM action="updateUser" method="post">
	编号：<input type="text" id="userid" name="id" value="${user.id}" readonly="readonly"></input><BR />
	姓名：<input type="text" id="username" name="userName" value="${user.userName}"></input><BR />
	密码：<input type="text" id="userpassword" name="userPassWord" value="${user.password}"></input><BR />
	年龄：<input type="text" id="userage" name="userAge" value="${user.age}"></input><BR />
	<INPUT type="submit" value="提交"/>
</FORM>
</DIV>
</DIV>
</body>
</html>