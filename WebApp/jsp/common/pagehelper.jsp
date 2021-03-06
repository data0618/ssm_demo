<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!--   -->
<!-- 页数 -->
<div class="message">
    共<i class="blue">${pagehelper.total}</i>条记录，当前显示第&nbsp;<i
        class="blue">${pagehelper.pageNum}/${pagehelper.pages}</i>&nbsp;页
</div>
<div style="text-align:center;">
    <ul class="pagination">
        <!-- <li><a href="#">&laquo;</a></li> -->
        <li><a href="javascript:queryAllPerson(${pagehelper.firstPage}, ${pagehelper.pageSize});">首页</a></li>
        <li><a href="javascript:queryAllPerson(${pagehelper.prePage}, ${pagehelper.pageSize});">上一页</a></li>
        <c:forEach items="${pagehelper.navigatepageNums}" var="navigatepageNum">
       		 
        	<c:if test="${navigatepageNum-pagehelper.pageNum>-3&&navigatepageNum-pagehelper.pageNum<3
        			||	pagehelper.pageNum == 1	&&	pagehelper.pageNum-navigatepageNum>-5
           			||	pagehelper.pageNum == 2	&&	pagehelper.pageNum-navigatepageNum>-4
           			||	pagehelper.pageNum == pagehelper.pages	&&	pagehelper.pageNum-navigatepageNum<5
           			||	pagehelper.pageNum - pagehelper.pages == -1 &&	pagehelper.pageNum-navigatepageNum<4
        	}">
	            <c:if test="${navigatepageNum==pagehelper.pageNum}">
	                <li class="active"><a href="javascript:queryAllPerson(${navigatepageNum}, ${pagehelper.pageSize});">${navigatepageNum}</a></li>
	            </c:if>
	            <c:if test="${navigatepageNum!=pagehelper.pageNum}">
	                <li><a href="javascript:queryAllPerson(${navigatepageNum}, ${pagehelper.pageSize});">${navigatepageNum}</a></li>
	            </c:if>
            </c:if>
           	
        </c:forEach>
        <li><a href="javascript:queryAllPerson(${pagehelper.nextPage}, ${pagehelper.pageSize});">下一页</a></li>
        <li><a href="javascript:queryAllPerson(${pagehelper.lastPage}, ${pagehelper.pageSize});">最后一页</a></li>
        <!-- <li><a href="#">&raquo;</a></li> -->
    </ul>
</div>