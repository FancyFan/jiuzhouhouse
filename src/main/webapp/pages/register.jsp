<%--
  Created by IntelliJ IDEA.
  User: banma82
  Date: 2017/6/19
  Time: 13:08
  To change this template use File | Settings | File Templates.
--%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<html>
<head>
    <title>register</title>
    <script type="text/javascript" charset="utf-8" src="../js/jquery.min.js"></script>
    <script type="text/javascript" charset="utf-8" src="../js/jquery.js"></script>
    <link rel="stylesheet" href="../css/reset.css">
    <link rel="stylesheet" href="../css/supersized.css">
    <link rel="stylesheet" href="../css/style.css">
</head>
<body>
<div class="page-container">
    <div>
        <h1>用户注册</h1>
    </div>
    <div>
        <form class="form-horizontal" role="form">
            <div>
                <div>
                    <input type="text" id="userName" name="userName" class="username" placeholder="请输入用户名">
                </div>
            </div>
            <div >
                <input type="password" id="pwd" name="pwd" class="form-control col-md-8" placeholder="请输入密码">
            </div>
            <div >
                <input type="email" id="email" name="email" class="form-control" placeholder="请输入email">
            </div>
            <div >
                <input type="text" id="phone" name="phone" class="form-control"placeholder="请输入手机">
            </div>
            <div >
                <input type="text" id="address" name="address" class="form-control" placeholder="请输入地址">
            </div>
            <div>
                <button type="submit" id="submit">注册</button>
            </div>
            <div>
                <div id="registerError"  style="font-size: 16px; color:red; padding-left: 2px;width: 80%"></div>
            </div>
        </form>
    </div>
</div>


<script src="../js/supersized.3.2.7.min.js" ></script>
<script src="../js/supersized-init.js" ></script>
<script src="../js/scripts.js" ></script>
</body>
<script type="application/javascript">
    $(function () {
        var username = $("#userName");
        var password = $("#pwd");
        var email = $("#email");
        var phone = $("#phone");
        var address = $("#address");
        var error = $("#registerError");

        $('#submit').click(function () {
            if(username.val()==null || username.val().trim()==""){
                error.text("User name cannot be empty.");
                return false;
            }

            if(password.val()==null || password.val().trim()==""){
                error.text("Password cannot be empty.");
                return false;
            }

            if(email.val()==null || email.val().trim()==""){
                error.text("Email cannot be empty.");
                return false;
            }

            if(phone.val()==null || phone.val().trim()==""){
                error.text("Phone cannot be empty.");
                return false;
            }

            if(address.val()==null || address.val().trim()==""){
                error.text("Address cannot be empty.");
                return false;
            }

            if(!isEmail(email.val())){
                error.text("Email format error");
                return false;
            }

            if(!isMobile(phone.val().trim())){
                error.text("Phone format error");
                return false;
            }

            error.text("");

            $.ajax({
                type: "GET",
                url:  "user/register",
                data: {
                    username: username.val(),
                    password: password.val(),
                    phone: phone.val(),
                    email: email.val(),
                    address: address.val()
                },
                success: function (result) {
                    if (result.flag) {
                        window.location = window.location = "<%=basePath%>/admin";
                    } else {
                        error.text(result.message);
                    }
                },
                error: function (e) {
                    alert("cannot to sever");
                }
            });

        });

        function isEmail(str){
            var reg = /^(\w)+(\.\w+)*@(\w)+((\.\w+)+)$/;
            return reg.test(str);
        }

        function isMobile(str) {
            var re = /^1\d{10}$/
            return re.test(str);
        }

    });

</script>
</html>
