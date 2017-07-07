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

	var clock = '';
	var nums = 10;
	var btn;
	function sendCode(thisBtn) {
		 //向后台发送处理数据
	     $.ajax({
	     	type: "GET", //用POST方式传输
	     	dataType: "JSON", //数据格式:JSON
	     	url: 'validate', //目标地址
	    	data: {},
	    	error: function (XMLHttpRequest, textStatus, errorThrown) { },
	     	success: function (msg){ alert(msg);}
	     });
		btn = thisBtn;
		btn.disabled = true; //将按钮置为不可点击
		btn.value = nums + '秒后可重新获取';
		clock = setInterval(doLoop, 1000); //一秒执行一次
	}
	function doLoop() {
		nums--;
		if (nums > 0) {
			btn.value = nums + '秒后可重新获取';
		} else {
			clearInterval(clock); //清除js定时器
			btn.disabled = false;
			btn.value = '点击发送验证码';
			nums = 10; //重置时间
		}
	}
</SCRIPT>
<body>
	<input type="button" class="btn btn-default btn-lg active" onclick="sendCode(this)" value="点击获取验证码"></input>
	<form class="form-inline" action="result">
		<div class="input-group">
      		<input type="text" class="form-control" id="securityCode" placeholder="验证码"></input>
      		<span class="input-group-btn">
        	<button class="btn btn-default" id="submit" type="submit">提交</button>
      		</span>
    	</div><!-- /input-group -->
	</form>
</body>
</html>