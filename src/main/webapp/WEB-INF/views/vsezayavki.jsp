<%-- 
    Document   : vsezayavki
    Created on : 25.07.2017, 8:44:33
    Author     : User
--%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="sf" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>

<%@page contentType="text/html" pageEncoding="windows-1251" %>
<!DOCTYPE html>
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
    <style type="text/css">
        TH {
            background: gold; /* Цвет фона */
        }

        TD, TH {
            padding-left: 10px; /* Поля вокруг текста */
            padding-right: 10px;
            text-align: center; /* Выравнивание по центру */

        }

        TD.ilvl {
            text-align: right; /* Выравнивание по левому краю */

        }

        div.mainform {
            position: relative;
            border: 3px solid #32AA21;
            width: 800px;
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

    <title><s:message code="vsezayavki.title"/></title>
</head>
<body>
<div class="container">
<sec:authentication property="principal.username" var="loginId"/>
<h1>${gstatic}</h1>
<h2><s:message code="vsezayavki.hello"/></h2>
<div class="mainform">

    <s:url value="?sortBy=name&dir=asc" var="sortByNameAsc" htmlEscape="true"/>
        <s:url value="?sortBy=name&dir=desc" var="sortByNameDesc" htmlEscape="true"/>
    <table class="table table-hover" cellspacing="0">
        <tr class="warning">
            <th><s:url value="?sortBy=date&dir=asc" var="sortByDateAsc" htmlEscape="true"/>
                <s:url value="?sortBy=date&dir=desc" var="sortByDateDesc" htmlEscape="true"/>
                <table>
                    <tr>
                        <td><s:message code="vsezayavki.date"/></td>
                        <td><a class="btn-link" href="${sortByDateAsc}">/\</a></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td><a class="btn-link" href="${sortByDateDesc}">\/</a></td>
                    </tr>
                </table></th>
            <th><s:url value="?sortBy=name&dir=asc" var="sortByNameAsc" htmlEscape="true"/>
                <s:url value="?sortBy=name&dir=desc" var="sortByNameDesc" htmlEscape="true"/>
                <table>
                    <tr>
                        <td><s:message code="vsezayavki.nickname"/></td>
                        <td><a class="btn-link" href="${sortByNameAsc}">/\</a></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td><a class="btn-link" href="${sortByNameDesc}">\/</a></td>
                    </tr>
                </table>
            </th>

            <th><s:url value="?sortBy=wowClassLocalized&dir=asc" var="sortByClassAsc" htmlEscape="true"/>
                <s:url value="?sortBy=wowClassLocalized&dir=desc" var="sortByClassDesc" htmlEscape="true"/>
                <table>
                    <tr>
                        <td><s:message code="vsezayavki.class"/></td>
                        <td><a href="${sortByClassAsc}">/\</a></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td><a href="${sortByClassDesc}">\/</a></td>
                    </tr>
                </table></th>
            <th><s:url value="?sortBy=wowSpecLocalized&dir=asc" var="sortBySpecAsc" htmlEscape="true"/>
                <s:url value="?sortBy=wowSpecLocalized&dir=desc" var="sortBySpecDesc" htmlEscape="true"/>
                <table>
                    <tr>
                        <td><s:message code="vsezayavki.spec"/></td>
                        <td><a href="${sortBySpecAsc}">/\</a></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td><a href="${sortBySpecDesc}">\/</a></td>
                    </tr>
                </table></th>
            <th><s:url value="?sortBy=ilvl&dir=asc" var="sortByIlvlAsc" htmlEscape="true"/>
                <s:url value="?sortBy=ilvl&dir=desc" var="sortByIlvlDesc" htmlEscape="true"/>
                <table>
                <tr>
                    <td><s:message code="vsezayavki.ilvl"/></td>
                    <td><a href="${sortByIlvlAsc}">/\</a></td>
                </tr>
                <tr>
                    <td></td>
                    <td><a href="${sortByIlvlDesc}">\/</a></td>
                </tr>
            </table></th>
            <th><s:url value="?sortBy=exp&dir=asc" var="sortByExpAsc" htmlEscape="true"/>
                <s:url value="?sortBy=exp&dir=desc" var="sortByExpDesc" htmlEscape="true"/>
                <table>
                    <tr>
                        <td><s:message code="vsezayavki.exp"/></td>
                        <td><a href="${sortByExpAsc}">/\</a></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td><a href="${sortByExpDesc}">\/</a></td>
                    </tr>
                </table></th>
        </tr>
        <c:forEach var="zaya" items="${zlist}">
            <s:url value="/zayavka/{id}" var="link" htmlEscape="true">
                <s:param name="id" value="${zaya.id}"/>
            </s:url>
            <tr>
                <td><a href="${link}"><fmt:formatDate value="${zaya.date}" type="date" dateStyle="medium"/></a></td>
                <td><a href="${link}">${zaya.name}</a></td>
                <td><a href="${link}">${zaya.wowClass.wowClassLoc[0].wowClassLocalized}</a></td>
                <td><a href="${link}">${zaya.wowClass.wowClassLoc[0].wowSpecLocalized}</a></td>
                <td class="ilvl"><a href="${link}">${zaya.ilvl}</a></td>
                <td><a href="${link}">${zaya.exp}</a></td>
            </tr>
        </c:forEach>
    </table>


    <div class="right-side">
        <sec:authentication property="principal.username" var="username"></sec:authentication>
        <s:message code="form.loggedAs"/>${username}

        <sf:form action="/logout" method="post">
            <input type="submit" value="<s:message code="form.logout"/>"/>
        </sf:form>
    </div>
</div>

</div>
</body>
</html>
