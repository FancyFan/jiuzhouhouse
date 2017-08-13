<%@ page import="demo.house.model.User" %>
<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
    session.removeAttribute("jiuzhouUser");
%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>租房</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->

    <!-- Styles -->
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700|Poppins:400,600" rel="stylesheet">
    <link rel="shortcut icon" href="../img/logo.jpg">
    <link href="../css/style1.css" rel="stylesheet" type="text/css" media="all" />
    <!-- favicon and touch icons -->
    <link rel="shortcut icon" href="../js/assets/images/favicon.png">

    <!-- Bootstrap -->
    <link href="../js/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <link href="../js/plugins/slick/slick.css" rel="stylesheet">
    <link href="../js/plugins/slick-nav/slicknav.css" rel="stylesheet">
    <link href="../js/plugins/wow/animate.css" rel="stylesheet">
    <link href="../js/assets/css/bootstrap.css" rel="stylesheet">
    <link href="../js/assets/css/theme.css" rel="stylesheet">
</head>
<body class="listing-template">
<div id="page-loader">
    <div class="loaders">
        <img src="../js/assets/images/loader/3.gif" alt="First Loader">
        <img src="../js/assets/images/loader/4.gif" alt="First Loader">
    </div>
</div>
<header id="site-header">
    <div id="site-header-top">
        <div class="container">
            <div class="row">
                <div class="col-md-5">
                    <div class="clearfix">
                        <button class="btn btn-warning btn-lg header-btn visible-sm pull-right">List your Property for
                            Free
                        </button>
                        <p class="timing-in-header">周一-周六：9:00 - 18:00</p>
                    </div>
                </div>
                <div class="col-md-7">
                    <div class="clearfix">
                            <button class="btn btn-warning btn-lg header-btn hidden-sm"
                                    onclick="location.href='${ pageContext.request.contextPath }/pages/register.jsp'">注册
                            </button>
                            <button class="btn btn-warning btn-lg header-btn hidden-sm"
                                    onclick="location.href='${ pageContext.request.contextPath }/pages/login.jsp'">登录
                            </button>
                        <div class="language-in-header">
                            <i class="fa fa-globe"></i>
                            <label for="language-dropdown"> 语言:</label>
                            <select name="currency" id="language-dropdown">
                                <option value="CN">中文</option>
                                <option value="AR">英语</option>
                            </select>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="container">
        <div class="row">
            <div class="col-md-3">
                <figure id="site-logo">
                    <a href="index.html"><img src="../js/assets/images/logo.png" alt="Logo"></a>
                </figure>
            </div>
            <div class="col-md-6 col-sm-8">
                <nav id="site-nav" class="nav navbar-default">
                    <ul class="nav navbar-nav">
                        <li><a href="./">首页</a></li>
                        <li><a href="${ pageContext.request.contextPath }/pages/property-listing.jsp">租房</a></li>
                        <li><a href="single-property.html">二手房</a></li>
                        <li><a href="gallery.html">新房</a></li>
                        <li><a href="${ pageContext.request.contextPath }/pages/contact.jsp">联系我们</a></li>
                    </ul>
                </nav>
            </div>
            <div class="col-md-3 col-sm-4">
                <div class="contact-in-header clearfix">
                    <i class="fa fa-mobile"></i>
                    <span>
                        联系我们
                        <br>
                    <strong>111 222 333 444</strong>
                    </span>
                </div>
            </div>
        </div>
    </div>
</header>
<div id="site-banner" class="text-center clearfix">
    <div class="container">
        <h1 class="title wow slideInLeft">登录</h1>
        <ol class="breadcrumb wow slideInRight">
            <li><a href="index.html">Home</a></li>
            <li><a href="property-map-view.html">Listing</a></li>
            <li class="active">Properties Grid</li>
        </ol>
    </div>
</div>
<div class="login-right">
    <div class="container">
        <h3>登录</h3>
        <div class="login-top">
            <ul class="login-icons">
                <li><a href="#" ><i class="facebook"> </i><span>Facebook</span></a></li>
                <li><a href="#" class="twit"><i class="twitter"></i><span>Twitter</span></a></li>
                <li><a href="#" class="go"><i class="google"></i><span>Google +</span></a></li>
                <li><a href="#" class="in"><i class="linkedin"></i><span>Linkedin</span></a></li>
                <div class="clearfix"> </div>
            </ul>
            <div class="form-info">
                <form>
                    <input type="text" class="text" placeholder="账号" id="userName" required="">
                    <input type="password"  placeholder="密码" id="passWord" required="">
                    <label class="hvr-sweep-to-right">
                        <input type="button" value="提交" id="loginBtn">
                    </label>
                </form>
            </div>
            <div class="create">
                <h4>新  用  户  ？</h4>
                <a class="hvr-sweep-to-right" href="./register.jsp">注册</a>
                <div class="clearfix"> </div>
            </div>
        </div>
    </div>
</div>
<footer id="footer">
    <div class="site-footer">
        <div class="container">
            <div class="row">
                <div class="col-md-4 col-sm-6">
                    <section class="widget about-widget clearfix">
                        <h4 class="title hide">关于我们</h4>
                        <a class="footer-logo" href="#"><img src="../js/assets/images/footer-logo.png"
                                                             alt="Footer Logo"></a>
                        <p>我们是一家租房中介服务公司，为每一位顾客真诚服务！</p>
                        <ul class="social-icons clearfix">
                            <li><a href="#"><i class="fa fa-twitter"></i></a></li>
                            <li><a href="#"><i class="fa fa-facebook"></i></a></li>
                            <li><a href="#"><i class="fa fa-pinterest"></i></a></li>
                            <li><a href="#"><i class="fa fa-youtube-play"></i></a></li>
                        </ul>
                    </section>
                </div>
                <div class="col-md-4 col-sm-6">
                    <section class="widget twitter-widget clearfix">
                        <h4 class="title">最新消息</h4>
                        <%--<div id="twitter-feeds" class="clearfix"></div>--%>
                    </section>
                </div>
                <div class="col-md-4 col-sm-6">
                    <section class="widget address-widget clearfix">
                        <h4 class="title">联系信息</h4>
                        <ul>
                            <li><i class="fa fa-map-marker"></i>上海市闵行区东川路500号信息楼316室</li>
                            <li><i class="fa fa-phone"></i> (123) 45678910</li>
                            <li><i class="fa fa-envelope"></i> a847323482@163.com</li>
                            <li><i class="fa fa-fax"></i> +84 962 216 601</li>
                            <li><i class="fa fa-clock-o"></i> 周一 - 周六: 9:00 - 18:00</li>
                        </ul>
                    </section>
                </div>
            </div>
        </div>
    </div>
</footer>
<a href="#top" id="scroll-top"><i class="fa fa-angle-up"></i></a>
<!-- jQuery (necessary for Bootstrap's JavaScript ../js/plugins) -->
<script src="../js/assets/js/jquery.min.js"></script>
<script src="../js/assets/js/jquery.migrate.js"></script>
<script src="../js/assets/js/bootstrap.min.js"></script>
<script src="../js/plugins/slick-nav/jquery.slicknav.min.js"></script>
<script src="../js/plugins/slick/slick.min.js"></script>
<script src="../js/plugins/jquery-ui/jquery-ui.min.js"></script>
<script src="../js/plugins/tweetie/tweetie.js"></script>
<script src="../js/plugins/forms/jquery.form.min.js"></script>
<script src="../js/plugins/forms/jquery.validate.min.js"></script>
<script src="../js/plugins/modernizr/modernizr.custom.js"></script>
<script src="../js/plugins/wow/wow.min.js"></script>
<script src="../js/plugins/zoom/zoom.js"></script>
<script src="../js/plugins/mixitup/mixitup.min.js"></script>
<!---<script src="http://ditu.google.cn/maps/api/js?key=AIzaSyD2MtZynhsvwI2B40juK6SifR_OSyj4aBA&libraries=places"></script>--->
<script src="../js/plugins/whats-nearby/source/WhatsNearby.js"></script>
<script src="../js/assets/js/theme.js"></script>
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

            $.ajax({
                type: "GET",
                url:  "user/login",
                data: {
                    username: username.val(),
                    password: password.val(),
                },
                success: function (result) {
                    if (result.flag) {
                        window.location = "<%=basePath%>/admin";
                    } else {
                        alert("wrong!");
                    }
                },
                error: function (e) {
                    alert("cannot to sever");
                }
            });


        });
    });

</script>
</body>
</html>