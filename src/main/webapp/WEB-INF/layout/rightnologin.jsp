<%@ taglib uri="http://www.springframework.org/tags/form" prefix="sf" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<div class="container-fluid">

    <sec:authorize access="isAnonymous()">

        <h4><s:message code="login.hello"/></h4>

    </sec:authorize>

    <sec:authorize access="isAuthenticated()">
        <div>
            <sec:authentication property="principal.username" var="username"></sec:authentication>
            <s:message code="form.loggedAs"/><strong>${username}</strong>
            <br/><br/>

            <sec:authorize access="isAuthenticated() and hasAnyRole('ROLE_ADMIN', 'ROLE_OFFICER')">
                <s:url value="/vsezayavki/1" var="vse1"/>
                <a class="small" href="${vse1}"><s:message code="form.vseZayavki1"/></a><br/>
                <s:url value="/vseunread/1" var="vseunread1"/>
                <a class="small" href="${vseunread1}">(<s:message code="form.vseZayavkiNew"/><span
                        class="badge">${countUnread1}</span>)</a>
            </sec:authorize>
            <br/>
            <sec:authorize access="isAuthenticated() and hasAnyRole('ROLE_ADMIN', '2NDSTATIC')">
                <s:url value="/vsezayavki/2" var="vse2"/>
                <a class="small" href="${vse2}"><s:message code="form.vseZayavki2"/></a><br/>
                <s:url value="/vseunread/2" var="vseunread2"/>
                <a class="small" href="${vseunread2}">(<s:message code="form.vseZayavkiNew"/><span
                        class="badge">${countUnread2}</span>)</a>
            </sec:authorize>
            <br/><br/>
            <sf:form action="/logout" method="post">
                <input type="submit" class="btn btn-default" value="<s:message code="form.logout"/>"/>
            </sf:form>
        </div>
    </sec:authorize>
</div>