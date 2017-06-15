<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<html>
<head>
    <script type="text/javascript" charset="utf-8" src="../js/jquery.min.js"></script>
    <script type="text/javascript" charset="utf-8" src="../js/jquery.js"></script>
    <link rel="stylesheet" href="../css/reset.css">
    <link rel="stylesheet" href="../css/supersized.css">
    <link rel="stylesheet" href="../css/style.css">
    <script src="../js/html5.js"></script>
    <title>Login Page</title>
</head>
<body>
<div class="page-container">
    <h1>登录</h1>
    <form>
        <input type="text" name="userName" class="username" id="userName" placeholder="请输入您的用户名！">
        <br/>
        <input type="password" name="passWord" class="password" id="passWord" placeholder="请输入您的用户密码！">
        <br/>
        <div id="loginError"  style="font-size: 16px; color:red; padding-left: 2px;width: 80%"></div>
        <br/>
        <button type="button" id="loginBtn" class="submit_button">登录</button>
        <br/>
        <%--<button type="button" id="resetBtn" class="submit_button">重置</button>--%>
    </form>
</div>

<script src="../js/supersized.3.2.7.min.js" ></script>
<script src="../js/supersized-init.js" ></script>
<script src="../js/scripts.js" ></script>
</body>
<script type="text/javascript">
    $(function(){
        var username = $("#userName");
        var password = $("#passWord");
        var error = $("#loginError");

        $("#loginBtn").click(function(){

            if(username.val()==null || username.val().trim()==""){
                error.text("User name cannot be empty.");
                return false;
            }

            if(password.val()==null || password.val().trim()==""){
                error.text("Password cannot be empty.");
                return false;
            }

            error.text("");

            $.ajax({
                type: "GET",
                url:  "user/login",
                data: {
                    username: username.val(),
                    password: password.val(),
                },
                dataType:'json',
                success: function (result) {
                    console.log(result);
                    if (result.flag) {
                        window.location = "adminPage.jsp";
                    } else {
                        error.text(result.message);
                    }
                },
                error: function (e) {
                    alert("cannot to sever");
                }
            });

        });
    });

</script>
</html>