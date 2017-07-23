<%--
  Created by IntelliJ IDEA.
  User: dingge
  Date: 2017/6/27
  Time: 21:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<%@include file="normal_ext.jsp" %>
<%@include file="ext.jsp" %>
<html>
<head>
    <title>Normal</title>
</head>
<body>
<h2>welcome to normal page</h2>
<a href="${ pageContext.request.contextPath }/pages/login.jsp">注销</a>
<a href="${ pageContext.request.contextPath }/">
    <button class="btn-info">返回首页</button>
</a>

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
                        <button id="btn-upload" class="btn btn-danger"
                                onclick="update('${house.houseId}')">修改
                        </button>
                    </td>
                    <td>
                        <button id="btn-detail" class="btn btn-primary"
                                onclick="detail('${house.houseId}')">详情
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
    <button id="btn-add" class="btn btn-success" data-toggle="modal" data-target="#modal-add"
            onclick="addHouse()">添加
    </button>
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
                        <label for="detete-houseId" class="col-sm-3 control-label">houseId</label>
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

