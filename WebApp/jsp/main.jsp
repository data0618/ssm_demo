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
<SCRIPT type="text/javascript">
function query() {
	//向后台发送处理数据
    $.ajax({
    	type: "GET", //用POST方式传输
    	dataType: "json", //数据格式:JSON
    	url: 'getUser', //目标地址
   		data: {"id":"1"}, //{foo:["bar1", "bar2"]}
   		error: function (XMLHttpRequest, textStatus, errorThrown) { 
	   		 alert(XMLHttpRequest.status);
	         alert(XMLHttpRequest.readyState);
	         alert(textStatus);
   		},
    	success: function (msg){ alert(msg);}
    });
}
</SCRIPT>
<body>
<DIV>
<iframe frameborder="no" border="0" marginwidth="0" marginheight="0" width=330 height=86 
src="//music.163.com/outchain/player?type=2&id=27403811&auto=1&height=66">
</iframe>
<BR />
<DIV>
	<BUTTON onclick="query()">查询</BUTTON>
</DIV>
</DIV>
</body>
</html>