
<%--
  Created by IntelliJ IDEA.
  User: fanzhun
  Date: 2017/6/11
  Time: 1:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="admin_ext.jsp" %>
<%@include file="ext.jsp" %>
<html>
<head>
    <title>Admin</title>
</head>
<body>
<h2>welcome to admin page</h2>
<a href="${ pageContext.request.contextPath }/"><button class="btn-info" >返回首页</button></a>
<!--添加模态框-->
<div class="modal fade bs-example-modal-lg" id="modal-add" tabindex="-1" role="dialog" aria-labelledby="detail-title"
     aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span
                        class="sr-only">Close</span></button>
                <h4 class="modal-title" id="add-title">添加详情</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" role="form">
                    <div class="form-group">
                        <label for="add-saleType" class="col-sm-3 control-label">发布类型</label>
                        <div class="col-sm-7">
                            <select class="form-control no-border no-box-shadow" id="add-saleType">
                                <option value ="1">出租</option>
                                <option value ="2">售卖</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="add-houseType" class="col-sm-3 control-label">户型</label>
                        <div class="col-sm-7">
                            <input type="text" class="form-control no-border no-box-shadow" id="add-houseType"
                                   placeholder="户型">
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
                        <div class="col-sm-7">
                            <div id="submitError" style="font-size: 16px; color:red; padding-left: 2px;width: 80%"></div>
                        </div>
                    </div>

                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                <button type="button" class="btn btn-success" onclick="add('<%=contextPath%>')">添加</button>
            </div>
        </div>
    </div>
</div>

<!--添加图片-->
<div>
    <div class="modal fade bs-example-modal-lg" id="modal-upload" tabindex="-1" role="dialog" aria-labelledby="detail-title"
         aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span
                            class="sr-only">Close</span></button>
                    <h4 class="modal-title" id="upload-title">上传图片</h4>
                </div>
                <div class="modal-body">
                    <form class="form-horizontal" role="form" action="<%=contextPath%>/house/addP"
                          target="id_iframe" method="post"  enctype="multipart/form-data">
                        <div class="form-group">
                            <label for="up-pid" class="col-sm-3 control-label">商品编号</label>
                            <div class="col-sm-7">
                                <input type="text" class="form-control no-border no-box-shadow" id="up-pid"
                                       placeholder="pid" name="pid" readonly="readonly">
                            </div>
                        </div>
                        <input id="file-1" type="file" name="uploadfile" multiple class="file" data-overwrite-initial="false" data-min-file-count="5">
                        <%--<input type="button" class="btn-info" onclick="upPic('<%=contextPath%>')">确定</input>--%>
                        `   <input type="submit" class="btn-info">
                        <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<iframe id="id_iframe" name="id_iframe" style="display:none;"></iframe>

<div class="panel panel-default text-center">
    <div class="panel-header">
        <h2>房屋列表</h2>
    </div>
    <div class="panel-body">

        <table id="table" class="table table-condensed table-bordered table-hover">
            <tr>
                <th>类型</th>
                <th>小区</th>
                <th>面积</th>
                <th>房型</th>
                <th></th>
                <th></th>
                <th></th>
            </tr>
            <c:forEach var="house" items="${houses}">
                <tr>
                    <c:if test="${house.saleType eq '1'}">
                        <td>出租</td>
                    </c:if>
                    <c:if test="${house.saleType eq '2'}">
                        <td>售卖</td>
                    </c:if>
                    <td>${house.communityName}</td>
                    <td>${house.area}</td>
                    <td>${house.houseType}</td>
                    <td>
                        <button id="btn-upload" class="btn btn-danger" onclick="uploadshow('<%=contextPath%>','${house.houseId}')">上传图片
                        </button>
                    </td>
                    <td>
                        <button id="btn-detail" class="btn btn-primary" onclick="detail('<%=contextPath%>','${house.houseId}')">详情
                        </button>
                    </td>
                    <td>
                        <button id="btn-delete" class="btn btn-danger" onclick="showDeleteModal('${house.houseId}')">删除
                        </button>
                    </td>
                </tr>
            </c:forEach>
        </table>
    </div>
</div>

<div>
    <button id="btn-add" class="btn btn-success" data-toggle="modal" data-target="#modal-add">添加</button>
</div>

<!--详情模态框-->
<div class="modal fade bs-example-modal-lg" id="modal-detail" tabindex="-1" role="dialog" aria-labelledby="detail-title"
     aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span
                        class="sr-only">Close</span></button>
                <h4 class="modal-title" id="detail-title">查看详情</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" role="form">
                    <div class="form-group">
                        <label for="detail-houseId" class="col-sm-3 control-label">房屋编号</label>
                        <div class="col-sm-7">
                            <input type="text" class="form-control no-border no-box-shadow" id="detail-houseId"
                                   placeholder="房屋编号" readonly="readonly">
                        </div>
                    </div>
                    <div class="form-group">
                    <label for="detail-saleType" class="col-sm-3 control-label">发布类型</label>
                    <div class="col-sm-7">
                        <select class="form-control no-border no-box-shadow" id="detail-saleType">
                            <option value ="1">出租</option>
                            <option value ="2">售卖</option>
                        </select>
                    </div>
                  </div>
                    <div class="form-group">
                        <label for="detail-houseType" class="col-sm-3 control-label">户型</label>
                        <div class="col-sm-7">
                            <input type="text" class="form-control no-border no-box-shadow" id="detail-houseType"
                                   placeholder="Role">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="detail-area" class="col-sm-3 control-label">面积（平米）</label>
                        <div class="col-sm-7">
                            <input type="text" class="form-control no-border no-box-shadow" id="detail-area"
                                   placeholder="area">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="detail-price" class="col-sm-3 control-label">价格</label>
                        <div class="col-sm-7">
                            <input type="text" class="form-control no-border no-box-shadow" id="detail-price"
                                   placeholder="Role">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="detail-comu" class="col-sm-3 control-label">小区</label>
                        <div class="col-sm-7">
                            <input type="text" class="form-control no-border no-box-shadow" id="detail-comu"
                                   placeholder="comu">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="detail-address" class="col-sm-3 control-label">地址</label>
                        <div class="col-sm-7">
                            <input type="text" class="form-control no-border no-box-shadow" id="detail-address"
                                   placeholder="address">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="detail-name" class="col-sm-3 control-label">姓名</label>
                        <div class="col-sm-7">
                            <input type="text" class="form-control no-border no-box-shadow" id="detail-name"
                                   placeholder="name">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="detail-tel" class="col-sm-3 control-label">联系电话</label>
                        <div class="col-sm-7">
                            <input type="text" class="form-control no-border no-box-shadow" id="detail-tel"
                                   placeholder="tel">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="detail-des" class="col-sm-3 control-label">详情</label>
                        <div class="col-sm-7">
                            <input type="text" class="form-control no-border no-box-shadow" id="detail-des"
                                   placeholder="des">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="detail-pic" class="col-sm-3 control-label">缩略图</label>
                        <div class="col-sm-7">
                            <img style="display: block;" height="200" width="200" id="detail-pic">
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                <button type="button" class="btn btn-primary" onclick="update('<%=contextPath%>')">修改</button>
            </div>
        </div>
    </div>
</div>



<!--删除模态框-->
<div class="modal fade bs-example-modal-sm" id="modal-delete" tabindex="-1" role="dialog" aria-labelledby="delete-title"
     aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span
                        class="sr-only">Close</span></button>
                <h4 class="modal-title" id="delete-title">删除</h4>
            </div>
            <div class="modal-body">
                确认删除？
                <form class="form-horizontal" role="form">
                    <div class="form-group">
                        <label for="detail-houseId" class="col-sm-3 control-label">houseId</label>
                        <div class="col-sm-7">
                            <input type="text" class="form-control no-border no-box-shadow" id="delete-houseId"
                                   placeholder="AppId" readonly="readonly">
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                <button type="button" class="btn btn-danger" onclick="deleteByHouseId('<%=contextPath%>')">
                    删除
                </button>
            </div>
        </div>
    </div>
</div>
</body>
</html>
