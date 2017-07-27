<%--
  Created by IntelliJ IDEA.
  User: dingge
  Date: 2017/7/25
  Time: 23:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>二手房交易</title>
    <script src="../js/jquery.js"></script>
    <script src="../js/bootstrap.min.js"></script>
    <link href="../css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="navbar navbar-default nav-fixed-top " role="navigation">
    <div class="navbar-header">
        <div class="navbar-brand">九州地产</div>
    </div>
    <ul class=" nav navbar-nav">
        <li><a href="${ pageContext.request.contextPath }/" >首页</a></li>
        <li><a href="${ pageContext.request.contextPath }/pages/secondHouse.jsp" >二手房</a></li>
        <li><a href="${ pageContext.request.contextPath }/pages/newHouse.jsp" >新房</a></li>
        <li><a href="${ pageContext.request.contextPath }/pages/rental.jsp" >租房</a></li>
    </ul>
    <ul class="nav navbar-nav navbar-right">
        <li><a href="${ pageContext.request.contextPath }/pages/login.jsp">登录</a></li>
        <li><a href="${ pageContext.request.contextPath }/pages/register.jsp">注册</a></li>
    </ul>
</div>
</body>
</html>
