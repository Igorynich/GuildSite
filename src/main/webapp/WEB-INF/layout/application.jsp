<%@ taglib uri="http://www.springframework.org/tags/form" prefix="sf" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>


<div class="container-fluid">
    <%--<sec:authorize access="isAuthenticated()">
        <sec:authentication property="principal.username" var="loginId"/>
        <h1><s:message code="form.hello"/> ${loginId}!</h1>
    </sec:authorize>--%>


    <div ng-controller="formctr">

        <sf:form method="POST" commandName="zayavka" acceptCharset="UTF-8" cssClass="form-horizontal">

            <div class="form-group">
                <sf:errors path="*" element="div" cssClass="control-label col-sm-10 alert-danger"></sf:errors>
            </div>
            <br/>

            <div class="form-group">
                <sf:label path="gstatic.staticName" cssErrorClass="control-label col-sm-4 alert-danger"
                          cssClass="control-label col-sm-4">
                    <p class="text-uppercase"><s:message code="form.gstatic"/></p></sf:label>
                <div class="col-sm-7">
                    <sf:radiobuttons path="gstatic.staticName" items="${staticlist}"
                                     itemLabel="staticName" itemValue="staticName" id="rb" onclick="showStaticDesc()"
                                     ng-model="rbChosen" required="true"/>
                </div>
                    <%--<sf:errors path="gstatic.staticName" cssClass="control-label col-sm-10 alert-danger"/>--%>
                    <%--<div id="staticdesc" style="visibility: hidden" class="form-group">
                        <c:forEach var="gstatic" items="${staticlist}">
                            <label id="sl${gstatic.staticName}" class="control-label col-sm-4" style="visibility: hidden">${gstatic.staticDescription}</label>
                        </c:forEach>
                    </div>--%>
            </div>


            <div class="col-sm-12" ng-cloak>
                <div class="col-sm-4"></div>
                <c:forEach items="${staticlist}" var="gsstatic">

                    <div ng-show="rbChosen=='${gsstatic.staticName}'" class="col-sm-6"><p
                            class="staticdesc">${gsstatic.staticDescription}</p></div>
                </c:forEach>
            </div>

            <div class="form-group">
                <sf:label path="name" cssErrorClass="control-label col-sm-4 alert-danger"
                          cssClass="control-label col-sm-4">
                    <p class="text-uppercase"><s:message code="form.name"/></p></sf:label>
                <div class="col-sm-6">
                    <s:message code="form.nameph" var="nameph"/>
                    <sf:input path="name" cssErrorClass="form-control alert-danger" cssClass="form-control"
                              placeholder="${nameph}" required="true" minlength="2" maxlength="12"/>
                </div>
            </div>

            <%--<div id="wowClassDiv" class="form-group">
                <sf:label path="wowClass.shortName" cssErrorClass="control-label col-sm-4 alert-danger"
                          cssClass="control-label col-sm-4">
                    <p class="text-uppercase"><s:message code="form.wowClass"/></p></sf:label>
                <div class="col-sm-6">
                    <sf:select path="wowClass.shortName" id="wowClass" cssErrorClass="form-control alert-danger"
                               cssClass="form-control" >
                        <sf:option value="" label="------ SELECT ------" disabled="false" id="selOption"/>
                        <c:forEach var="clas" items="${classList}">
                            <c:forEach var="wcl" items="${clas.wowClassLoc}">
                                <optgroup label="${wcl.wowClassLocalized}">

                                    <c:forEach var="spec" items="${specList}">
                                        <c:forEach var="wcls" items="${spec.wowClassLoc}">
                                            <c:if test="${wcl.wowClassLocalized eq wcls.wowClassLocalized}">
                                                <option value="${spec.shortName}">${wcls.wowSpecLocalized}</option>

                                            </c:if>
                                        </c:forEach>
                                    </c:forEach>
                                </optgroup>

                            </c:forEach>
                        </c:forEach>

                    </sf:select>
                </div>
            </div>--%>
            <div id="wowClassDiv" class="form-group">
                <sf:label path="" cssErrorClass="control-label col-sm-4 alert-danger"
                          cssClass="control-label col-sm-4">
                    <p class="text-uppercase"><s:message code="form.wowClass"/></p></sf:label>
                <div class="col-sm-6">
                    <sf:select path="" cssErrorClass="form-control alert-danger"
                               cssClass="form-control" ng-model="classChosen" ng-init="classChosen=''"
                               ng-change="selectSpecs(classChosen)" required="true">
                        <sf:option value="" label="------ SELECT ------" disabled="true"/>
                        <c:forEach var="clas" items="${classList}">
                            <c:forEach var="wcl" items="${clas.wowClassLoc}">
                                <option value="${wcl.wowClassLocalized}">${wcl.wowClassLocalized}</option>
                            </c:forEach>
                        </c:forEach>
                    </sf:select>
                </div>
            </div>
            <div ng-show="classWasChosen" class="form-group">
                <sf:label path="wowClass.shortName" cssErrorClass="control-label col-sm-4 alert-danger"
                          cssClass="control-label col-sm-4">
                    <p class="text-uppercase"><s:message code="form.wowSpec"/></p></sf:label>
                <div class="col-sm-6">
                    <sf:select path="wowClass.shortName" cssErrorClass="form-control alert-danger"
                               cssClass="form-control"
                               ng-model="specChosen" ng-init="specChosen=''" required="true">
                        <option value="" label="------ SELECT ------" disabled="true"/>
                        <option ng-repeat="spec in specsForClass" value="{{spec.value}}">{{spec.label}}</option>
                    </sf:select>
                </div>
            </div>

            <%--<br/>
            <div>
                <h4>classChosen = {{classChosen}}</h4>
                <h4>specChosen = {{specChosen}}</h4>
            </div>--%>
            <div class="form-group">
                <sf:label path="ilvl" cssErrorClass="control-label col-sm-4 alert-danger"
                          cssClass="control-label col-sm-4">
                    <p class="text-uppercase"><s:message code="form.ilvl"/></p></sf:label>
                <div class="col-sm-6">
                    <s:message code="form.ilvlph" var="ilvlph"/>
                    <sf:input path="ilvl" cssErrorClass="form-control alert-danger" cssClass="form-control"
                              placeholder="${ilvlph}" required="true" pattern="[0-9]+"/>
                </div>
            </div>

            <div class="form-group">
                <sf:label path="exp" cssErrorClass="control-label col-sm-4 alert-danger"
                          cssClass="control-label col-sm-4">
                    <p class="text-uppercase"><s:message code="form.exp"/></p></sf:label>
                <div class="col-sm-6">
                    <s:message code="form.expph" var="expph"/>
                    <sf:input path="exp" cssErrorClass="form-control alert-danger" cssClass="form-control"
                              placeholder="${expph}" required="true"/>
                </div>
            </div>

            <div class="form-group">
                <sf:label path="why" cssErrorClass="control-label col-sm-4 alert-danger"
                          cssClass="control-label col-sm-4">
                    <p class="text-uppercase"><s:message code="form.why"/></p></sf:label>
                <div class="col-sm-6">
                    <s:message code="form.whyph" var="whyph"/>
                    <sf:textarea path="why" cssErrorClass="form-control alert-danger" cssClass="form-control"
                                 placeholder="${whyph}"/>

                        <%--<span class="help-block">Какая-то дополнительная инфа 1</span>--%>
                </div>
            </div>

            <div class="form-group">
                <sf:label path="what" cssErrorClass="control-label col-sm-4 alert-danger"
                          cssClass="control-label col-sm-4">
                    <p class="text-uppercase"><s:message code="form.what"/></p></sf:label>
                <div class="col-sm-6">
                    <s:message code="form.whatph" var="whatph"/>
                    <sf:textarea path="what" cssErrorClass="form-control alert-danger" cssClass="form-control"
                                 placeholder="${whatph}" rows="3"/>
                        <%--<span class="help-block">Какая-то дополнительная инфа 2</span>--%>
                </div>
            </div>
            <div class="text-left">
                <input class="btn-primary" type="submit"/>
            </div>
        </sf:form>

    </div>


    <%--<sec:authorize access="isAuthenticated() and hasAnyRole('ROLE_ADMIN', 'ROLE_OFFICER')">
        <s:url value="/vsezayavki/1" var="vse"/>
        <a href="${vse}"><s:message code="form.vseZayavki"/><span class="badge">5</span></a>
    </sec:authorize>

    <br/>

    <sec:authorize access="isAuthenticated() and hasAnyRole('ROLE_ADMIN', '2NDSTATIC')">
        <s:url value="/vsezayavki/2" var="vse"/>
        <a href="${vse}"><s:message code="form.vseZayavki"/><span class="badge">2</span></a>
    </sec:authorize>--%>
    <script>
        /*app.config(function ($locationProvider) {
            if (window.history && window.history.pushState) {
                $locationProvider.html5Mode({
                    enabled: true,
                    requireBase: false
                });
            }
        });*/
        app.controller('formctr', function ($scope, $http) {


            $scope.classWasChosen = false;



            $scope.myConcat = function (a, b) {                                       //concat func for c varible  {{c='a'+b}}
                var str = '';
                return $scope[str + a + b];
            }

            $scope.specList = ${specList};
            $scope.specsForClass = [];


            $scope.selectSpecs = function (classChosen) {
                $scope.classWasChosen = true;
                $scope.specsForClass = [];
                angular.forEach($scope.specList, function (value, key) {
                    if (value.wowClassLoc[0].wowClassLocalized === classChosen) {
                        var o = {};
                        o.value = value.wowClassLoc[0].wowClass;
                        o.label = value.wowClassLoc[0].wowSpecLocalized;

                        $scope.specsForClass.push(o);
                    }
                });
            }
            /*$http.get('/getclasslist').then(function (response) {
             $scope.classList = response.data;
             angular.forEach($scope.classList, function (value, key) {
             //console.log('QWERTY=' + value.wowClassLoc[0].wowClassLocalized);

             });
             });*/


        });
    </script>
</div>

