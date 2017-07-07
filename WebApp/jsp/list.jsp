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
<script type="text/javascript">
    $(document).ready(function() { });
    function queryAllPerson(pageNum, pageSize) {
        $("body").load("<%=basePath%>user/list?pageNum=" + pageNum + "&pageSize=" + pageSize);
    }
</script>
<title>全部</title>
<STYLE type="text/css">
BODY{
	overflow: hidden;
}
</STYLE>
<%@ include file="common/navigationBar.jsp"%>
</head>
<body>
<div class="container">
	<div class="row">
	<div id="edit_area_div">
		<div class="col-md-12" align="center">
		<H1>
			全部傻逼信息
		</H1>
		</div>
		 
		<div class="col-md-8 col-md-offset-2">
		<table class="table table-hover">
	  		<tr>
				<th>序号</th>
	  			<th>用户名</th>
	  			<th>密码</th>
	  			<th>年龄</th>
	  			<th>操作</th>
	  		</tr>
	  		<c:forEach var="user" items="${pagehelper.list }" >
				<tr>
					<td>${user.id}</td>
					<td>${user.userName}</td>
					<td>${user.password}</td>
					<td>${user.age}</td>
					<td><A class="btn btn-default" href="showUser?id=${user.id}" role="button">修改</A></td>
				</tr>
	        </c:forEach>
		</table>
		</div>
		<div id="page_div" class="col-md-6 col-md-offset-6">
        	<%@ include file="common/pagehelper.jsp"%>  <!-- 分页的插件 -->
        </div>
        </div>
	</div><!-- row end -->
</div>
</body>
</html>