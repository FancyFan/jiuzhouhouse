<%@ page import="demo.house.model.House" %><%--
  Created by IntelliJ IDEA.
  User: dingge
  Date: 2017/6/29
  Time: 21:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<html>
<head>
    <title>Detail</title>
    <link rel="stylesheet" type="text/css" href="../css/demo.css"/>
    <link rel="stylesheet" type="text/css" href="../css/slicebox.css"/>
    <link rel="stylesheet" type="text/css" href="../css/custom.css"/>
    <script src="../js/jquery.min.js"></script>
    <script src="../js/bootstrap.min.js"></script>
    <link href="../css/bootstrap.min.css" rel="stylesheet">
    <script type="text/javascript" src="../js/modernizr.custom.46884.js"></script>
    <script type="text/javascript"
            src="http://api.map.baidu.com/api?v=2.0&ak=mkKoxpK14h2zsHssGZRDUyZemd062g8W"></script>
</head>
<body>
<div class="container">
    <div>
        <div>
            <h1 id="detail-title">房源信息</h1>
        </div>
        <div>
            <a href="${ pageContext.request.contextPath }/pages/login.jsp" class="pull-right text-danger">注销</a>
            <a href="<%=basePath%>/admin" class="pull-right text-info">返回</a>
        </div>
        <div class="row">
            <div class="col-sm-8 pull-left">
                <div class="wrapper">
                    <ul id="sb-slider" class="sb-slider">
                        <li>
                            <img src="../house/${sessionScope.get("houseDetail").houseId}/0.jpg" alt="image1"/>
                        </li>
                        <li>
                            <img src="../house/${sessionScope.get("houseDetail").houseId}/1.jpg" alt="image2"/>
                        </li>
                        <li>
                            <img src="../house/${sessionScope.get("houseDetail").houseId}/2.jpg" alt="image1"/>
                        </li>
                        <li>
                            <img src="../house/${sessionScope.get("houseDetail").houseId}/3.jpg" alt="image1"/>
                        </li>
                        <li>
                            <img src="../house/${sessionScope.get("houseDetail").houseId}/4.jpg" alt="image1"/>
                        </li>
                    </ul>

                    <div id="shadow" class="shadow"></div>

                    <div id="nav-arrows" class="nav-arrows">
                        <a href="#">Next</a>
                        <a href="#">Previous</a>
                    </div>

                    <div id="nav-dots" class="nav-dots">
                        <span class="nav-dot-current"></span>
                        <span></span>
                        <span></span>
                        <span></span>
                        <span></span>
                    </div>

                </div>
            </div>
            <div class="col-sm-4 pull-right panel panel-info" style="top: 50px;height:400px;">
                <div id="detail-main" class="panel-heading">
                    <h3 class="panel-title">房屋信息</h3>
                </div>
                <div class="panel-body">
                    <div style="padding-bottom: 5%">
                        <c:if test="${sessionScope.get('houseDetail').saleType eq '1'}">
                            <div class="row">
                                <div id="hpr1">
                                    <label class="col-sm-3 lead"><h4>租金</h4></label>
                                    <div class="col-sm-9 text-danger text-primary lead">
                                        <h4>${sessionScope.get('houseDetail').price}</h4>
                                    </div>
                                </div>
                            </div>
                        </c:if>
                        <c:if test="${sessionScope.get('houseDetail').saleType eq '2'}">
                            <div class="row">
                                <div id="hpr2">
                                    <label class="col-sm-2">售价</label>
                                    <div class="col-sm-10 text-danger">${sessionScope.get('houseDetail').price}
                                    </div>
                                </div>
                            </div>
                        </c:if>
                    </div>
                    <div class="row padd">
                        <div id="hHt">
                            <label class="col-sm-2 ">户型</label>
                            <div class="col-sm-3">
                                ${sessionScope.get('houseDetail').houseType}
                            </div>
                        </div>
                        <div id="hea">
                            <label class="col-sm-4">面积（平米）</label>
                            <div class="col-sm-3">${sessionScope.get('houseDetail').area}
                            </div>
                        </div>
                    </div>
                    <div class="row padd">
                        <div id="hcn">
                            <label class="col-sm-4">小区</label>
                            <div class="col-sm-8">${sessionScope.get('houseDetail').communityName}
                            </div>
                        </div>
                    </div>
                    <div class="row padd">
                        <div id="hct">
                            <label class="col-sm-2">城市</label>
                            <div id="cty" class="col-sm-2">${sessionScope.get('houseDetail').city}
                            </div>
                        </div>
                        <div id="had">
                            <label class="col-sm-2">地址</label>
                            <div id="addss" class="col-sm-6">${sessionScope.get('houseDetail').address}
                            </div>
                        </div>
                    </div>
                    <div class="row padd">
                        <div id="han">
                            <label class="col-sm-2">姓名</label>
                            <div class="col-sm-2">${sessionScope.get('houseDetail').authorName}
                            </div>
                        </div>
                        <div id="hat">
                            <label class="col-sm-3">联系电话</label>
                            <div class="col-sm-5">${sessionScope.get('houseDetail').authorTel}
                            </div>
                        </div>
                    </div>
                    <div id="hde" class="row padd">
                        <label class="col-sm-2">详情</label>
                        <div class="col-sm-10">${sessionScope.get('houseDetail').des}
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div id="map" class="row" style="top: 100px;left: 20px;border: 1px solid;position:relative;">
            <div style="width:700px;height:350px;border:#ccc solid 1px;" id="dituContent" class="col-sm-8"></div>
            <div id="list" class="col-sm-4">
                <div id="buttonList" class="row">
                    <button type="button" onclick="searchMap(this)" id="btn-buss" value="公交" class="col-sm-3">公交
                    </button>
                    <button type="button" onclick="searchMap(this)" value="学校" class="col-sm-3">教育</button>
                    <button type="button" onclick="searchMap(this)" value="银行" class="col-sm-3">银行</button>
                    <button type="button" onclick="searchMap(this)" value="医院" class="col-sm-3">医疗</button>
                </div>
                <div id="detail-panel" class="row pre-scrollable" style="height: 350px"></div>
            </div>
        </div>
    </div>
</div>
<script type="application/javascript" src="../js/jquery.min.js"></script>
<script type="text/javascript" src="../js/jquery.slicebox.js"></script>
<script type="text/javascript">
    $(function () {

        var Page = (function () {

            var $navArrows = $('#nav-arrows').hide(),
                $navDots = $('#nav-dots').hide(),
                $nav = $navDots.children('span'),
                $shadow = $('#shadow').hide(),
                slicebox = $('#sb-slider').slicebox({
                    onReady: function () {

                        $navArrows.show();
                        $navDots.show();
                        $shadow.show();

                    },
                    onBeforeChange: function (pos) {

                        $nav.removeClass('nav-dot-current');
                        $nav.eq(pos).addClass('nav-dot-current');

                    }
                }),

                init = function () {

                    initEvents();

                },
                initEvents = function () {

                    // add navigation events
                    $navArrows.children(':first').on('click', function () {

                        slicebox.next();
                        return false;

                    });

                    $navArrows.children(':last').on('click', function () {

                        slicebox.previous();
                        return false;

                    });

                    $nav.each(function (i) {

                        $(this).on('click', function (event) {

                            var $dot = $(this);

                            if (!slicebox.isActive()) {

                                $nav.removeClass('nav-dot-current');
                                $dot.addClass('nav-dot-current');

                            }

                            slicebox.jump(i + 1);
                            return false;

                        });

                    });

                };

            return {init: init};

        })();

        Page.init();
        initMap();//创建和初始化地图
        searchMap($("#btn-buss"));
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

    //创建地图函数：
    function createMap() {
        var map = new BMap.Map("dituContent");//在百度地图容器中创建一个地图
        var localSearch = new BMap.LocalSearch(map);
        var geo = new BMap.Geocoder();
        geo.getPoint(document.getElementById("addss").innerHTML, function (point) {
            window.pointt = point;
            console.log(point);
            console.log("ttttt");
            map.centerAndZoom(point, 16);
        }, "上海");
        localSearch.search(document.getElementById("addss").innerHTML);
        window.map = map;//将map变量存储在全局
    }
    function searchMap(dom) {
        initMap();
        var context = dom.value;
        var local = new BMap.LocalSearch(map, {
            renderOptions: {map: map, panel: "detail-panel"}
        });
        local.searchNearby(context, pointt, 500);
    }
</script>
</body>
</html>
