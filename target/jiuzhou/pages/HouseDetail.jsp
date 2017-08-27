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
    <title>房屋详情</title>
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
    <script type="text/javascript"
            src="http://api.map.baidu.com/api?v=2.0&ak=mkKoxpK14h2zsHssGZRDUyZemd062g8W"></script>
</head>
<body class="">
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
                            <button class="btn btn-warning btn-lg header-btn hidden-sm"
                                    onclick="location.href='<%=basePath%>/admin'">管理界面
                            </button>
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
                        <li><a href="${ pageContext.request.contextPath }/house/houseList">买房</a></li>
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
<div id="property-single">
    <div>
        <div class="slide"><img src="../js/assets/images/slider/1.jpg" alt="Slide"></div>
    </div>
    <div class="container">
        <div class="row">
            <div class="col-lg-8 col-md-7">
                <section class="property-contents common">
                    <div class="entry-title clearfix">
                        <h4 class="pull-left">房屋图片</h4>
                    </div>
                    <div id="main-slider">
                        <c:forEach var="img" items="${list}">
                            <div class="slide"><img src="${img}" alt="Slide" style="height:350px;width: 100%;"></div>
                        </c:forEach>
                    </div>
                </section>
                <section class="property-meta-wrapper common">
                    <h3 class="entry-title">房屋详情</h3>
                    <div class="property-single-meta">
                        <ul class="clearfix">
                            <li><span>售价(元) :</span> ${house.price}</li>
                            <li><span>房屋面积(平米) :</span> ${house.area}</li>
                            <li><span>房屋编号 :</span> ${house.houseId}</li>
                            <li><span>房屋类型 :</span>${house.houseType}</li>
                            <li><span>所在省 :</span>${house.province}</li>
                            <li><span>所在市 :</span>${house.city}</li>
                            <li><span>所在县区 :</span>${house.county}</li>
                            <li><span>具体地址 :</span>${house.address}</li>
                        </ul>
                    </div>
                </section>

                <section class="property-nearby-places common">
                    <h4 class="entry-title">周边配套</h4>
                    <div id="nearby-places-map">
                        <div id="map">
                            <div id="dituContent" style="width:100%;height: 300px"></div>
                        </div>
                    </div>
                </section>
                <section class="property-agent common">
                    <h4 class="entry-title">联系人</h4>
                    <div class="row">
                        <div class="col-lg-7">
                            <div class="agent-box clearfix">
                                <div class="row">
                                    <div class="col-sm-5 col-xs-5">
                                        <a href="#" class="agent-image"><img src="../js/assets/images/agents/2.jpg"
                                                                             alt="Agent Image"></a>
                                    </div>
                                    <div class="col-sm-7 col-xs-7">
                                        <cite class="agent-name">张三</cite>
                                        <small class="designation">年度最佳代理</small>
                                        <ul class="agent-social-handlers clearfix">
                                            <li><a href="#"><i class="fa fa-facebook-square"></i> Facebook</a></li>
                                            <li><a href="#"><i class="fa fa-twitter-square"></i> Twitter</a></li>
                                            <li><a href="#"><i class="fa fa-pinterest-square"></i> Pinterest</a></li>
                                            <li><a href="#"><i class="fa fa-google-plus-square"></i> Google Plus</a>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                            <div class="widget address-widget clearfix">
                                <ul>
                                    <li><i class="fa fa-map-marker"></i> 上海市闵行区东川路500号</li>
                                    <li><i class="fa fa-phone"></i> (123) 45678910</li>
                                    <li><i class="fa fa-envelope"></i> huycoi.art@gmail.com</li>
                                    <li><i class="fa fa-fax"></i> +84 962 216 601</li>
                                    <li><i class="fa fa-clock-o"></i> 周一-周六: 9:00 - 18:00</li>
                                </ul>
                            </div>
                        </div>
                        <div class="col-lg-5">
                            <div class="agent-contact-form">
                                <div></div>
                                <input type="text" id="name" placeholder="姓名" class="required">
                                <input type="text" id="phone" placeholder="手机号" class="required">
                                <input type="text" id="email" placeholder="邮箱" class="email required">
                                <textarea id="message" cols="30" rows="5" class="required"
                                          placeholder="如果您对这房子感兴趣，请留下联系方式，我们会尽快联系您！"></textarea>
                                <button class="btn btn-default btn-3d btn-lg" type="button" id="btnMesage"
                                        onclick="uploadMessage()"
                                        data-hover="留言">留言
                                </button>
                                <div class="error-container"></div>
                                <div class="message-container"></div>
                                <%----%>
                            </div>
                        </div>
                    </div>
                </section>
            </div>
            <div class="col-lg-4 col-md-5">
                <div id="property-sidebar">
                    <section class="widget adv-search-widget clearfix">
                        <h5 class="title hide">搜索房屋</h5>
                        <div id="advance-search-widget" class="clearfix">
                            <form action="#" id="adv-search-form">
                                <div id="widget-tabs">
                                    <ul class="tab-list clearfix">
                                        <li><a class="btn" href="#tab-1">买房</a></li>
                                        <li><a class="btn" href="#tab-1">租房</a></li>
                                    </ul>
                                    <div id="tab-1" class="tab-content current">
                                        <fieldset class="clearfix">
                                            <div>
                                                <label for="s_province">省</label>
                                                <select name="s_province" id="s_province"></select>
                                            </div>
                                            <div>
                                                <label for="s_city">市</label>
                                                <select name="s_city" id="s_city"></select>
                                            </div>
                                            <div>
                                                <label for="s_county">县区</label>
                                                <select name="s_county" id="s_county"></select>
                                            </div>
                                            <div>
                                                <label for="address">详细地址</label>
                                                <input type="text" placeholder="具体地址" name="address" id="address">
                                            </div>
                                            <div>
                                                <label for="houseType">房型</label>
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
                                            </div>
                                            <div>
                                                <label for="houseOld">房龄</label>
                                                <select id="houseOld" name="houseOld">
                                                    <option value="新房">新房</option>
                                                    <option value="二手房">二手房</option>
                                                </select>
                                            </div>
                                            <div>
                                                <label for="minArea">最小面积</label>
                                                <input type="text" name="minArea" id="minArea" placeholder="最小面积">
                                            </div>
                                            <div>
                                                <label for="maxArea">最大面积</label>
                                                <input type="text" name="maxArea" id="maxArea" placeholder="最大面积">
                                            </div>
                                            <div>
                                                <label for="minPrice">最低价</label>
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
                                            </div>
                                            <div>
                                                <label for="maxPrice">最高价</label>
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
                                            </div>
                                        </fieldset>
                                    </div>
                                    <button type="submit" class="btn btn-default btn-lg text-center btn-3d"
                                            data-hover="寻找房子">寻找房子
                                    </button>
                                </div>
                            </form>
                        </div>
                    </section>
                    <section class="widget recent-properties clearfix">
                        <h5 class="title">附近房源</h5>
                        <c:forEach items="${houseList}" var="recentHouse">
                            <div class="property clearfix">
                                <a href="#" class="feature-image zoom"><img data-action="zoom"
                                                                            src="${recentHouse.imgSrc}"
                                                                            alt="房屋图片"></a>
                                <div class="property-contents">
                                    <h6 class="entry-title"><a
                                            href="${ pageContext.request.contextPath }/houseDetail/${recentHouse.houseId}">房屋详情</a>
                                    </h6>
                                    <span class="btn-price">"${recentHouse.price}"</span>
                                    <div class="property-meta clearfix">
                                        <span><i class="fa fa-arrows-alt"></i> "${recentHouse.area}"</span>
                                        <span><i class="fa fa-bed"></i> "${recentHouse.houseType}"</span>
                                        <span><i class="fa fa-cab"></i> Yes</span>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </section>
                </div>
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
<script class="resources library" src="../js/area.js" type="text/javascript"></script>
<script type="text/javascript">
    $(function () {
        initMap();//创建和初始化地图
    });
    function setMapEvent() {
        map.enableDragging();//启用地图拖拽事件，默认启用(可不写)
        map.enableScrollWheelZoom();//启用地图滚轮放大缩小
        map.enableDoubleClickZoom();//启用鼠标双击放大，默认启用(可不写)
        map.enableKeyboard();//启用键盘上下左右键移动地图
    }

    //地图控件添加函数：
    function addMapControl() {
        //向地图中添加缩放控件
        var ctrl_nav = new BMap.NavigationControl({
            anchor: BMAP_ANCHOR_TOP_LEFT,
            type: BMAP_NAVIGATION_CONTROL_LARGE
        });
        map.addControl(ctrl_nav);
        //向地图中添加缩略图控件
        var ctrl_ove = new BMap.OverviewMapControl({anchor: BMAP_ANCHOR_BOTTOM_RIGHT, isOpen: 1});
        map.addControl(ctrl_ove);
        //向地图中添加比例尺控件
        var ctrl_sca = new BMap.ScaleControl({anchor: BMAP_ANCHOR_BOTTOM_LEFT});
        map.addControl(ctrl_sca);
    }

    function initMap() {
        createMap();//创建地图
        setMapEvent();//设置地图事件
        addMapControl();//向地图添加控件
    }

    function createMap() {
        var map = new BMap.Map("dituContent");//在百度地图容器中创建一个地图
        var localSearch = new BMap.LocalSearch(map);
        var geo = new BMap.Geocoder();
        var address = "${house.address}";
        var icon = new BMap.Icon("../img/marker.jpg", new BMap.Size(100, 100));
        var marker;
        geo.getPoint(address, function (point) {
            window.pointt = point;
            marker = new BMap.Marker(point, {icon: icon});
            map.addOverlay(marker);
            map.centerAndZoom(point, 16);
        }, "上海");
        localSearch.search(address);
        window.map = map;//将map变量存储在全局
    }
    function uploadMessage() {
        var name = $("#name").val();
        var phone = $("#phone").val();
        var email = $("#email").val();
        var message = $("#message").val();
    }
</script>
<script type="text/javascript">
    _init_area();
    var Gid = document.getElementById;
    var showArea = function () {
        Gid('show').innerHTML = "<h3>省" + Gid('s_province').value + " - 市" +
            Gid('s_city').value + " - 县/区" +
            Gid('s_county').value + "</h3>"
    }
    Gid('s_county').setAttribute('onchange', 'showArea()');
</script>
</body>
</html>
