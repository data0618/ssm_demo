<%  
    String path = request.getContextPath();  
    String basePath = request.getScheme() + "://"  
            + request.getServerName() + ":" + request.getServerPort()  
            + path + "/";  
    pageContext.setAttribute("basePath",basePath);    
%>
<script type="text/JavaScript" src="/WEB-INF/js/jquery-1.12.4.min.js"></script>
<%@include file="bootstrap.jsp" %>
