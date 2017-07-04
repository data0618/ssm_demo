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
		var text = $("#securityCode").val();
		if("${validateCode}" == text){
			return true;		
		}else{
			return false;
		}
	});
});
</SCRIPT>
<body>
	<form action="validate" method="get" >
		<button type="button" class="btn btn-default btn-lg active">点击获取验证码</button>
	</form>
	<form class="form-inline" action="result">
		<div class="form-group">
			<label class="sr-only">请输入验证码</label>
		</div>
		<div class="input-group">
      		<input type="text" class="form-control" id="securityCode" placeholder="验证码"></input>
      		<span class="input-group-btn">
        	<button class="btn btn-default" id="submit" type="submit">提交</button>
      		</span>
    	</div><!-- /input-group -->
	</form>
</body>
</html>