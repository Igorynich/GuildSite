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
    <div ng-controller="ctr">
        <h2>Angular code</h2>

        <%--<s:url value="?sortBy=name&dir=asc" var="sortByNameAsc" htmlEscape="true"/>
        <s:url value="?sortBy=name&dir=desc" var="sortByNameDesc" htmlEscape="true"/>--%>

        <table class="table table-hover" cellspacing="0" ng-cloak>
            <tr class="warning" ng-cloak>
                <th style="width: 15%">
                    <button ng-click="sortBy('date')"><s:message code="vsezayavki.date"/></button>
                    <br/>
                    <span class="sortorder" ng-show="(orderByValue === 'date')" ng-class="{reverse: reverse}"/>


                    <%--<table>
                        <tr>
                            <td rowspan="2"><s:message code="vsezayavki.date"/></td>

                            <td><a href="" ng-click="sortBy('date', false)"><span
                                    class="glyphicon glyphicon-triangle-top"></span></a></td>
                        </tr>
                        <tr>
                            <td><a href="" ng-click="sortBy('date', true)"><span
                                    class="glyphicon glyphicon-triangle-bottom"></span></a></td>
                        </tr>
                    </table>--%>
                </th>
                <th style="width: 15%">
                    <button ng-click="sortBy('name')"><s:message code="vsezayavki.nickname"/></button>
                    <br/>
                    <span class="sortorder" ng-show="(orderByValue === 'name')" ng-class="{reverse: reverse}"/>
                    <%--<table>
                        <tr>
                            <td rowspan="2"><s:message code="vsezayavki.nickname"/></td>
                            <td><a href="" ng-click="sortBy('name')"><span
                                    class="glyphicon glyphicon-triangle-top"></span></a></td>
                        </tr>
                        <tr>
                            <td><a href="" ng-click="sortBy('name')"><span
                                    class="glyphicon glyphicon-triangle-bottom"/></a></td>
                        </tr>
                    </table>--%>
                </th>

                <th style="width: 45%">
                    <button ng-click="sortBy('wowClass.wowClassLoc[0].wowClassLocalized')"><s:message
                            code="vsezayavki.class"/></button>
                    <br/>
                    <span class="sortorder" ng-show="(orderByValue === 'wowClass.wowClassLoc[0].wowClassLocalized')"
                          ng-class="{reverse: reverse}"/>
                    <%--<table>

                        <tr>
                            <td rowspan="2" style="width: 90%"><s:message code="vsezayavki.class"/></td>
                            <td><a href=""
                                   ng-click="sortBy('wowClass.wowClassLoc[0].wowClassLocalized', false)"><span
                                    class="glyphicon glyphicon-triangle-top"/></a></td>
                        </tr>
                        <tr>

                            <td><a href=""
                                   ng-click="sortBy('wowClass.wowClassLoc[0].wowClassLocalized', true)"><span
                                    class="glyphicon glyphicon-triangle-bottom"></span></a></td>
                        </tr>

                    </table>--%>
                </th>
                <%--<th>
                    <table>
                        <tr>
                            <td rowspan="2" align="center"><s:message code="vsezayavki.spec"/></td>
                            <td align="center"><a href=""
                                                  ng-click="sortBy('wowClass.wowClassLoc[0].wowSpecLocalized', false)"><span
                                    class="glyphicon glyphicon-triangle-top"/></a></td>
                        </tr>
                        <tr>

                            <td align="center"><a href=""
                                                  ng-click="sortBy('wowClass.wowClassLoc[0].wowSpecLocalized', true)"><span
                                    class="glyphicon glyphicon-triangle-bottom"></span></a></td>
                        </tr>
                    </table>
                </th>--%>
                <th class="ilvl" style="width: 10%">
                    <button ng-click="sortBy('ilvl')"><s:message code="vsezayavki.ilvl"/></button>
                    <br/>
                    <span class="sortorder" ng-show="(orderByValue === 'ilvl')" ng-class="{reverse: reverse}"/>
                    <%--<table>
                        <tr>
                            <td rowspan="2"><s:message code="vsezayavki.ilvl"/></td>
                            <td><a href="" ng-click="sortBy('ilvl', false)"><span
                                    class="glyphicon glyphicon-triangle-top"/></a></td>
                        </tr>
                        <tr>

                            <td><a href="" ng-click="sortBy('ilvl', true)"><span
                                    class="glyphicon glyphicon-triangle-bottom"></span></a></td>
                        </tr>
                    </table>--%>
                </th>
                <th class="exp" style="width: 20%">
                    <button ng-click="sortBy('exp')"><s:message code="vsezayavki.exp"/></button>
                    <br/>
                    <span class="sortorder" ng-show="(orderByValue === 'exp')" ng-class="{reverse: reverse}"/>
                    <%--<table>
                        <tr>
                            <td rowspan="2"><s:message code="vsezayavki.exp"/></td>
                            <td><a href="" ng-click="sortBy('exp', false)"><span
                                    class="glyphicon glyphicon-triangle-top"/></a></td>
                        </tr>
                        <tr>

                            <td><a href="" ng-click="sortBy('exp', true)"><span
                                    class="glyphicon glyphicon-triangle-bottom"></span></a></td>
                        </tr>
                    </table>--%>
                </th>
                <th>
                    <button ng-click="" ng-disabled="true">Избр.</button>
                    <br/> <%--add s:message--%>
                    <%--<span class="sortorder" ng-show="(orderByValue === 'name')" ng-class="{reverse: reverse}"/>--%>
                </th>
            </tr>
            <%--  ----------------------------------------------------------------------------------------------------------------------------  --%>

            <tr ng-repeat-start="z in currPageZayaList" id="{{z.id}}" ng-show="myConcat('show', z.id)"
                ng-init="myConcat('show', z.id) = false" ng-click="showZaya(z)" ng-cloak class="tablo">
                <td colspan="6" zayavka-info></td>
            </tr>
            <%--  ----------------------------------------------------------------------------------------------------------------------------  --%>
            <tr ng-repeat-end ng-click="showZaya(z)" id="{{z.id}}" ng-cloak ng-class="isRead(z)">
                <td>{{z.date | date : 'dd.MM.yy'}}</td>
                <td>{{z.name}}</td>
                <td class="classspec">{{z.wowClass.wowClassLoc[0].wowClassLocalized}}
                    ({{z.wowClass.wowClassLoc[0].wowSpecLocalized}})
                </td>
                <%--<td>{{z.wowClass.wowClassLoc[0].wowSpecLocalized}}</td>--%>
                <td class="ilvl">{{z.ilvl}}</td>
                <td class="exp">{{z.exp}}</td>
                <td><input type="checkbox" ng-model="checked" ng-init="checked=z.chosen"
                           ng-click="addToChosen(z, checked)" ng-checked="z.chosen"/></td>
            </tr>
            <%--  ----------------------------------------------------------------------------------------------------------------------------  --%>
            <tr ng-repeat="d in dummyArray track by $index" ng-cloak>
                <td colspan="6">-</td>

            </tr>

        </table>
        <%--  ----------------------------------------------------------------------------------------------------------------------------  --%>
        <div class="text-right">
            <select ng-model="zCount" ng-options="item for item in zOnPage" ng-change="pageCountUpdate(zCount)">

            </select>
        </div>
        <%--  ----------------------------------------------------------------------------------------------------------------------------  --%>

       <%-- <div ng-cloak>
            <h4>OrderByValue: {{orderByValue}}</h4><h4>Reverse: {{reverse}}</h4><br/>
            <h4>ReadList = {{readList}}</h4>
            <h4>ChosenList = {{chosenList}}</h4>
            <h4>pageCount = {{pageCount}}</h4>
            <h4>length ={{currPageZayaList.length}}</h4>
            <h4>zCount = {{zCount}}</h4>
            <h4>Dummy = {{dummyArray}}</h4>
        </div>--%>
        <%--  ----------------------------------------------------------------------------------------------------------------------------  --%>

        <div class="text-center" ng-cloak>
            <ul class="pagination">
                <li ng-repeat="pageN in pageNumbers track by $index" class="{{myConcat('active',$index)}}"><a href=""
                                                                                                              ng-click="setActivePage($index)">{{$index+1}}</a>
                </li>
                <%--<li class="active"><a href="">2</a></li>--%>
            </ul>
        </div>
        <%--  ----------------------------------------------------------------------------------------------------------------------------  --%>


        <script id="zinfo" type="text/ng-template"
                ng-cloak>                                                                    <%--template--%>

        <td style="text-align: left; font-size: small; margin-left: 150px">
            <div class="container-fluid">
                <div class="col-sm-8">
                    <h5><s:message code="zayavka.hello"/>{{z.id}}</h5>
                    <span><s:message code="zayavka.date"/>{{z.date | date : 'dd.MM.yy HH:mm'}}</span>
                    <br>
                    <br>

                    <div>
                        <s:message code="vsezayavki.nickname"/>{{z.name}}
                        (<a href="https://www.wowprogress.com/character/eu/гордунни/{{z.name}}" target="_blank"
                            ng-click="showZaya(z)">Wowprogress</a>,
                        <a href="https://worldofwarcraft.com/ru-ru/character/gordunni/{{z.name}}" target="_blank"
                           ng-click="showZaya(z)">Armory</a>)
                        <br>
                        <s:message code="vsezayavki.class"/>{{z.wowClass.wowClassLoc[0].wowClassLocalized}}<br>
                        <s:message code="vsezayavki.spec"/>{{z.wowClass.wowClassLoc[0].wowSpecLocalized}}<br>
                        <s:message code="vsezayavki.ilvl"/>{{z.ilvl}}<br>
                        <s:message code="vsezayavki.exp"/>{{z.exp}}<br>
                        <s:message code="zayavka.why"/>{{z.why}}<br>
                        <s:message code="zayavka.what"/>{{z.what}}<br>
                    </div>
                </div>
                <div class="col-sm-4" style="margin-top: 10%">

                    <img src="/resources/read.png" width="100%"/>
                </div>
            </div>
        </td>
        </script>

        <script>

            /*app.config(function ($locationProvider) {
             if (window.history && window.history.pushState) {
             $locationProvider.html5Mode({
             enabled: true,
             requireBase: false
             });
             }
             });*/

            app.controller("ctr", function ($scope, $http, $location) {


                    $scope.readList = [];
                    $scope.chosenList = [];
                    $scope.reverse = false;
                    $scope.orderByValue = 'date';
                    $scope.zOnPage = [5, 10, 20, 30];
                    $scope.zCount = 10;
                    $scope.currPage = 1;
                    $scope.currPageZayaList = [];
                    $scope.active0 = 'active';

                    $scope.updatecurrPageZayaList = function () {
                        $scope.currPageZayaList = $scope.vseZayavki.slice(($scope.currPage - 1) * $scope.zCount, $scope.currPage * $scope.zCount);
                        if ($scope.currPageZayaList.length == 0 && $scope.currPage>1) {
                            $scope.setActivePage($scope.currPage - 2);
                        }
                        if ($scope.currPage != 1) {
                            $scope.notEnough = $scope.zCount - $scope.currPageZayaList.length;
                            $scope.dummyArray = new Array($scope.notEnough);
                        } else {
                            $scope.dummyArray = [];
                        }
                        /*var empty = $scope.vseZayavki[0];
                         while ($scope.currPageZayaList.length != $scope.zCount) {
                         $scope.currPageZayaList.push(empty);
                         }*/
                    }

                    $scope.vseZayavki = ${zlist};

                    $scope.pageCount = Math.ceil($scope.vseZayavki.length / $scope.zCount);
                    $scope.pageNumbers = new Array($scope.pageCount);
                    $scope.updatecurrPageZayaList();

                    $scope.myConcat = function (a, b) {                                       //concat func for c varible  {{c='a'+'b'}}
                        var str = '';
                        return $scope[str + a + b];
                    }

                    $scope.isRead = function (z) {

                        if ($scope["show" + z.id] === true) {
                            return "open";
                        }
                        if (z.read === true) {
                            return "read";
                        }

                    }


                    $scope.pageCountUpdate = function (zCount) {
                        $scope.pageCount = Math.ceil($scope.vseZayavki.length / zCount);
                        $scope.pageNumbers.length = $scope.pageCount;

                        $scope.setActivePage($scope.currPage - 1);
                    }

                        /*var currPath = $location.absUrl();
                         //alert($location.path() + " -- " + $location.absUrl()+ " -- "+ $location.url()+" -- "+ $location.host());
                         var getUrl = '';
                         if (currPath === 'http://localhost:8080/vsezayavki/1') {
                         getUrl = "/getvse/1";
                         }
                         if (currPath === 'http://localhost:8080/vsezayavki/2') {
                         getUrl = "/getvse/2";
                         }
                         if (currPath === 'http://localhost:8080/vseunread/1') {
                         getUrl = "/getunread/1";
                         }
                         if (currPath === 'http://localhost:8080/vseunread/2') {
                         getUrl = "/getunread/2";
                         }
                         if (currPath === 'http://localhost:8080/vsechosen/1') {
                         getUrl = "/getchosen/1";
                         }
                         if (currPath === 'http://localhost:8080/vsechosen/2') {
                         getUrl = "/getchosen/2";
                         }
                         $http.get(getUrl).then(function (response) {                     //gettin zayavka list from server in json
                         $scope.vseZayavki = response.data;
                         $scope.pageCount = Math.ceil($scope.vseZayavki.length / $scope.zCount);
                         $scope.pageNumbers = new Array($scope.pageCount);
                         $scope.updatecurrPageZayaList();
                         });*/


                    $scope.setActivePage = function (index) {                                           //settin pagination li to active
                        for (i = 0; i < $scope.pageNumbers.length; i++) {
                            $scope['active' + i] = '';
                        }
                        $scope['active' + index] = 'active';
                        $scope.currPage = index + 1;
                        $scope.updatecurrPageZayaList();
                    }

                    $scope.showZaya = function (z) {                                                //show-hide control func
                        //$scope.z = z;
                        $scope["show" + z.id] = !$scope["show" + z.id];
                        if (($scope.readList.indexOf(z.id) == -1) && (z.id != null) && (z.read != true)) {               /*!=null скорее не нужно, но пусть будет*/
                            $scope.readList.push(z.id);                                                    //adding read zayavki id to array
                        }
                        z.read = true;
                        if ($scope["show" + z.id] === true) {                                        //coloring
                            $('#' + z.id).attr('style', 'background-color: #D1FFB1');
                        }
                        /*else {
                         $('#' + z.id).attr('style', 'background-color: #fef8d1');
                         }*/

                    }

                    $scope.addToChosen = function (z, checked) {                                                          //filling chosen list
                        $scope.showZaya(z);
                        //alert('Checked = ' + checked);
                        if ((checked === true) && ($scope.chosenList.indexOf(z.id) === -1) && (z.chosen === false)) {
                            $scope.chosenList.push(z.id);
                        }
                        if ((checked === false) && ($scope.chosenList.indexOf(z.id) != -1) && (z.chosen === false)) {
                            $scope.chosenList.splice($scope.chosenList.indexOf(z.id), 1);
                        }
                        if ((checked === false) && ($scope.chosenList.indexOf(z.id) === -1) && (z.chosen === true)) {
                            $scope.chosenList.push(z.id);
                        }
                        if ((checked === true) && ($scope.chosenList.indexOf(z.id) != -1) && (z.chosen === true)) {
                            $scope.chosenList.splice($scope.chosenList.indexOf(z.id), 1);
                        }
                    }

                    $scope.sortBy = function (orderByValue) {                  //setter func for orderBy

                        if ($scope.orderByValue === orderByValue) {
                            $scope.reverse = !$scope.reverse;
                        }
                        $scope.orderByValue = orderByValue;
                        $scope.vseZayavki.sort($scope.sortAllByAtt($scope.orderByValue, $scope.reverse));
                        $scope.updatecurrPageZayaList();
                    }

                        /*$scope.goToZaya = function (myurl) {                                //link to zayavka info page (not used)
                         $window.location.href = "/zayavka/" + myurl;
                         }*/


                    $scope.sortAllByAtt = function (orderByValue, reverse) {                     //sort function for zaya list
                        var sortDir = 1;
                        if (reverse == true) {
                            sortDir = -1;
                        }

                        if (orderByValue === 'wowClass.wowClassLoc[0].wowClassLocalized') {
                            return function (a, b) {
                                var res = 0;
                                if (a['wowClass']['wowClassLoc'][0]['wowClassLocalized'] < b['wowClass']['wowClassLoc'][0]['wowClassLocalized']) {            //wowClass.wowClassLoc[0].wowClassLocalized
                                    res = -1;
                                }
                                if (a['wowClass']['wowClassLoc'][0]['wowClassLocalized'] > b['wowClass']['wowClassLoc'][0]['wowClassLocalized']) {
                                    res = 1;
                                }
                                if ((a['wowClass']['wowClassLoc'][0]['wowClassLocalized'] === b['wowClass']['wowClassLoc'][0]['wowClassLocalized'])) {
                                    if (a['wowClass']['wowClassLoc'][0]['wowSpecLocalized'] < b['wowClass']['wowClassLoc'][0]['wowSpecLocalized']) {            //wowClass.wowClassLoc[0].wowClassLocalized
                                        res = -1;
                                    }
                                    if (a['wowClass']['wowClassLoc'][0]['wowSpecLocalized'] > b['wowClass']['wowClassLoc'][0]['wowSpecLocalized']) {
                                        res = 1;
                                    }
                                }
                                return res * sortDir;
                            }
                        }

                        return function (a, b) {
                            var res = 0;
                            if (a[orderByValue] < b[orderByValue]) {            //wowClass.wowClassLoc[0].wowSpecLocalized
                                res = -1;
                            }
                            if (a[orderByValue] > b[orderByValue]) {
                                res = 1;
                            }
                            return res * sortDir;
                        }

                    };


                        /*if ($scope.vseZayavki != undefined) {
                         $scope.vseZayavki.sort($scope.sortAllByAtt($scope.orderByValue, $scope.reverse));       //sorting
                         }*/

                    var token = $("meta[name='_csrf']").attr("content");                //sending readList to server
                    var header = $("meta[name='_csrf_header']").attr("content");

                    $(document).ajaxSend(function (e, xhr, options) {                   //settin csfr
                        xhr.setRequestHeader(header, token);
                    });

                    $(window).on('beforeunload', function (e) {
                        if ($scope.readList.length > 0) {
                            var data = angular.toJson($scope.readList);
                            $.ajax({
                                    type: 'POST',
                                    url: '/readList',
                                    async: false,
                                    data: data,
                                    dataType: "json",
                                    headers: {
                                        'Accept': 'application/json',
                                        'Content-Type': 'application/json'
                                    }

                                }
                            );
                        }
                        if ($scope.chosenList.length > 0) {
                            var data = angular.toJson($scope.chosenList);
                            $.ajax({
                                    type: 'POST',
                                    url: '/chosenList',
                                    async: false,
                                    data: data,
                                    dataType: "json",
                                    headers: {
                                        'Accept': 'application/json',
                                        'Content-Type': 'application/json'
                                    }

                                }
                            );
                        }
                    });


                }
            )
            ;
            app.directive("zayavkaInfo", function () {                              //directive with additional info for a single Zayavka
                return {templateUrl: "zinfo"}
            });

        </script>


    </div>


</div>



