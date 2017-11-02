<%@ taglib uri="http://www.springframework.org/tags/form" prefix="sf" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<script src="<c:url value="/resources/angular.min.js" />"></script>

<%--<title><s:message code="vsezayavki.title"/></title>--%>

<div class="container-fluid">
    <sec:authentication property="principal.username" var="loginId"/>
    <h1>${gstatic}:</h1>
    <%--<h2><s:message code="vsezayavki.hello"/></h2>--%>
    <div ng-app="clickRow" ng-controller="ctr">


        <%--<s:url value="?sortBy=name&dir=asc" var="sortByNameAsc" htmlEscape="true"/>
        <s:url value="?sortBy=name&dir=desc" var="sortByNameDesc" htmlEscape="true"/>--%>

        <table class="table table-hover" cellspacing="0">
            <tr class="warning">
                <th><s:url value="?sortBy=date&dir=asc" var="sortByDateAsc" htmlEscape="true"/>
                    <s:url value="?sortBy=date&dir=desc" var="sortByDateDesc" htmlEscape="true"/>
                    <table>
                        <tr>
                            <td rowspan="2"><s:message code="vsezayavki.date"/></td>

                            <td><a href="${sortByDateAsc}" onclick="window.location.href=this"><span
                                    class="glyphicon glyphicon-triangle-top"></span></a></td>
                        </tr>
                        <tr>
                            <td><a href="${sortByDateDesc}" onclick="window.location.href=this"><span
                                    class="glyphicon glyphicon-triangle-bottom"></span></a></td>
                        </tr>
                    </table>
                </th>
                <th><s:url value="?sortBy=name&dir=asc" var="sortByNameAsc" htmlEscape="true"/>
                    <s:url value="?sortBy=name&dir=desc" var="sortByNameDesc" htmlEscape="true"/>

                    <table>
                        <tr>
                            <td rowspan="2"><s:message code="vsezayavki.nickname"/></td>
                            <td><a href="${sortByNameAsc}" onclick="window.location.href=this"><span
                                    class="glyphicon glyphicon-triangle-top"></span></a></td>
                        </tr>
                        <tr>
                            <td><a href="${sortByNameDesc}" onclick="window.location.href=this"><span
                                    class="glyphicon glyphicon-triangle-bottom"/></a></td>
                        </tr>
                    </table>
                </th>

                <th><s:url value="?sortBy=wowClassLocalized&dir=asc" var="sortByClassAsc" htmlEscape="true"/>
                    <s:url value="?sortBy=wowClassLocalized&dir=desc" var="sortByClassDesc" htmlEscape="true"/>
                    <table>
                        <tr>
                            <td rowspan="2"><s:message code="vsezayavki.class"/></td>
                            <td><a href="${sortByClassAsc}" onclick="window.location.href=this"><span
                                    class="glyphicon glyphicon-triangle-top"/></a></td>
                        </tr>
                        <tr>

                            <td><a href="${sortByClassDesc}" onclick="window.location.href=this"><span
                                    class="glyphicon glyphicon-triangle-bottom"></span></a></td>
                        </tr>
                    </table>
                </th>
                <th><s:url value="?sortBy=wowSpecLocalized&dir=asc" var="sortBySpecAsc" htmlEscape="true"/>
                    <s:url value="?sortBy=wowSpecLocalized&dir=desc" var="sortBySpecDesc" htmlEscape="true"/>
                    <table>
                        <tr>
                            <td rowspan="2"><s:message code="vsezayavki.spec"/></td>
                            <td><a href="${sortBySpecAsc}" onclick="window.location.href=this"><span
                                    class="glyphicon glyphicon-triangle-top"/></a></td>
                        </tr>
                        <tr>

                            <td><a href="${sortBySpecDesc}" onclick="window.location.href=this"><span
                                    class="glyphicon glyphicon-triangle-bottom"></span></a></td>
                        </tr>
                    </table>
                </th>
                <th><s:url value="?sortBy=ilvl&dir=asc" var="sortByIlvlAsc" htmlEscape="true"/>
                    <s:url value="?sortBy=ilvl&dir=desc" var="sortByIlvlDesc" htmlEscape="true"/>
                    <table>
                        <tr>
                            <td rowspan="2"><s:message code="vsezayavki.ilvl"/></td>
                            <td><a href="${sortByIlvlAsc}" onclick="window.location.href=this"><span
                                    class="glyphicon glyphicon-triangle-top"/></a></td>
                        </tr>
                        <tr>

                            <td><a href="${sortByIlvlDesc}" onclick="window.location.href=this"><span
                                    class="glyphicon glyphicon-triangle-bottom"></span></a></td>
                        </tr>
                    </table>
                </th>
                <th><s:url value="?sortBy=exp&dir=asc" var="sortByExpAsc" htmlEscape="true"/>
                    <s:url value="?sortBy=exp&dir=desc" var="sortByExpDesc" htmlEscape="true"/>
                    <table>
                        <tr>
                            <td rowspan="2"><s:message code="vsezayavki.exp"/></td>
                            <td><a href="${sortByExpAsc}" onclick="window.location.href=this"><span
                                    class="glyphicon glyphicon-triangle-top"/></a></td>
                        </tr>
                        <tr>

                            <td><a href="${sortByExpDesc}" onclick="window.location.href=this"><span
                                    class="glyphicon glyphicon-triangle-bottom"></span></a></td>
                        </tr>
                    </table>
                </th>
            </tr>

            <c:forEach var="zaya" items="${zlist}">
                <s:url value="/zayavka/{id}" var="link" htmlEscape="true">
                    <s:param name="id" value="${zaya.id}"/>
                </s:url>

                <tr id="${zaya.id}" ng-show="show${zaya.id}" ng-init="show${zaya.id} = false" ng-click="showZaya('${zaya.id}')" class="hand">
                    <td colspan="6" style="text-align: left; font-size: small">
                        <div class="container-fluid">
                            <h5><s:message code="zayavka.hello"/><c:out value="${zaya.id}"/></h5>
                            <span><s:message code="zayavka.date"/><fmt:formatDate value="${zaya.date}" type="both"
                                                                                  dateStyle="medium"/></span>
                            <br>
                            <br>

                            <s:url value="https://www.wowprogress.com/character/eu/гордунни/{nickname}" var="wplink"
                                   htmlEscape="true">
                                <s:param name="nickname" value="${zaya.name}"/>
                            </s:url>
                            <s:url value="https://worldofwarcraft.com/ru-ru/character/gordunni/{nickname}" var="armlink"
                                   htmlEscape="true">
                                <s:param name="nickname" value="${zaya.name}"/>
                            </s:url>

                            <div>
                                <s:message code="vsezayavki.nickname"/><c:out value="${zaya.name}"/>
                                (<a href="${wplink}" target="_blank" ng-click="showZaya('${zaya.id}')">Wowprogress</a>,
                                <a href="${armlink}" target="_blank" ng-click="showZaya('${zaya.id}')">Armory</a>)
                                <br>
                                <s:message code="vsezayavki.class"/><c:out
                                    value="${zaya.wowClass.wowClassLoc[0].wowClassLocalized}"/><br>
                                <s:message code="vsezayavki.spec"/><c:out
                                    value="${zaya.wowClass.wowClassLoc[0].wowSpecLocalized}"/><br>
                                <s:message code="vsezayavki.ilvl"/><c:out value="${zaya.ilvl}"/><br>
                                <s:message code="vsezayavki.exp"/><c:out value="${zaya.exp}"/><br>
                                <s:message code="zayavka.why"/><c:out value="${zaya.why}"/><br>
                                <s:message code="zayavka.what"/><c:out value="${zaya.what}"/><br>
                            </div>
                        </div>
                    </td>
                </tr>

                <tr ng-click="showZaya('${zaya.id}')" class="hand" id="${zaya.id}" >

                    <td><fmt:formatDate value="${zaya.date}" type="date" dateStyle="medium"/></td>
                    <td>${zaya.name}</td>
                    <td>${zaya.wowClass.wowClassLoc[0].wowClassLocalized}</td>
                    <td>${zaya.wowClass.wowClassLoc[0].wowSpecLocalized}</td>
                    <td class="ilvl">${zaya.ilvl}</td>
                    <td>${zaya.exp}</td>


                </tr>


            </c:forEach>

        </table>

        <script>

            var app = angular.module("clickRow", []);
            app.config(function ($locationProvider) {
                if (window.history && window.history.pushState) {
                    $locationProvider.html5Mode({
                        enabled: true,
                        requireBase: false
                    });
                }
            });

            app.controller("ctr", function ($scope, $http, $window) {
                //$scope.show = false;

                $scope.showZaya = function (id) {
                    $scope["show" + id] = !$scope["show" + id];
                    //$('tr.hand').attr('style','background-color: white');
                    if($scope["show" + id]==true){
                        $('#'+id+'.hand').attr('style','background-color: beige');
                    } else{
                        $('#'+id+'.hand').attr('style','background-color: #fef8d1');
                    }
                    //$('#'+id+'.hand').attr('style','background-color: bisque');
                    //console.log($('#'+id+'.hand').attr('style'));

                }


                /*$http.get("/getvse").then(function (response) {
                    $scope.vseZayavki = response.data;
                    angular.forEach($scope.vseZayavki, function(value, key){
                        $scope.ar1.push(value.name);
                    });

                    alert("AR1: "+$scope.ar1);
                });*/

            });


        </script>

    </div>
    <s:url value="/getvse" var="getvse" htmlEscape="true"></s:url>
    <a href="${getvse}">Все заявки в Джсон</a>


</div>



