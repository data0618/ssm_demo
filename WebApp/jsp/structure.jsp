<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="../js/jquery-2.1.1.js"></script>
<script type="text/javascript" src="../js/structure.js"></script>
<title>组织结构</title>
<style>
.left {
	width: 30%;
	height: auto;
	margin-left: 2%;
	float: left;
	display: inline;
	border-right: 1px solid gray;
}

.right {
	width: 66%;
	height: auto;
	float: right;
	display: inline;
}
</style>
</head>
<body>
	<div>
		<div class="left">
			<ul>
				<li>部门
					<ul>
						<c:forEach var="item" items="${deptList}">
							<li id="dept_${item.id}"><a href="#"
								onclick="unfoldDept('${item.id}');">${item.department}</a>
							<ul></ul></li>
						</c:forEach>
					</ul>
				</li>
			</ul>
		</div>
		<div class="right"></div>
	</div>
</body>
</html>