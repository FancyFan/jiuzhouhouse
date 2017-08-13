<%@ page import="demo.house.model.User" %>
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
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>九州地产</title>

    <!-- Styles -->
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700|Poppins:400,600" rel="stylesheet">
    <link rel="shortcut icon" href="./img/logo.jpg">

    <!-- Bootstrap -->
    <link href="./js/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <link href="./js/plugins/slick/slick.css" rel="stylesheet">
    <link href="./js/plugins/slick-nav/slicknav.css" rel="stylesheet">
    <link href="./js/plugins/wow/animate.css" rel="stylesheet">
    <link href="./js/assets/css/bootstrap.css" rel="stylesheet">
    <link href="./js/assets/css/theme.css" rel="stylesheet">

</head>
<body class="">
<div id="page-loader">
    <div class="loaders">
        <img src="./js/assets/images/loader/3.gif" alt="First Loader">
        <img src="./js/assets/images/loader/4.gif" alt="First Loader">
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
                        <p class="timing-in-header">每周一至周日 8：00-18：00</p>
                    </div>
                </div>
                <div class="col-md-7">
                    <div class="clearfix">
                        <c:if test="${empty sessionScope.get('jiuzhouUser')}">
                            <button class="btn btn-warning btn-lg header-btn hidden-sm"
                                    onclick="location.href='${ pageContext.request.contextPath }/pages/register.jsp'">注册
                            </button>
                            <button class="btn btn-warning btn-lg header-btn hidden-sm"
                                    onclick="location.href='${ pageContext.request.contextPath }/pages/login.jsp'">登录
                            </button>
                        </c:if>
                        <c:if test="${ not empty sessionScope.get('jiuzhouUser')}">
                            <button class="btn btn-warning btn-lg header-btn hidden-sm"
                                    onclick="location.href='${ pageContext.request.contextPath }/pages/login.jsp'">
                                你好,<%= ((User) session.getAttribute("jiuzhouUser")).getUserName()%>注销
                            </button>
                        </c:if>
                        <div class="language-in-header">
                            <i class="fa fa-globe"></i>
                            <label for="language-dropdown">语言:</label>
                            <select name="currency" id="language-dropdown">
                                <option value="CH">中文</option>
                                <option value="ENG">英语</option>
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
                    <a href="index.html"><img src="./js/assets/images/logo.png" alt="Logo"></a>
                </figure>
            </div>
            <div class="col-md-6 col-sm-8">
                <nav id="site-nav" class="nav navbar-default">
                    <ul class="nav navbar-nav">
                        <li><a href="${ pageContext.request.contextPath }/">首页</a></li>
                        <li><a href="${ pageContext.request.contextPath }/pages/property-listing.jsp">租房</a></li>
                        <li><a href="single-property.html">二手房</a></li>
                        <li><a href="${ pageContext.request.contextPath }/house/houseList">新房</a></li>
                        <li><a href="${ pageContext.request.contextPath }/pages/contact.jsp">联系我们</a></li>
                    </ul>
                </nav>
            </div>
            <div class="col-md-3 col-sm-4">
                <div class="contact-in-header clearfix">
                    <i class="fa fa-mobile"></i>
                    <span>
                        立       即       联       系
                        <br>
                    <strong>021-86688788</strong>
                    </span>
                </div>
            </div>
        </div>
    </div>
</header>
<div class="main-slider-wrapper clearfix">
    <div id="main-slider">
        <div class="slide"><img src="./js/assets/images/slider/1.jpg" alt="Slide"></div>
        <div class="slide"><img src="./js/assets/images/slider/2.jpg" alt="Slide"></div>
        <div class="slide"><img src="./js/assets/images/slider/3.jpg" alt="Slide"></div>
        <div class="slide"><img src="./js/assets/images/slider/4.jpg" alt="Slide"></div>
    </div>
    <div id="slider-contents">
        <div class="container text-center">
            <div class="jumbotron">
                <h1>寻找你理想的房子</h1>
                <div class="contents clearfix">
                    <p>一个你理想中的家园，有着独特的设计 <br>
                        能够充分的利用地理优势</p>
                </div>
                <a class="btn btn-warning btn-lg btn-3d" data-hover="我们的服务" href="#" role="button">我们的服务</a>
                <a class="btn btn-default btn-border btn-lg" href="#" role="button">我们的报价</a>
            </div>
        </div>
    </div>
</div>
<div id="advance-search" class="main-page clearfix">
    <div class="container">
        <button class="btn top-btn">查找房子</button>
        <form action="<%=contextPath%>/house/search" id="adv-search-form" class="clearfix" method="post">
            <fieldset>
                <select name="province" id="s_province"></select>
                <select name="city" id="s_city"></select>
                <select name="county" id="s_county"></select>
                <input type="text" placeholder="具体地址" name="address" id="address">
                <select id="status" name="status">
                    <option value="买房"> 买房</option>
                    <option value="二手房">二手房</option>
                    <option value="租房"> 租房</option>
                </select>
                <select id="houseType" name="houseType">
                    <option value="">房型</option>
                    <option value="一室一厅">一室一厅</option>
                    <option value="两室一厅">两室一厅</option>
                    <option value="三室一厅"> 三室一厅</option>
                    <option value="四室一厅"> 四室一厅</option>
                    <option value="三室两厅"> 三室两厅</option>
                    <option value="四室两厅"> 四室两厅</option>
                    <option value="别墅"> 别墅</option>
                </select>
                <input type="text" name="minArea" id="minArea" placeholder="最小面积">
                <input type="text" name="maxArea" id="maxArea" placeholder="最大面积">
                <select name="minPrice" id="minPrice">
                    <option value="" selected="selected">最低价</option>
                    <option value="1000">$1000</option>
                    <option value="5000">$5000</option>
                    <option value="10000">$10000</option>
                    <option value="50000">$50000</option>
                    <option value="100000">$100000</option>
                    <option value="200000">$200000</option>
                    <option value="300000">$300000</option>
                    <option value="400000">$400000</option>
                    <option value="500000">$500000</option>
                    <option value="600000">$600000</option>
                    <option value="700000">$700000</option>
                    <option value="800000">$800000</option>
                    <option value="900000">$900000</option>
                    <option value="1000000">$1000000</option>
                    <option value="1500000">$1500000</option>
                    <option value="2000000">$2000000</option>
                    <option value="2500000">$2500000</option>
                    <option value="3000000">$3000000</option>
                    <option value="4000000">$4000000</option>
                    <option value="5000000">$5000000</option>
                    <option value="6000000">$6000000</option>
                    <option value="7000000">$7000000</option>
                    <option value="8000000">$8000000</option>
                    <option value="9000000">$9000000</option>
                    <option value="10000000">$10000000</option>
                    <option value="15000000">$15000000</option>
                    <option value="20000000">$20000000</option>
                    <option value="25000000">$25000000</option>
                    <option value="50000000">$50000000</option>
                </select>
                <select name="maxPrice" id="maxPrice">
                    <option value="" selected="selected">最高价</option>
                    <option value="5000">$5000</option>
                    <option value="10000">$10000</option>
                    <option value="50000">$50000</option>
                    <option value="100000">$100000</option>
                    <option value="200000">$200000</option>
                    <option value="300000">$300000</option>
                    <option value="400000">$400000</option>
                    <option value="500000">$500000</option>
                    <option value="600000">$600000</option>
                    <option value="700000">$700000</option>
                    <option value="800000">$800000</option>
                    <option value="900000">$900000</option>
                    <option value="1000000">$1000000</option>
                    <option value="1500000">$1500000</option>
                    <option value="2000000">$2000000</option>
                    <option value="2500000">$2500000</option>
                    <option value="3000000">$3000000</option>
                    <option value="4000000">$4000000</option>
                    <option value="5000000">$5000000</option>
                    <option value="6000000">$6000000</option>
                    <option value="7000000">$7000000</option>
                    <option value="8000000">$8000000</option>
                    <option value="9000000">$9000000</option>
                    <option value="10000000">$10000000</option>
                    <option value="15000000">$15000000</option>
                    <option value="20000000">$20000000</option>
                    <option value="25000000">$25000000</option>
                    <option value="50000000">$50000000</option>
                    <option value="80000000">$80000000</option>
                </select>
            </fieldset>
            <button type="submit" class="btn btn-default btn-lg text-center">查 询 <br class="hidden-sm hidden-xs"> 条 件
            </button>
        </form>
    </div>
</div>
<section id="home-property-listing">
    <header class="section-header home-section-header text-center">
        <div class="container">
            <h2 class="wow slideInRight">优质房源</h2>
            <p class="wow slideInLeft">我们向您推荐最新最适合的房子 <br>
                下面每一套房子都是我们精心为您准备的，第一时间向您进行推荐。</p>
        </div>
    </header>
    <div class="container">
        <div class="row">
            <c:forEach items="${houses}" var="house">
                <div class="col-lg-4 col-sm-6 layout-item-wrap">
                    <article class="property layout-item clearfix">
                        <figure class="feature-image">
                            <a class="clearfix zoom" href="single-property.html"><img data-action="zoom"
                                                                                      src="${house.imgSrc}"
                                                                                      alt="Property Image"
                                                                                      style="width:350px;height: 250px"></a>
                            <span class="btn btn-warning btn-sale">出租</span>
                        </figure>
                        <div class="property-contents clearfix">
                            <header class="property-header clearfix">
                                <div class="pull-left">
                                    <h6 class="entry-title"><a href="single-property.html">查看详情</a></h6>
                                    <span class="property-location"><i
                                            class="fa fa-map-marker"></i> ${house.address}</span>
                                </div>
                                <button class="btn btn-default btn-price pull-right btn-3d" data-hover="${house.price}">
                                    <strong>${house.price}</strong>
                                </button>
                            </header>
                            <div class="property-meta clearfix">
                                <span><i class="fa fa-arrows-alt"></i> ${house.area}</span>
                                <span><i class="fa fa-bed"></i> ${house.houseType}</span>
                                <span><i class="fa fa-cab"></i> Yes</span>
                            </div>
                        </div>
                    </article>
                </div>
            </c:forEach>
        </div>
    </div>
</section>
<section id="announcement-section" class="text-center">
    <div class="container ">
        <h2 class="title wow slideInLeft">Download Our Latest App</h2>
        <p class="wow slideInRight">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor
            incididunt ut <br>
            labore et dolore magna aliquan ut enim ad minim veniam.</p>
        <a class="btn" href="#"><img src="./js/assets/images/iso-btn.png" alt="ISO Button"></a>
        <a class="btn" href="#"><img src="./js/assets/images/playstore-btn.png" alt="Play Store Button"></a>
    </div>
</section>
<section id="home-property-for-rent-listing">
    <header class="section-header home-section-header text-center">
        <div class="container">
            <h2 class="wow slideInLeft">房屋出租</h2>
            <p class="wow slideInRight">作为一个诚信公司，<br>
                我们为您推荐的每一套房子都是性价比非常高的</p>
        </div>
    </header>
    <div class="container">
        <div class="row">
            <div id="property-for-rent-slider">
                <c:forEach var="house" items="${houses}">
                    <div class="col-lg-4 col-md-6">
                        <article class="property clearfix">
                            <figure class="feature-image">
                                <a class="clearfix" href="single-property.html"> <img
                                        src="${house.imgSrc}" alt="Property Image"
                                        style="height: 250px;width: 350px"></a>
                            </figure>
                            <div class="property-contents">
                                <header class="property-header clearfix">
                                    <div class="pull-left">
                                        <h6 class="entry-title"><a href="single-property.html">查看详情</a>
                                        </h6>
                                        <span class="property-location"><i
                                                class="fa fa-map-marker"></i> ${house.address}</span>
                                    </div>
                                    <button class="btn btn-default btn-price pull-right btn-3d"
                                            data-hover="${house.price}">
                                        <strong>${house.price}</strong></button>
                                </header>
                                <div class="property-meta clearfix">
                                    <span><i class="fa fa-arrows-alt"></i> ${house.area}</span>
                                    <span><i class="fa fa-bed"></i> ${house.houseType}</span>
                                    <span><i class="fa fa-cab"></i> Yes</span>
                                </div>
                            </div>
                        </article>
                    </div>
                </c:forEach>
            </div>
        </div>
    </div>
</section>
<section id="home-features-section" class="text-center">
    <header class="section-header home-section-header">
        <div class="container">
            <h2 class="wow slideInRight">WHY CHOOSE US</h2>
            <p class="wow slideInLeft">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor
                incididunt ut <br>
                labore et dolore magna aliquan ut enim ad minim veniam.</p>
        </div>
    </header>
    <div class="container">
        <div class="row">
            <div class="col-md-3 col-xs-6">
                <div class="feature clearfix">
                    <i class="icon"><img src="./js/assets/images/features/1.png" alt="Feature Icon"></i>
                    <h6 class="entry-title">Paying guest</h6>
                    <p>Dolor sit amet consectetuer sed diam nonummy euismod tincidunt laoreet dolore magna</p>
                </div>
            </div>
            <div class="col-md-3 col-xs-6">
                <div class="feature clearfix">
                    <i class="icon"><img src="./js/assets/images/features/2.png" alt="Feature Icon"></i>
                    <h6 class="entry-title">Paying guest</h6>
                    <p>Dolor sit amet consectetuer sed diam nonummy euismod tincidunt laoreet dolore magna</p>
                </div>
            </div>
            <div class="col-md-3 col-xs-6">
                <div class="feature clearfix">
                    <i class="icon"><img src="./js/assets/images/features/3.png" alt="Feature Icon"></i>
                    <h6 class="entry-title">Paying guest</h6>
                    <p>Dolor sit amet consectetuer sed diam nonummy euismod tincidunt laoreet dolore magna</p>
                </div>
            </div>
            <div class="col-md-3 col-xs-6">
                <div class="feature clearfix">
                    <i class="icon"><img src="./js/assets/images/features/4.png" alt="Feature Icon"></i>
                    <h6 class="entry-title">Paying guest</h6>
                    <p>Dolor sit amet consectetuer sed diam nonummy euismod tincidunt laoreet dolore magna</p>
                </div>
            </div>
        </div>
    </div>
</section>
<footer id="footer">
    <div class="site-footer">
        <div class="container">
            <div class="row">
                <div class="col-md-4 col-sm-6">
                    <section class="widget about-widget clearfix">
                        <h4 class="title hide">关于我们</h4>
                        <a class="footer-logo" href="#"><img src="./js/assets/images/footer-logo.png" alt="Footer Logo"></a>
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
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="./js/assets/js/jquery.min.js"></script>
<script src="./js/assets/js/jquery.migrate.js"></script>
<script src="./js/assets/js/bootstrap.min.js"></script>
<script src="./js/plugins/slick-nav/jquery.slicknav.min.js"></script>
<script src="./js/plugins/slick/slick.min.js"></script>
<script src="./js/plugins/jquery-ui/jquery-ui.min.js"></script>
<script src="./js/plugins/tweetie/tweetie.js"></script>
<script src="./js/plugins/forms/jquery.form.min.js"></script>
<script src="./js/plugins/forms/jquery.validate.min.js"></script>
<script src="./js/plugins/modernizr/modernizr.custom.js"></script>
<script src="./js/plugins/wow/wow.min.js"></script>
<script src="./js/plugins/zoom/zoom.js"></script>
<script src="./js/plugins/mixitup/mixitup.min.js"></script>
<!---<script src="http://ditu.google.cn/maps/api/js?key=AIzaSyD2MtZynhsvwI2B40juK6SifR_OSyj4aBA&libraries=places"></script>--->
<script src="./js/plugins/whats-nearby/source/WhatsNearby.js"></script>
<script src="./js/assets/js/theme.js"></script>
<script class="resources library" src="./js/area.js" type="text/javascript"></script>
<script type="text/javascript">
    _init_area();
    var Gid = document.getElementById;
    var showArea = function () {
        Gid('show').innerHTML = "<h3>省" + Gid('s_province').value + " - 市" +
            Gid('s_city').value + " - 县/区" +
            Gid('s_county').value + "</h3>"
    }
    Gid('s_county').setAttribute('onchange', 'showArea()');
    function searchForHouse() {
        var province = $("#s_province").val();
        var city = $("#s_city").val();
        var county = $("#s_county").val();
        var address = $("#address").val();
        var status = $("#property-status").val();
        var houseType = $("#houseType").val();
        var minArea = $("#property-min-area").val();
        var maxArea = $("#property-max-area").val();
        var minPrice = $("#property-min-price").val();
        var maxPrice = $("#property-max-price").val();
        if (minArea != null && maxArea != null && (minArea > maxArea))return;
        if (minPrice != null && maxPrice != null && (minPrice > maxPrice))return;
        if (minArea < 0 || maxArea <= 0)return;

        console.log(province);
        console.log(city);
        console.log(county);
        console.log(address);
        console.log(status);
        console.log(houseType);
        console.log(minArea);
        console.log(maxArea);
        console.log(minPrice);
        console.log(maxPrice);
    }
</script>
</body>
</html>
