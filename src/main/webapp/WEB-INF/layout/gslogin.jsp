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
