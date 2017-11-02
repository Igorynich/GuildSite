<%--
  Created by IntelliJ IDEA.
  User: User
  Date: 18.09.2017
  Time: 14:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <meta name="_csrf" content="${_csrf.token}"/>
    <!-- default header name is X-CSRF-TOKEN -->
    <meta name="_csrf_header" content="${_csrf.headerName}"/>


    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

    <!-- jQuery library -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

    <!-- Latest compiled JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link href="<c:url value="/resources/style.css" />" rel="stylesheet">
    <script src="<c:url value="/resources/jquery-3.2.1.min.js" />"></script>
    <script src="<c:url value="/resources/angular.min.js" />"></script>
    <%--<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.4/angular-animate.js"></script>--%>
    <%--<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.6/angular.min.js"></script>--%>
    <title>Тайтл</title>
</>
<body ng-app="gs">
<script>
    var app = angular.module('gs', []);
    /*app.config(function ($locationProvider) {
        if (window.history && window.history.pushState) {
            $locationProvider.html5Mode({
                enabled: true,
                requireBase: false
            });
        }
    });*/

</script>
<div class="container">
    <div class="row">
        <tiles:insertAttribute name="header"/>
    </div>

    <div class="row">
        <tiles:insertAttribute name="navigation_bar"/>
    </div>

    <div class="row">
        <div class="col-lg-2">
            <tiles:insertAttribute name="left"/>
        </div>
        <div class="col-lg-8">
            <tiles:insertAttribute name="body" />
        </div>
        <div class="col-lg-2">
            <tiles:insertAttribute name="right"/>
        </div>
    </div>

    <div class="row">
        <tiles:insertAttribute name="footer"/>
    </div>
</div>
</body>
</html>
