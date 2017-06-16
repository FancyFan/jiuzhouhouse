<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@include file="ext.jsp" %>
<html>
<body>
<h2>九州地产</h2>
<a href="pages/login.jsp">工作人员入口</a>
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
            </tr>
            <c:forEach var="house" items="${hList}">
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
                </tr>
            </c:forEach>
        </table>
    </div>
</div>
</body>
</html>
