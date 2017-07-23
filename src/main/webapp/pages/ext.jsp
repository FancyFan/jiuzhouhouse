<%
    String contextPath = request.getContextPath();
    //    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+contextPath+"/";
    response.setHeader("Pragma", "No-cache");
    response.setHeader("Cache-Control", "no-cache");
    response.setDateHeader("Expires", 0);
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="../js/jquery.min.js"></script>
<script src="../js/bootstrap.min.js"></script>
<link href="../css/bootstrap.min.css" rel="stylesheet">
