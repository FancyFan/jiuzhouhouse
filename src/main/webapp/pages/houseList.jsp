<%--
  Created by IntelliJ IDEA.
  User: banma82
  Date: 2017/8/11
  Time: 15:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="demo.house.model.User" %>
<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>买新房</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->

    <!-- Styles -->
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700|Poppins:400,600" rel="stylesheet">
    <link rel="shortcut icon" href="../img/logo.jpg">

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
                            <button class="btn btn-warning btn-lg header-btn hidden-sm" onclick="location.href='<%=basePath%>/admin'">管理界面</button>
                        </c:if>
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
                        <li><a href="${ pageContext.request.contextPath }/">首页</a></li>
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
        <h1 class="title wow slideInLeft">寻找房子</h1>
        <ol class="breadcrumb wow slideInRight">
            <li><a href="index.html">Home</a></li>
            <li><a href="property-map-view.html">Listing</a></li>
            <li class="active">Properties Grid</li>
        </ol>
    </div>
</div>
<div id="advance-search" class="main-page clearfix">
    <div class="container">
        <button class="btn top-btn">Find Your Place</button>
        <form action="#" id="adv-search-form" class="clearfix">
            <fieldset>
                <select name="s_province" id="s_province"></select>
                <select name="s_city" id="s_city"></select>
                <select name="s_county" id="s_county"></select>
                <input type="text" placeholder="具体地址" name="address" id="address">
                <select id="property-type" name="type">
                    <option value="">All Types</option>
                    <option value="apartment"> Apartment</option>
                    <option value="condo"> Condo</option>
                    <option value="farm"> Farm</option>
                    <option value="loft"> Loft</option>
                    <option value="lot"> Lot</option>
                    <option value="multi-family-home"> Multi Family Home</option>
                    <option value="single-family-home"> Single Family Home</option>
                    <option value="townhouse"> Townhouse</option>
                    <option value="villa"> Villa</option>
                </select>
                <select name="bedrooms" id="property-beds">
                    <option value="">Beds</option>
                    <option value="1">1</option>
                    <option value="2">2</option>
                    <option value="3">3</option>
                    <option value="4">4</option>
                    <option value="5">5</option>
                    <option value="6">6</option>
                    <option value="7">7</option>
                    <option value="8">8</option>
                    <option value="9">9</option>
                    <option value="10">10</option>
                    <option value="any">Any</option>
                </select>
                <select name="bathrooms" id="property-baths">
                    <option value="">Bathrooms</option>
                    <option value="1">1</option>
                    <option value="2">2</option>
                    <option value="3">3</option>
                    <option value="4">4</option>
                    <option value="5">5</option>
                    <option value="6">6</option>
                    <option value="7">7</option>
                    <option value="8">8</option>
                    <option value="9">9</option>
                    <option value="10">10</option>
                    <option value="any">Any</option>
                </select>
                <input type="text" name="min-area" id="property-min-area" placeholder="Min Area (sqft)">
                <input type="text" name="max-area" id="property-max-area" placeholder="Max Area (sqft)">
                <select name="min-price" id="property-min-price">
                    <option value="any" selected="selected">Min Price</option>
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
                    <option value="5000000">$5000000</option>
                </select>
                <select name="max-price" id="property-max-price">
                    <option value="any" selected="selected">Max Price</option>
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
                    <option value="5000000">$5000000</option>
                    <option value="10000000">$10000000</option>
                </select>
            </fieldset>
            <button type="button" class="btn btn-default btn-lg text-center">Search <br class="hidden-sm hidden-xs">
                查询
            </button>
        </form>
    </div>
</div>
<section id="property-listing">
    <header class="section-header text-center">
        <div class="container">
            <h2 class="pull-left">Showing 1 - 50 of 696 items</h2>
            <div class="pull-right">
                <div class="property-sorting pull-left">
                    <label for="property-sort-dropdown"> Sort by: </label>
                    <select name="property-sort-dropdown" id="property-sort-dropdown">
                        <option value="">Default Order</option>
                        <option value="by_date">By date</option>
                        <option value="by_price">By price</option>
                    </select>
                </div>
                <p class="pull-left layout-view"> View as: <i class="fa fa-th selected" data-layout="4"></i> <i
                        class="fa fa-th-large" data-layout="6"></i><i class="fa fa-list-ul" data-layout="12"></i></p>
            </div>
        </div>
    </header>
    <div class="container section-layout">
        <div class="row">
            <c:forEach items="${houses}" var="house">
                <div class="col-lg-4 col-sm-6 layout-item-wrap">
                    <article class="property layout-item clearfix">
                        <figure class="feature-image">
                            <a class="clearfix zoom" href="single-property.html"><img data-action="zoom"
                                                                                      src="${house.imgSrc}"
                                                                                      alt="Property Image" style="width: 350px;height: 250px"></a>
                            <span class="btn btn-warning btn-sale">出租</span>
                        </figure>
                        <div class="property-contents clearfix">
                            <header class="property-header clearfix">
                                <div class="pull-left">
                                    <h6 class="entry-title"><a href="${ pageContext.request.contextPath }/houseDetail/${house.houseId}">查看详情</a></h6>
                                    <span class="property-location"><i class="fa fa-map-marker"></i> ${house.address}</span>
                                </div>
                                <button class="btn btn-default btn-price pull-right btn-3d" data-hover="${house.price}"><strong>${house.price}</strong>
                                </button>
                            </header>
                            <div class="property-meta clearfix">
                                <span><i class="fa fa-arrows-alt"></i> ${house.area}</span>
                                <span><i class="fa fa-bed"></i> ${house.houseType}</span>
                                <span><i class="fa fa-cab"></i> Yes</span>
                            </div>
                            <div class="contents clearfix">
                                <p>Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor
                                    invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et
                                    accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata
                                    sanctus est Lorem ipsum dolor sit amet. </p>
                            </div>
                            <div class="author-box clearfix">
                                <a href="#" class="author-img"><img src="../js/assets/images/agents/1.jpg"
                                                                    alt="Agent Image"></a>
                                <cite class="author-name">Personal Seller: <a href="#">Linda Garret</a></cite>
                                <span class="phone"><i class="fa fa-phone"></i> 00894 692-49-22</span>
                            </div>
                        </div>
                    </article>
                </div>
            </c:forEach>
        </div>
        <ul id="pagination" class="text-center clearfix">
            <li class="disabled"><a href="#">Previous</a></li>
            <li><a href="#">1</a></li>
            <li><a href="#">3</a></li>
            <li><a href="#">4</a></li>
            <li><a href="#">Next</a></li>

        </ul>
    </div>
</section>
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
<script class="resources library" src="../js/area.js" type="text/javascript"></script>
<script type="text/javascript">
    _init_area();
    var Gid  = document.getElementById ;
    var showArea = function(){
        Gid('show').innerHTML = "<h3>省" + Gid('s_province').value + " - 市" +
            Gid('s_city').value + " - 县/区" +
            Gid('s_county').value + "</h3>"
    }
    Gid('s_county').setAttribute('onchange','showArea()');
</script>
</body>
</html>
