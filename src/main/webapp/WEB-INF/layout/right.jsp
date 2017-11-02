<%@ taglib uri="http://www.springframework.org/tags/form" prefix="sf" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<div class="container-fluid" >

    <sec:authorize access="isAnonymous()">

        <h4><s:message code="login.hello"/></h4>

        <form action="<%=request.getContextPath()%>/gslogin" method="POST">
            <div class="input-group">
                <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                <s:message code="login.username" var="name"/><input type="text" name="gsusername" class="form-control"
                                                                    placeholder="${name}"/>
            </div>
            <div class="input-group">
                <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
                <s:message code="login.password" var="pass"/><input type="password" name="gspassword"
                                                                    class="form-control" placeholder="${pass}"/>
            </div>
            <div class="input-group">
                <input type="checkbox" name="remember-me"></td>
                <s:message code="login.rememberme"/>
            </div>
            <br/>
            <input type="submit" value="<s:message code="login.login"/>" class="btn btn-default"/>
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        </form>

    </sec:authorize>

    <sec:authorize access="isAuthenticated()">

        <div ng-controller="rightctr" ng-cloak>
            <sec:authentication property="principal.username" var="username"></sec:authentication>
            <s:message code="form.loggedAs"/><strong>${username}</strong>
            <br/><br/>

            <sec:authorize access="isAuthenticated() and hasAnyRole('ROLE_ADMIN', 'ROLE_OFFICER')">
                <s:url value="/vsezayavki/1" var="vse1"/>
                <a class="small" href="${vse1}"><s:message code="form.vseZayavki1"/></a><br/>
                <s:url value="/vseunread/1" var="vseunread1"/>
                <a class="small" href="${vseunread1}">(<s:message code="form.vseZayavkiNew"/><span class="badge">{{numOfUnread1}}{{ampu1}}</span>)</a>
                <s:url value="/vsechosen/1" var="vsechosen1"/>
                <a class="small" href="${vsechosen1}">(<s:message code="form.vseZayavkiChosen"/><span
                        class="badge">{{numOfChosen1}}{{ampc1}}</span>)</a>
            </sec:authorize>
            <br/>
            <sec:authorize access="isAuthenticated() and hasAnyRole('ROLE_ADMIN', '2NDSTATIC')">
                <%--<s:url value="/vsezayavki/2" var="vse2"/>--%>
                <a class="small" href="http://localhost:8080/vsezayavki/2"><s:message code="form.vseZayavki2"/></a><br/>
                <s:url value="/vseunread/2" var="vseunread2"/>
                <a class="small" href="${vseunread2}">(<s:message code="form.vseZayavkiNew"/><span
                        class="badge">{{numOfUnread2}}{{ampu2}}</span>)</a>
                <s:url value="/vsechosen/2" var="vsechosen2"/>
                <a class="small" href="${vsechosen2}">(<s:message code="form.vseZayavkiChosen"/><span
                        class="badge">{{numOfChosen2}}{{ampc2}}</span>)</a>
            </sec:authorize>
            <br/><br/>
            <sf:form action="/logout" method="post">
                <input type="submit" class="btn btn-default" value="<s:message code="form.logout"/>"/>
            </sf:form>

            <script>
                /*app.config(function ($locationProvider) {
                    if (window.history && window.history.pushState) {
                        $locationProvider.html5Mode({
                            enabled: true,
                            requireBase: false
                        });
                    }
                });*/
                app.controller('rightctr', function ($scope, $http, $interval) {
                    $scope.numOfUnread1 = 0;
                    $scope.numOfUnread2 = 0;
                    $scope.numOfChosen1 = 0;
                    $scope.numOfChosen2 = 0;

                    $scope.ampu1 = '';
                    $scope.ampu2 = '';
                    $scope.ampc1 = '';
                    $scope.ampc2 = '';

                    var counter = 0;

                    var getUpdate = function () {
                        $http.get('/getcounts').then(function (response) {
                            $scope.ampu1 = '';
                            $scope.ampu2 = '';
                            $scope.ampc1 = '';
                            $scope.ampc2 = '';
                            var clist = response.data;
                            if ($scope.numOfUnread1 != clist[0]) {
                                if (clist[0] != 0 && counter>0) {
                                    $scope.ampu1 = '!';
                                }
                                $scope.numOfUnread1 = clist[0];
                            }
                            if ($scope.numOfUnread2 != clist[1]) {
                                if (clist[1] != 0 && counter>0) {
                                    $scope.ampu2 = '!';
                                }
                                $scope.numOfUnread2 = clist[1];
                            }
                            if ($scope.numOfChosen1 != clist[2]) {
                                if (clist[2] != 0 && counter>0) {
                                    $scope.ampc1 = '!';
                                }
                                $scope.numOfChosen1 = clist[2];
                            }
                            if ($scope.numOfChosen2 != clist[3]) {
                                if (clist[3] != 0 && counter>0) {
                                    $scope.ampc2 = '!';
                                }
                                $scope.numOfChosen2 = clist[3];
                            }

                        });
                    }

                    getUpdate();
                    /*var stop = $interval(function () {
                     getUpdate();
                     counter++;
                     }, 6000, 10);*/

                    /*$(window).on('beforeunload', function (e) {
                     if (angular.isDefined(stop)) {
                     $interval.cancel(stop);
                     stop = undefined;
                     counter = 0;
                     }
                     });*/

                    $scope.$on('$destroy', function () {
                        if (angular.isDefined(stop)) {
                            $interval.cancel(stop);
                            stop = undefined;
                            counter = 0;
                        }
                    });
                });
            </script>

        </div>
    </sec:authorize>




</div>

