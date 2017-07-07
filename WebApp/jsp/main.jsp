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
    	type: "post", //用POST方式传输
    	dataType: "json", //数据格式:JSON
    	url: 'getUser', //目标地址
   		data: {"id":$("#queryId").val()}, //{foo:["bar1", "bar2"]}
   		error: function (XMLHttpRequest, textStatus, errorThrown) { 
	   		 alert(XMLHttpRequest.status);
	         alert(XMLHttpRequest.readyState);
	         alert(textStatus);
   		},
    	success: function (data){
			if(data!=null){
				$("#userid").val(data.id);
				$("#username").val(data.userName);
				$("#userpassword").val(data.password);
				$("#userage").val(data.age);
			}
    	}
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
	编号：<input type="text" id="userid" value=""></input><BR />
	姓名：<input type="text" id="username" value=""></input><BR />
	密码：<input type="text" id="userpassword" value=""></input><BR />
	年龄：<input type="text" id="userage" value=""></input><BR />
	输入查询编号：<input type="text" id="queryId" value="1"></input>
	<BUTTON onclick="query()">查询</BUTTON>
</DIV>
<!-- Button trigger modal -->
<button type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal">
 模态框
</button>

<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">标题</h4>
      </div>
      <div class="modal-body">
        <ul>
        	<li>11111</li>
        	<li>22222</li>
        	<li>33333</li>
        	<li>44444</li>
        	
        </ul>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">保存</button>
      </div>
    </div>
  </div>
</div>
</DIV>
</body>
</html>