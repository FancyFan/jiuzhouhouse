<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String contextPath = request.getContextPath();
    response.setHeader("Pragma", "No-cache");
    response.setHeader("Cache-Control", "no-cache");
    response.setDateHeader("Expires", 0);
%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<html>
<head>
    <title>九州地产</title>
    <link rel="shortcut icon" href="./img/logo.jpg" type="image/x-icon">
    <script src="./js/jquery.js"></script>
    <script src="./js/bootstrap.min.js"></script>
    <link href="./css/bootstrap.min.css" rel="stylesheet">
    <style type="text/css">
        body {
            background: url("./img/indexPageHouse.jpg") no-repeat;
            background-size: 100%;
            background-attachment: fixed;
        }

        .login {
            position: relative;
            font-family: Arial;
            color: white;
            top: 50px;
            left: 80%;
            font-size: medium;
        }

        .login a {
            color: white;
        }

        .navlist {
            position: relative;
            top: 60px;
            left: 700px;
            width: 500px;
            height: 50px;
        }

        .navlist a {
            position: relative;
            color: white;
            font-weight: 600;
            font-size: large;
            float: left;
            margin-right: 3%;
        }

        .logo {
            position: relative;
            top: 30px;
            left: 300px;
            width: 250px;
            height: 50px;
            color: white;
            font-family: Arial;
            font-weight: 900;
            font-size: larger;
            float: left;
        }

        .circle {
            width: 150px;
            height: 150px;
            border-radius: 50%;
            position: relative;
            float: left;
            color: white;
            top: 300px;
            left: 100px;
        }

        .circle h3 {
            position: relative;
            left: 33%;
            top: -45px;
            color: white;
            font-family: Arial;
            font-size: larger;
            font-weight: 900;
        }

        .circleList, .title {
            position: relative;
        }

        .searchD {
            position: relative;
            top: 200px;
            left: 30%;
            width: 20%;
            height: 15%;
            font-weight: 900;
            font-size: large;
            display: inline;
        }

        .searchD input {
            width: 400px;
            height: 30px;
            border-radius: 4px;
            opacity: 0.5;
        }

        .circleLeft {
            background: url("./img/sellHouse.jpg");
            left: 300px;
            margin-right: 100px;
        }

        .circleMid {
            background: url("./img/findHouse.jpg");
            margin-left: 200px;
        }

        .circleRight {
            background: url("./img/renatHouse.jpg");
            margin-left: 100px;
        }

        #submit {
            border-radius: 4px;
        }
    </style>
</head>
<body>
<div class="title">
    <div class="login">
        <a href="${ pageContext.request.contextPath }/pages/login.jsp">登录</a>
        <a href="${ pageContext.request.contextPath }/pages/register.jsp">注册</a>
    </div>
    <div class="logo">
        <h1>九州地产</h1>
    </div>
    <div class="navlist">
        <a href="${ pageContext.request.contextPath }/">首页</a>
        <a href="${ pageContext.request.contextPath }/pages/secondHouse.jsp">二手房</a>
        <a href="${ pageContext.request.contextPath }/pages/newHouse.jsp">新房</a>
        <a href="${ pageContext.request.contextPath }/pages/rental.jsp">租房</a>
    </div>
</div>
<div class="searchD">
    <div>
        <input type="search" id="search" placeholder="小区搜索">
        <button type="button" id="submit" class="btn-danger" onclick="search()">查询</button>
    </div>
</div>
<div class="circleList">
    <div>
        <div class="circle circleLeft"><a href="#"><h3>找房子</h3></a></div>
        <div class="circle circleMid"><a href="<%=basePath%>/href/0"><h3>出租房</h3></a></div>
        <div class="circle circleRight"><a href="#"><h3>租房子</h3></a></div>
    </div>
</div>
</body>
<script type="text/javascript">
    function search() {
        var context = $("#search").val();
        alert(context);
        $.ajax({
            type: "GET",
            url: "<%=basePath%>/searchForCon",
            data: {communityName: context},
            success: function (result) {
                alert("test");
                location.href = "${ pageContext.request.contextPath }/pages/secondHouse.jsp";
            },
            error: function (e) {
                alert("no");
                console.log("there is something wrong!");
            }
        });
    }
</script>
</html>
