<%-- 
    Document   : zayavka
    Created on : 01.08.2017, 12:21:00
    Author     : User
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="sf" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>

<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title><s:message code="zayavka.title"/>${zayavka.id}</title>
    <style type="text/css">
        div.mainform {
            position: relative;
            border: 3px solid #32AA21;
            width: 500px;
            padding: 20px;

        }

        div.right-side {
            position: absolute;
            border-style: solid;
            border-radius: 5px; /*round border*/
            padding: 10px;
            width: 50px;

            top: 0px;
            right: -85px;
            /*margin: 0 0 10px 10px;*/
        }
    </style>
</head>
<body>
<h1><s:message code="zayavka.hello"/><c:out value="${zayavka.id}"/></h1>
<span><s:message code="zayavka.date"/><fmt:formatDate value="${zayavka.date}" type="both" dateStyle="medium"/></span>
<br>
<br>

    <s:url value="https://www.wowprogress.com/character/eu/гордунни/{nickname}" var="wplink" htmlEscape="true">
        <s:param name="nickname" value="${zayavka.name}"/>
    </s:url>
    <s:url value="https://worldofwarcraft.com/ru-ru/character/gordunni/{nickname}" var="armlink" htmlEscape="true">
        <s:param name="nickname" value="${zayavka.name}"/>
    </s:url>

<div class="mainform">
    <s:message code="vsezayavki.nickname"/><c:out value="${zayavka.name}"/>
    (<a href="${wplink}" target="_blank">Wowprogress</a>,
    <a href="${armlink}" target="_blank">Armory</a>)
    <br>
    <s:message code="vsezayavki.class"/><c:out value="${zayavka.wowClass.wowClassLoc[0].wowClassLocalized}"/><br>
    <s:message code="vsezayavki.spec"/><c:out value="${zayavka.wowClass.wowClassLoc[0].wowSpecLocalized}"/><br>
    <s:message code="vsezayavki.ilvl"/><c:out value="${zayavka.ilvl}"/><br>
    <s:message code="vsezayavki.exp"/><c:out value="${zayavka.exp}"/><br>
    <s:message code="zayavka.why"/><c:out value="${zayavka.why}"/><br>
    <s:message code="zayavka.what"/><c:out value="${zayavka.what}"/><br>
    <div class="right-side">
        <sec:authentication property="principal.username" var="username"></sec:authentication>
        <s:message code="form.loggedAs"/>${username}

        <sf:form action="/logout" method="post">
            <input type="submit" value="<s:message code="form.logout"/>"/>
        </sf:form>
    </div>
</div>
</body>
</html>
