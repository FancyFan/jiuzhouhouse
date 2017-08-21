<%--
  Created by IntelliJ IDEA.
  User: dingge
  Date: 2017/7/3
  Time: 20:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<%@include file="ext.jsp" %>
<html>
<head>
    <title>AddHouse</title>
    <script src="../js/jquery.min.js"></script>
    <script src="../js/bootstrap.min.js"></script>
    <script src="../js/ajaxfileupload.js"></script>
    <link href="../css/bootstrap.min.css" rel="stylesheet">
    <link href="../css/chooseCity.css" rel="stylesheet">
</head>
<body>
<div>
    <div>
        <h1 class="text-center " id="add-title">添加详情</h1>
    </div>
    <div>
        <form class="form-horizontal" role="form">
            <div class="form-group">
                <label for="add-saleType" class="col-sm-3 control-label">发布类型</label>
                <div class="col-sm-7">
                    <select class="form-control no-border no-box-shadow" id="add-saleType">
                        <option value="1">出租</option>
                        <option value="2">售卖</option>
                    </select>
                </div>
            </div>
            <div class="form-group">
                <label for="add-houseType" class="col-sm-3 control-label">户型</label>
                <div class="col-sm-7">
                    <select class="form-control no-border no-box-shadow" id="add-houseType">
                        <option value="一室一厅">一室一厅</option>
                        <option value="两室一厅">两室一厅</option>
                        <option value="三室一厅">三室一厅</option>
                        <option value="四室一厅">四室一厅</option>
                        <option value="两室两厅">两室两厅</option>
                        <option value="三室两厅">三室两厅</option>
                        <option value="四室两厅">四室两厅</option>
                        <option value="别墅">别墅</option>
                    </select>
                </div>
            </div>
            <div class="form-group">
                <label for="add-area" class="col-sm-3 control-label">面积（平米）</label>
                <div class="col-sm-7">
                    <input type="text" class="form-control no-border no-box-shadow" id="add-area"
                           placeholder="面积">
                </div>
            </div>
            <div class="form-group">
                <label for="add-price" class="col-sm-3 control-label">价格</label>
                <div class="col-sm-7">
                    <input type="text" class="form-control no-border no-box-shadow" id="add-price"
                           placeholder="价格">
                </div>
            </div>
            <div class="form-group">
                <label for="add-community" class="col-sm-3 control-label">小区</label>
                <div class="col-sm-7">
                    <input type="text" class="form-control no-border no-box-shadow" id="add-community"
                           placeholder="小区">
                </div>
            </div>
            <div class="form-group">
                <label for="s_province" class="col-sm-3 control-label">省</label>
                <div class="col-sm-7">
                    <select name="province" id="s_province"></select>
                </div>
            </div>
            <div class="form-group">
                <label for="s_city" class="col-sm-3 control-label">城市</label>
                <div class="col-sm-7">
                    <select name="city" id="s_city"></select>
                </div>
            </div>
            <div class="form-group">
                <label for="s_county" class="col-sm-3 control-label">县区</label>
                <div class="col-sm-7">
                    <select name="county" id="s_county"></select>
                </div>
            </div>
            <div class="form-group">
                <label for="add-address" class="col-sm-3 control-label">地址</label>
                <div class="col-sm-7">
                    <input type="text" class="form-control no-border no-box-shadow" id="add-address"
                           placeholder="地址">
                </div>
            </div>
            <div class="form-group">
                <label for="add-user" class="col-sm-3 control-label">姓名</label>
                <div class="col-sm-7">
                    <input type="text" class="form-control no-border no-box-shadow" id="add-user"
                           placeholder="姓名">
                </div>
            </div>
            <div class="form-group">
                <label for="add-tel" class="col-sm-3 control-label">联系电话</label>
                <div class="col-sm-7">
                    <input type="text" class="form-control no-border no-box-shadow" id="add-tel"
                           placeholder="联系电话">
                </div>
            </div>
            <div class="form-group">
                <label for="add-des" class="col-sm-3 control-label">详情</label>
                <div class="col-sm-7">
                    <input type="text" class="form-control no-border no-box-shadow" id="add-des"
                           placeholder="详情">
                </div>
            </div>
            <div class="form-group">
                <label for="add-des" class="col-sm-3 control-label">上传图片</label>
                <div class="col-sm-7">
                    <input id="uploadfile" type="file" name="uploadfile" multiple class="file"
                           data-overwrite-initial="false" data-min-file-count="5" 　enctype="multipart/form-data">
                </div>
            </div>

        </form>
    </div>
    <div class="text-center">
        <button type="button" class="btn btn-default" onclick="quit()">取消</button>
        <button type="button" class="btn btn-success" onclick="add('<%=contextPath%>')">添加</button>
    </div>
</div>
</body>
<script class="resources library" src="../js/area.js" type="text/javascript"></script>
<script type="text/javascript">
    _init_area();
    var Gid = document.getElementById;
    var showArea = function () {
        Gid('show').innerHTML = "<h3>省" + Gid('s_province').value + " - 市" +
            Gid('s_city').value + " - 县/区" +
            Gid('s_county').value + "</h3>"
    }
    Gid('s_county').setAttribute('onchange', 'showArea()');

    function quit() {
        window.location = window.location = "<%=basePath%>/admin";
    }

    function add(url) {
        var houseType = $('#add-houseType').val();
        var saleType = $('#add-saleType').val();
        var area = $('#add-area').val();
        var price = $('#add-price').val();
        var community = $('#add-community').val();
        var address = $('#add-address').val();
        var city = $('#s_city').val();
        var authorTel = $('#add-tel').val();
        var user = $('#add-user').val();
        var des = $('#add-des').val();
        var province = $("#s_province").val();
        var county = $("#s_county").val();
        $.ajaxFileUpload({
            url: url + "/house/addAll",//用于文件上传的服务器端请求地址
            secureuri: false,//一般设置为false
            data: {
                saleType: saleType,
                houseType: houseType,
                area: area,
                price: price,
                communityName: community,
                address: address,
                authorTel: authorTel,
                authorName: user,
                des: des,
                city: city,
                province: province,
                county: county
            },
            fileElementId: 'uploadfile',//文件上传空间的id属性  <input type="file" id="file" name="file" />
//                        dataType: 'json',//返回值类型 一般设置为json
            type: 'POST',
            timeout: 1200000, // 超时校验 120秒超时
            success: function () {
                window.location = "<%=basePath%>/admin";
            },
            error: function (e) {
                alert(e);
            }
        });
    }
</script>
</html>
