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
<title>注册</title>
<STYLE type="text/css">
#inputDiv{
	margin: auto;
	padding: 45px 100px;
	width:500px;
	height:300px; 
	background-color: #0FF;
}
</STYLE>
<%@ include file="common/navigationBar.jsp"%>
</head>
<body>
<div id="inputDiv" align="center">
    <form action="addResult" class="bs-example bs-example-form" role="form" method="post">
        <div class="input-group input-group-lg">
            <span class="input-group-addon">用户名</span>
            <input type="text" class="form-control" placeholder="name" name="userName">
        </div>
        <br>
        <div class="input-group input-group-lg">
            <span class="input-group-addon">密　码</span>
            <input type="password" class="form-control" placeholder="password" name="userPassWord">
        </div>
        <br>
        <div class="input-group input-group-lg">
            <span class="input-group-addon">年　龄</span>
            <input type="text" class="form-control" placeholder="age" name="userAge">
        </div>
        <br>
        <div class="input-group input-group-lg">
        	<button type="submit" class="btn btn-primary" data-toggle="submit"> 注册 </button>
        </div>
        <br>
    </form>
</div>
	
</body>
</html>