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
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <title>九州地产</title>

    <!-- Styles -->
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700|Poppins:400,600" rel="stylesheet">
    <link rel="shortcut icon" href="./js/assets/images/favicon.png" >

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
                        <button class="btn btn-warning btn-lg header-btn visible-sm pull-right">List your Property for Free</button>
                        <p class="timing-in-header">每周一至周日 8：00-18：00</p>
                    </div>
                </div>
                <div class="col-md-7">
                    <div class="clearfix">
                        <button class="btn btn-warning btn-lg header-btn hidden-sm" onclick="location.href='${ pageContext.request.contextPath }/pages/register.jsp'">注册</button>
                        <button class="btn btn-warning btn-lg header-btn hidden-sm" onclick="location.href='${ pageContext.request.contextPath }/pages/login.jsp'">登录</button>
                        <div class="language-in-header">
                            <i class="fa fa-globe"></i>
                            <label for="language-dropdown">语言:</label>
                            <select name="currency" id="language-dropdown">
                                <option value="CH">中文</option>
                                <option value="ENG">英语</option>
                                <%--<option value="UR">UR</option>--%>
                                <%--<option value="NEO">NEO</option>--%>
                                <%--<option value="AKA">AKA</option>--%>
                            </select>
                        </div>
                        <%--<div class="currency-in-header">--%>
                            <%--<i class="fa fa-flag"></i>--%>
                            <%--<label for="currency-dropdown"> Currency: </label>--%>
                            <%--<select name="currency" id="currency-dropdown">--%>
                                <%--<option value="USD">USD</option>--%>
                                <%--<option value="EUR">EUR</option>--%>
                                <%--<option value="AOA">AOA</option>--%>
                                <%--<option value="XCD">XCD</option>--%>
                                <%--<option value="PKR">PKR</option>--%>
                            <%--</select>--%>
                        <%--</div>--%>
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
                        <li><a href="./">首页</a></li>
                        <li><a href="property-listing.html">租房</a></li>
                        <li><a href="single-property.html">二手房</a></li>
                        <li><a href="gallery.html">新房</a></li>
                        <li><a href="./pages/contact.jsp">联系我们</a></li>
                    </ul>
                </nav>
            </div>
            <div class="col-md-3 col-sm-4">
                <div class="contact-in-header clearfix">
                    <i class="fa fa-mobile"></i>
                    <span>
                        立       即       联       系
                        <br>
                    <%--<strong>021-86688788</strong>--%>
                        021-87878787
                    </span>
                </div>
            </div>
        </div>
    </div>
</header><div class="main-slider-wrapper clearfix">
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
        <form action="#" id="adv-search-form" class="clearfix">
            <fieldset>
                <select name="location" id="main-location">
                    <option value="">所有城市</option>
                    <option value="beijing">北京 </option>
                    <option value="shanghai">上海</option>
                    <option value="guangzou"> 广州</option>
                    <option value="shenzhen"> 深圳</option>
                </select>
                <select name="sub-location" id="property-sub-location">
                    <option value="">所有</option>
                    <option value="brickell" > Brickell</option>
                    <option value="brickyard" > Brickyard</option>
                    <option value="bronx" > Bronx</option>
                    <option value="brooklyn" > Brooklyn</option>
                    <option value="coconut-grove" > Coconut Grove</option>
                    <option value="downtown" > Downtown</option>
                    <option value="eagle-rock" > Eagle Rock</option>
                    <option value="englewood" > Englewood</option>
                    <option value="hermosa" > Hermosa</option>
                    <option value="hollywood" > Hollywood </option>
                    <option value="lincoln-park" > Lincoln Park</option>
                    <option value="manhattan" > Manhattan</option>
                    <option value="midtown" > Midtown</option>
                    <option value="queens" > Queens</option>
                    <option value="westwood" > Westwood </option>
                    <option value="wynwood" > Wynwood</option>
                </select>
                <select id="property-status" name="status">
                    <option value="">服务类型</option>
                    <option value="for-rent"> 租房</option>
                    <option value="for-sale"> 买房</option>
                    <option value="foreclosures"> 拍卖</option>
                    <option value="new-listing">二手房</option>
                </select>
                <select id="property-type" name="type" >
                    <option value="">房型</option>
                    <option value="apartment">一室一厅</option>
                    <option value="farm">两室一厅</option>
                    <option value="loft"> 三室一厅</option>
                    <option value="multi-family-home"> 四室一厅</option>
                    <option value="single-family-home"> 三室两厅</option>
                    <option value="townhouse"> 四室两厅</option>
                    <option value="villa"> 别墅</option>
                </select>
                <select name="bedrooms" id="property-beds">
                    <option value="">床位</option>
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
                    <option value="">卫生间</option>
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
                <input type="text" name="min-area" id="property-min-area" placeholder="最小面积">
                <input type="text" name="max-area" id="property-max-area" placeholder="最大面积">
                <select name="min-price" id="property-min-price">
                    <option value="any" selected="selected">最低价</option>
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
                <select name="max-price" id="property-max-price" >
                    <option value="any" selected="selected">最高价</option>
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
            <button type="submit" class="btn btn-default btn-lg text-center">查  询 <br class="hidden-sm hidden-xs"> 条  件</button>
        </form>
    </div>
</div><section id="home-property-listing">
    <header class="section-header home-section-header text-center">
        <div class="container">
            <h2 class="wow slideInRight">Featured Properties</h2>
            <p class="wow slideInLeft">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut <br>
                labore et dolore magna aliquan ut enim ad minim veniam.</p>
        </div>
    </header>
    <div class="container">
        <div class="row">
            <div class="col-lg-4 col-sm-6 layout-item-wrap"><article class="property layout-item clearfix">
                <figure class="feature-image">
                    <a class="clearfix zoom" href="single-property.html"><img data-action="zoom" src="./js/assets/images/property/1.jpg" alt="Property Image"></a>
                    <span class="btn btn-warning btn-sale">for sale</span>
                </figure>
                <div class="property-contents clearfix">
                    <header class="property-header clearfix">
                        <div class="pull-left">
                            <h6 class="entry-title"><a href="single-property.html">Guaranteed modern home</a></h6>
                            <span class="property-location"><i class="fa fa-map-marker"></i> 14 Tottenham Road, London</span>
                        </div>
                        <button class="btn btn-default btn-price pull-right btn-3d" data-hover="$389.000"><strong>$389.000</strong></button>
                    </header>
                    <div class="property-meta clearfix">
                        <span><i class="fa fa-arrows-alt"></i> 3060 SqFt</span>
                        <span><i class="fa fa-bed"></i> 3 Beds</span>
                        <span><i class="fa fa-bathtub"></i> 3 Baths</span>
                        <span><i class="fa fa-cab"></i> Yes</span>
                    </div>
                    <div class="contents clearfix">
                        <p>Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. </p>
                    </div>
                    <div class="author-box clearfix">
                        <a href="#" class="author-img"><img src="./js/assets/images/agents/1.jpg" alt="Agent Image"></a>
                        <cite class="author-name">Personal Seller: <a href="#">Linda Garret</a></cite>
                        <span class="phone"><i class="fa fa-phone"></i> 00894 692-49-22</span>
                    </div>
                </div>
            </article>
            </div><div class="col-lg-4 col-sm-6 layout-item-wrap"><article class="property layout-item clearfix">
            <figure class="feature-image">
                <a class="clearfix zoom" href="single-property.html"><img data-action="zoom" src="./js/assets/images/property/2.jpg" alt="Property Image"></a>
                <span class="btn btn-warning btn-sale">for sale</span>
            </figure>
            <div class="property-contents clearfix">
                <header class="property-header clearfix">
                    <div class="pull-left">
                        <h6 class="entry-title"><a href="single-property.html">Guaranteed modern home</a></h6>
                        <span class="property-location"><i class="fa fa-map-marker"></i> 14 Tottenham Road, London</span>
                    </div>
                    <button class="btn btn-default btn-price pull-right btn-3d" data-hover="$389.000"><strong>$389.000</strong></button>
                </header>
                <div class="property-meta clearfix">
                    <span><i class="fa fa-arrows-alt"></i> 3060 SqFt</span>
                    <span><i class="fa fa-bed"></i> 3 Beds</span>
                    <span><i class="fa fa-bathtub"></i> 3 Baths</span>
                    <span><i class="fa fa-cab"></i> Yes</span>
                </div>
                <div class="contents clearfix">
                    <p>Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. </p>
                </div>
                <div class="author-box clearfix">
                    <a href="#" class="author-img"><img src="./js/assets/images/agents/1.jpg" alt="Agent Image"></a>
                    <cite class="author-name">Personal Seller: <a href="#">Linda Garret</a></cite>
                    <span class="phone"><i class="fa fa-phone"></i> 00894 692-49-22</span>
                </div>
            </div>
        </article>
        </div><div class="col-lg-4 col-sm-6 layout-item-wrap"><article class="property layout-item clearfix">
            <figure class="feature-image">
                <a class="clearfix zoom" href="single-property.html"><img data-action="zoom" src="./js/assets/images/property/3.jpg" alt="Property Image"></a>
                <span class="btn btn-warning btn-sale">for sale</span>
            </figure>
            <div class="property-contents clearfix">
                <header class="property-header clearfix">
                    <div class="pull-left">
                        <h6 class="entry-title"><a href="single-property.html">Guaranteed modern home</a></h6>
                        <span class="property-location"><i class="fa fa-map-marker"></i> 14 Tottenham Road, London</span>
                    </div>
                    <button class="btn btn-default btn-price pull-right btn-3d" data-hover="$389.000"><strong>$389.000</strong></button>
                </header>
                <div class="property-meta clearfix">
                    <span><i class="fa fa-arrows-alt"></i> 3060 SqFt</span>
                    <span><i class="fa fa-bed"></i> 3 Beds</span>
                    <span><i class="fa fa-bathtub"></i> 3 Baths</span>
                    <span><i class="fa fa-cab"></i> Yes</span>
                </div>
                <div class="contents clearfix">
                    <p>Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. </p>
                </div>
                <div class="author-box clearfix">
                    <a href="#" class="author-img"><img src="./js/assets/images/agents/1.jpg" alt="Agent Image"></a>
                    <cite class="author-name">Personal Seller: <a href="#">Linda Garret</a></cite>
                    <span class="phone"><i class="fa fa-phone"></i> 00894 692-49-22</span>
                </div>
            </div>
        </article>
        </div><div class="col-lg-4 col-sm-6 layout-item-wrap"><article class="property layout-item clearfix">
            <figure class="feature-image">
                <a class="clearfix zoom" href="single-property.html"><img data-action="zoom" src="./js/assets/images/property/4.jpg" alt="Property Image"></a>
                <span class="btn btn-warning btn-sale">for sale</span>
            </figure>
            <div class="property-contents clearfix">
                <header class="property-header clearfix">
                    <div class="pull-left">
                        <h6 class="entry-title"><a href="single-property.html">Guaranteed modern home</a></h6>
                        <span class="property-location"><i class="fa fa-map-marker"></i> 14 Tottenham Road, London</span>
                    </div>
                    <button class="btn btn-default btn-price pull-right btn-3d" data-hover="$389.000"><strong>$389.000</strong></button>
                </header>
                <div class="property-meta clearfix">
                    <span><i class="fa fa-arrows-alt"></i> 3060 SqFt</span>
                    <span><i class="fa fa-bed"></i> 3 Beds</span>
                    <span><i class="fa fa-bathtub"></i> 3 Baths</span>
                    <span><i class="fa fa-cab"></i> Yes</span>
                </div>
                <div class="contents clearfix">
                    <p>Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. </p>
                </div>
                <div class="author-box clearfix">
                    <a href="#" class="author-img"><img src="./js/assets/images/agents/1.jpg" alt="Agent Image"></a>
                    <cite class="author-name">Personal Seller: <a href="#">Linda Garret</a></cite>
                    <span class="phone"><i class="fa fa-phone"></i> 00894 692-49-22</span>
                </div>
            </div>
        </article>
        </div><div class="col-lg-4 col-sm-6 layout-item-wrap"><article class="property layout-item clearfix">
            <figure class="feature-image">
                <a class="clearfix zoom" href="single-property.html"><img data-action="zoom" src="./js/assets/images/property/5.jpg" alt="Property Image"></a>
                <span class="btn btn-warning btn-sale">for sale</span>
            </figure>
            <div class="property-contents clearfix">
                <header class="property-header clearfix">
                    <div class="pull-left">
                        <h6 class="entry-title"><a href="single-property.html">Guaranteed modern home</a></h6>
                        <span class="property-location"><i class="fa fa-map-marker"></i> 14 Tottenham Road, London</span>
                    </div>
                    <button class="btn btn-default btn-price pull-right btn-3d" data-hover="$389.000"><strong>$389.000</strong></button>
                </header>
                <div class="property-meta clearfix">
                    <span><i class="fa fa-arrows-alt"></i> 3060 SqFt</span>
                    <span><i class="fa fa-bed"></i> 3 Beds</span>
                    <span><i class="fa fa-bathtub"></i> 3 Baths</span>
                    <span><i class="fa fa-cab"></i> Yes</span>
                </div>
                <div class="contents clearfix">
                    <p>Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. </p>
                </div>
                <div class="author-box clearfix">
                    <a href="#" class="author-img"><img src="./js/assets/images/agents/1.jpg" alt="Agent Image"></a>
                    <cite class="author-name">Personal Seller: <a href="#">Linda Garret</a></cite>
                    <span class="phone"><i class="fa fa-phone"></i> 00894 692-49-22</span>
                </div>
            </div>
        </article>
        </div><div class="col-lg-4 col-sm-6 layout-item-wrap"><article class="property layout-item clearfix">
            <figure class="feature-image">
                <a class="clearfix zoom" href="single-property.html"><img data-action="zoom" src="./js/assets/images/property/6.jpg" alt="Property Image"></a>
                <span class="btn btn-warning btn-sale">for sale</span>
            </figure>
            <div class="property-contents clearfix">
                <header class="property-header clearfix">
                    <div class="pull-left">
                        <h6 class="entry-title"><a href="single-property.html">Guaranteed modern home</a></h6>
                        <span class="property-location"><i class="fa fa-map-marker"></i> 14 Tottenham Road, London</span>
                    </div>
                    <button class="btn btn-default btn-price pull-right btn-3d" data-hover="$389.000"><strong>$389.000</strong></button>
                </header>
                <div class="property-meta clearfix">
                    <span><i class="fa fa-arrows-alt"></i> 3060 SqFt</span>
                    <span><i class="fa fa-bed"></i> 3 Beds</span>
                    <span><i class="fa fa-bathtub"></i> 3 Baths</span>
                    <span><i class="fa fa-cab"></i> Yes</span>
                </div>
                <div class="contents clearfix">
                    <p>Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. </p>
                </div>
                <div class="author-box clearfix">
                    <a href="#" class="author-img"><img src="./js/assets/images/agents/1.jpg" alt="Agent Image"></a>
                    <cite class="author-name">Personal Seller: <a href="#">Linda Garret</a></cite>
                    <span class="phone"><i class="fa fa-phone"></i> 00894 692-49-22</span>
                </div>
            </div>
        </article>
        </div>        </div>
    </div>
</section>
<section id="announcement-section" class="text-center">
    <div class="container ">
        <h2 class="title wow slideInLeft">Download Our Latest App</h2>
        <p class="wow slideInRight">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut <br>
            labore et dolore magna aliquan ut enim ad minim veniam.</p>
        <a class="btn" href="#"><img src="./js/assets/images/iso-btn.png" alt="ISO Button"></a>
        <a class="btn" href="#"><img src="./js/assets/images/playstore-btn.png" alt="Play Store Button"></a>
    </div>
</section><section id="home-property-for-rent-listing">
    <header class="section-header home-section-header text-center">
        <div class="container">
            <h2 class="wow slideInLeft">Office For Rent</h2>
            <p class="wow slideInRight">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut <br>
                labore et dolore magna aliquan ut enim ad minim veniam.</p>
        </div>
    </header>
    <div class="container">
        <div class="row">
            <div id="property-for-rent-slider">
                <div class="col-lg-4 col-md-6"><article class="property clearfix">
                    <figure class="feature-image">
                        <a class="clearfix" href="single-property.html"> <img src="./js/assets/images/property/1.jpg" alt="Property Image"></a>
                    </figure>
                    <div class="property-contents">
                        <header class="property-header clearfix">
                            <div class="pull-left">
                                <h6 class="entry-title"><a href="single-property.html">Guaranteed modern home</a></h6>
                                <span class="property-location"><i class="fa fa-map-marker"></i> 14 Tottenham Road, London</span>
                            </div>
                            <button class="btn btn-default btn-price pull-right btn-3d" data-hover="$389.000"><strong>$389.000</strong></button>
                        </header>
                        <div class="property-meta clearfix">
                            <span><i class="fa fa-arrows-alt"></i> 3060 SqFt</span>
                            <span><i class="fa fa-bed"></i> 3 Beds</span>
                            <span><i class="fa fa-bathtub"></i> 3 Baths</span>
                            <span><i class="fa fa-cab"></i> Yes</span>
                        </div>
                    </div>
                </article></div><div class="col-lg-4 col-md-6"><article class="property clearfix">
                <figure class="feature-image">
                    <a class="clearfix" href="single-property.html"> <img src="./js/assets/images/property/2.jpg" alt="Property Image"></a>
                </figure>
                <div class="property-contents">
                    <header class="property-header clearfix">
                        <div class="pull-left">
                            <h6 class="entry-title"><a href="single-property.html">Guaranteed modern home</a></h6>
                            <span class="property-location"><i class="fa fa-map-marker"></i> 14 Tottenham Road, London</span>
                        </div>
                        <button class="btn btn-default btn-price pull-right btn-3d" data-hover="$389.000"><strong>$389.000</strong></button>
                    </header>
                    <div class="property-meta clearfix">
                        <span><i class="fa fa-arrows-alt"></i> 3060 SqFt</span>
                        <span><i class="fa fa-bed"></i> 3 Beds</span>
                        <span><i class="fa fa-bathtub"></i> 3 Baths</span>
                        <span><i class="fa fa-cab"></i> Yes</span>
                    </div>
                </div>
            </article></div><div class="col-lg-4 col-md-6"><article class="property clearfix">
                <figure class="feature-image">
                    <a class="clearfix" href="single-property.html"> <img src="./js/assets/images/property/3.jpg" alt="Property Image"></a>
                </figure>
                <div class="property-contents">
                    <header class="property-header clearfix">
                        <div class="pull-left">
                            <h6 class="entry-title"><a href="single-property.html">Guaranteed modern home</a></h6>
                            <span class="property-location"><i class="fa fa-map-marker"></i> 14 Tottenham Road, London</span>
                        </div>
                        <button class="btn btn-default btn-price pull-right btn-3d" data-hover="$389.000"><strong>$389.000</strong></button>
                    </header>
                    <div class="property-meta clearfix">
                        <span><i class="fa fa-arrows-alt"></i> 3060 SqFt</span>
                        <span><i class="fa fa-bed"></i> 3 Beds</span>
                        <span><i class="fa fa-bathtub"></i> 3 Baths</span>
                        <span><i class="fa fa-cab"></i> Yes</span>
                    </div>
                </div>
            </article></div><div class="col-lg-4 col-md-6"><article class="property clearfix">
                <figure class="feature-image">
                    <a class="clearfix" href="single-property.html"> <img src="./js/assets/images/property/4.jpg" alt="Property Image"></a>
                </figure>
                <div class="property-contents">
                    <header class="property-header clearfix">
                        <div class="pull-left">
                            <h6 class="entry-title"><a href="single-property.html">Guaranteed modern home</a></h6>
                            <span class="property-location"><i class="fa fa-map-marker"></i> 14 Tottenham Road, London</span>
                        </div>
                        <button class="btn btn-default btn-price pull-right btn-3d" data-hover="$389.000"><strong>$389.000</strong></button>
                    </header>
                    <div class="property-meta clearfix">
                        <span><i class="fa fa-arrows-alt"></i> 3060 SqFt</span>
                        <span><i class="fa fa-bed"></i> 3 Beds</span>
                        <span><i class="fa fa-bathtub"></i> 3 Baths</span>
                        <span><i class="fa fa-cab"></i> Yes</span>
                    </div>
                </div>
            </article></div><div class="col-lg-4 col-md-6"><article class="property clearfix">
                <figure class="feature-image">
                    <a class="clearfix" href="single-property.html"> <img src="./js/assets/images/property/5.jpg" alt="Property Image"></a>
                </figure>
                <div class="property-contents">
                    <header class="property-header clearfix">
                        <div class="pull-left">
                            <h6 class="entry-title"><a href="single-property.html">Guaranteed modern home</a></h6>
                            <span class="property-location"><i class="fa fa-map-marker"></i> 14 Tottenham Road, London</span>
                        </div>
                        <button class="btn btn-default btn-price pull-right btn-3d" data-hover="$389.000"><strong>$389.000</strong></button>
                    </header>
                    <div class="property-meta clearfix">
                        <span><i class="fa fa-arrows-alt"></i> 3060 SqFt</span>
                        <span><i class="fa fa-bed"></i> 3 Beds</span>
                        <span><i class="fa fa-bathtub"></i> 3 Baths</span>
                        <span><i class="fa fa-cab"></i> Yes</span>
                    </div>
                </div>
            </article></div><div class="col-lg-4 col-md-6"><article class="property clearfix">
                <figure class="feature-image">
                    <a class="clearfix" href="single-property.html"> <img src="./js/assets/images/property/6.jpg" alt="Property Image"></a>
                </figure>
                <div class="property-contents">
                    <header class="property-header clearfix">
                        <div class="pull-left">
                            <h6 class="entry-title"><a href="single-property.html">Guaranteed modern home</a></h6>
                            <span class="property-location"><i class="fa fa-map-marker"></i> 14 Tottenham Road, London</span>
                        </div>
                        <button class="btn btn-default btn-price pull-right btn-3d" data-hover="$389.000"><strong>$389.000</strong></button>
                    </header>
                    <div class="property-meta clearfix">
                        <span><i class="fa fa-arrows-alt"></i> 3060 SqFt</span>
                        <span><i class="fa fa-bed"></i> 3 Beds</span>
                        <span><i class="fa fa-bathtub"></i> 3 Baths</span>
                        <span><i class="fa fa-cab"></i> Yes</span>
                    </div>
                </div>
            </article></div>            </div>
        </div>
    </div>
</section><section id="home-features-section" class="text-center">
    <header class="section-header home-section-header">
        <div class="container">
            <h2 class="wow slideInRight">WHY CHOOSE US</h2>
            <p class="wow slideInLeft">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut <br>
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
</section><footer id="footer">
    <div class="site-footer">
        <div class="container">
            <div class="row">
                <div class="col-md-4 col-sm-6">
                    <section class="widget about-widget clearfix">
                        <h4 class="title hide">About Us</h4>
                        <a class="footer-logo" href="#"><img src="./js/assets/images/footer-logo.png" alt="Footer Logo"></a>
                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi</p>
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
                        <h4 class="title">Latest Tweets</h4>
                        <div id="twitter-feeds" class="clearfix"></div>
                    </section>
                </div>
                <div class="col-md-4 col-sm-6">
                    <section class="widget address-widget clearfix">
                        <h4 class="title">OUR OFFICE</h4>
                        <ul>
                            <li><i class="fa fa-map-marker"></i> 4 Tottenham Road, London, England.</li>
                            <li><i class="fa fa-phone"></i> (123) 45678910</li>
                            <li><i class="fa fa-envelope"></i> huycoi.art@gmail.com</li>
                            <li><i class="fa fa-fax"></i> +84 962 216 601</li>
                            <li><i class="fa fa-clock-o"></i> Mon - Sat: 9:00 - 18:00</li>
                        </ul>
                    </section>
                </div>
            </div>
        </div>
    </div>
    <div class="site-footer-bottom">
        <div class="container">
            <p class="copyright pull-left wow slideInRight">Copyright &copy; 2017.Company name All rights reserved.<a target="_blank" href="http://sc.chinaz.com/moban/">&#x7F51;&#x9875;&#x6A21;&#x677F;</a></p>
            <nav class="footer-nav pull-right wow slideInLeft">
                <ul>
                    <li><a href="#">Terms & Conditions</a></li>
                    <li><a href="#">Pricing</a></li>
                    <li><a href="#">Contact</a></li>
                </ul>
            </nav>
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
</body>
</html>
