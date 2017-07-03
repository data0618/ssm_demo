<?xml version="1.0" encoding="UTF-8" ?>
<%@ include file="common/bootstrap.jsp"%>
<%@ include file="common/head.jsp"%>
<%@ include file="common/tag.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Insert title here</title>
</head>
<SCRIPT type="text/javascript">
$(document).ready(function() {
	$("#submit").click(function() {
		alert("${validateCode}");
		return false;
	});
});
</SCRIPT>
<body>
	<form method="get" action="validate">
		<button type="button" class="btn btn-default btn-lg active">点击获取验证码</button>
	</form>
	<form class="form-inline">
		<div class="form-group">
			<label class="sr-only">请输入验证码</label>
		</div>
		<div class="form-group">
			<label for="inputPassword2" class="sr-only"></label> <input
				type="password" class="form-control" id="inputPassword2"
				placeholder="Password">
		</div>
		<button id="submit" type="submit" class="btn btn-default">提交</button>
	</form>
</body>
</html>