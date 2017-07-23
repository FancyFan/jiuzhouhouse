<%@ page import="demo.house.model.House" %><%--
  Created by IntelliJ IDEA.
  User: dingge
  Date: 2017/6/29
  Time: 21:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Detail</title>
    <link rel="stylesheet" type="text/css" href="../css/demo.css"/>
    <link rel="stylesheet" type="text/css" href="../css/slicebox.css"/>
    <link rel="stylesheet" type="text/css" href="../css/custom.css"/>
    <style>
        h1 {
            /*margin-top: 20px;*/
            font-family: 'Microsoft Yahei';
            font-size: 36px;
            color: #019157;
        }

        .detail {
            position: absolute;
            left: 720px;
            top: 150px;
            border: #8c8c8c 1px solid;
            max-width: 500px;
            width: 100%;
            max-height: 500px;
            padding: 0 50px;
            margin: 0 auto;
        }

        #map {
            position: absolute;
            left: 120px;
            top: 650px;
            border: #8c8c8c 1px solid;
            width: 1500px;
            height: 500px;
            padding: 0 50px;
            margin: 0 auto;
        }

        #list, #dituContent {
            position: relative;
        }

        .detail label {
            position: relative;
            color: #CC5522;
            font-weight: 600;
        }
    </style>
    <script type="text/javascript" src="../js/modernizr.custom.46884.js"></script>
    <script type="text/javascript"
            src="http://api.map.baidu.com/api?v=2.0&ak=mkKoxpK14h2zsHssGZRDUyZemd062g8W"></script>
</head>
<body>
<div>
    <div>
        <div>
            <h1 id="detail-title">房源信息</h1>
        </div>
        <div>
            <div>
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
            <div class="detail">
                <div id="detail-main">
                    <h3>详细信息</h3>
                </div>
                <div id="hId">
                    <label>房屋编号</label>
                    <div>${sessionScope.get("houseDetail").houseId}</div>
                </div>
                <div id="hTy">
                    <label>发布类型</label>
                    <div>
                        <c:if test="${sessionScope.get('houseDetail').saleType eq '1'}">
                            <td>出租</td>
                        </c:if>
                        <c:if test="${sessionScope.get('houseDetail').saleType eq '2'}">
                            <td>售卖</td>
                        </c:if>
                    </div>
                </div>
                <div id="hHt">
                    <label>户型</label>
                    <div>
                        ${sessionScope.get('houseDetail').houseType}
                    </div>
                </div>
                <div id="hea">
                    <label>面积（平米）</label>
                    <div>${sessionScope.get('houseDetail').area}
                    </div>
                </div>
                <div id="hpr">
                    <label>价格</label>
                    <div>${sessionScope.get('houseDetail').price}
                    </div>
                </div>
                <div id="hcn">
                    <label>小区</label>
                    <div>${sessionScope.get('houseDetail').communityName}
                    </div>
                </div>
                <div id="hct">
                    <label>城市</label>
                    <div id="cty">${sessionScope.get('houseDetail').city}
                    </div>
                </div>
                <div id="had">
                    <label>地址</label>
                    <div id="addss">${sessionScope.get('houseDetail').address}
                    </div>
                </div>
                <div id="han">
                    <label>姓名</label>
                    <div>${sessionScope.get('houseDetail').authorName}
                    </div>
                </div>
                <div id="hat">
                    <label>联系电话</label>
                    <div>${sessionScope.get('houseDetail').authorTel}
                    </div>
                </div>
                <div id="hde">
                    <label>详情</label>
                    <div>${sessionScope.get('houseDetail').des}
                    </div>
                </div>
            </div>
        </div>
        <div id="map">
            <div style="width:500px;height:350px;border:#ccc solid 1px;" id="dituContent"></div>
            <div id="list">
                <div id="buttonList">
                    <button type="button" onclick="searchMap(this)" value="公交">公交</button>
                    <button type="button" onclick="searchMap(this)" value="学校">教育</button>
                    <button type="button" onclick="searchMap(this)" value="银行">银行</button>
                    <button type="button" onclick="searchMap(this)" value="医院">医疗</button>
                </div>
                <div id="detail-panel"></div>
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


        //地图事件设置函数：
//

//        //创建InfoWindow
//        function createInfoWindow(i) {
//            var json = markerArr[i];
//            var iw = new BMap.InfoWindow("<b class='iw_poi_title' title='" + json.title + "'>" + json.title + "</b><div class='iw_poi_content'>" + json.content + "</div>");
//            return iw;
//        }

//        //创建一个Icon
//        function createIcon(json) {
//            var icon = new BMap.Icon("http://map.baidu.com/image/us_cursor.gif", new BMap.Size(json.w, json.h), {
//                imageOffset: new BMap.Size(-json.l, -json.t),
//                infoWindowOffset: new BMap.Size(json.lb + 5, 1),
//                offset: new BMap.Size(json.x, json.h)
//            })
//            return icon;
//        }


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
    initMap();//创建和初始化地图
    function initMap() {
        createMap();//创建地图
        setMapEvent();//设置地图事件
        addMapControl();//向地图添加控件
        //  addMarker();//向地图中添加marker
    }

    //创建地图函数：
    function createMap() {
        var map = new BMap.Map("dituContent");//在百度地图容器中创建一个地图
        <%--var lac=${sessionScope.get('houseDetail').address};--%>
//        map.centerAndZoom(document.getElementById("cty").innerHTML, 12);
        var localSearch = new BMap.LocalSearch(map);
        localSearch.setSearchCompleteCallback(function (searchResult) {
            var poi = searchResult.getPoi(0);
            window.point=poi.point;
            map.centerAndZoom(poi.point, 16);
        });
        localSearch.search(document.getElementById("addss").innerHTML);
        window.map = map;//将map变量存储在全局
    }
    function searchMap(dom) {
        var context = dom.value;
        console.log(context);
        var local = new BMap.LocalSearch(map, {

            renderOptions: {map: map, panel: "detail-panel"}

        });
//        local.searchInBounds(context, point);
        local.searchNearby(context,point);
    }
</script>
</body>
</html>
