<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>

<nav class="navbar navbar-default">

        <div class="navbar-header">
            <a class="navbar-brand" href="/"><s:message code="navbar.guildname"/></a>
        </div>
        <ul class="nav navbar-nav">
            <li class="active"><a href="/info"><s:message code="navbar.page0"/></a></li>
            <li><a href="/news"><s:message code="navbar.page1"/></a></li>
            <li><a href="/achievements"><s:message code="navbar.page2"/></a></li>
            <li><a href="/application"><s:message code="navbar.page3"/></a></li>
        </ul>

</nav>
