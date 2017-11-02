<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="sf" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<%--<title><s:message code="zayavka.title"/>${zayavka.id}</title>--%>

<div class="container-fluid" >
    <h1><s:message code="zayavka.hello"/><c:out value="${zayavka.id}"/></h1>
    <span><s:message code="zayavka.date"/><fmt:formatDate value="${zayavka.date}" type="both"
                                                          dateStyle="medium"/></span>
    <br>
    <br>

    <s:url value="https://www.wowprogress.com/character/eu/гордунни/{nickname}" var="wplink" htmlEscape="true">
        <s:param name="nickname" value="${zayavka.name}"/>
    </s:url>
    <s:url value="https://worldofwarcraft.com/ru-ru/character/gordunni/{nickname}" var="armlink" htmlEscape="true">
        <s:param name="nickname" value="${zayavka.name}"/>
    </s:url>

    <div>
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
    </div>
</div>