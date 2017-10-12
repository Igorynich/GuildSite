<%--
  Created by IntelliJ IDEA.
  User: User
  Date: 09.08.2017
  Time: 15:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="sf" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

    <!-- jQuery library -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

    <!-- Latest compiled JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <title><s:message code="login.title"/></title>
</head>

<body onload="document.f.username.focus();">
<div class="container">
    <h3><s:message code="login.hello"/></h3>

    <form action="<%=request.getContextPath()%>/gslogin" method="POST">
        <s:message code="login.username"/><input type="text" name="gsusername"/><br/><br/>
        <s:message code="login.password"/><input type="password" name="gspassword"/> <br/><br/>
        <input type="checkbox" name="remember-me"></td>
        <s:message code="login.rememberme"/>
        <input type="submit" value="<s:message code="login.login"/>"/>
        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
    </form>
</div>
</body>

</html>
