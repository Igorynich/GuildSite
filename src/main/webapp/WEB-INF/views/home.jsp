<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="sf" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title><s:message code="form.title"/></title>
    <script type="text/javascript">
        /*function showSpecs() {
            document.getElementById('selOption').disabled = 'true';

            var selectBox = document.getElementById('wowClass');
            var userInput = selectBox.options[selectBox.selectedIndex].value;
            if (userInput == 'DEATH KNIGHT') {
                document.getElementById('dkSpecs').style.display = 'inline';
                document.getElementById('dkSpec').path = 'wowSpec';
            } else {
                document.getElementById('dkSpecs').style.display = 'none';
                document.getElementById('dkSpec').path = '';
            }
            if (userInput == 'DEMON HUNTER') {
                document.getElementById('dhSpecs').style.display = 'inline';
                document.getElementById('dhSpec').path = 'wowSpec';
            } else {
                document.getElementById('dhSpecs').style.display = 'none';
                document.getElementById('dhSpec').path = '';
            }
            if (userInput == 'DRUID') {
                document.getElementById('druSpecs').style.display = 'inline';
                document.getElementById('druSpec').path = 'wowSpec';
            } else {
                document.getElementById('druSpecs').style.display = 'none';
                document.getElementById('druSpec').path = '';
            }
            if (userInput == 'HUNTER') {
                document.getElementById('huntSpecs').style.display = 'inline';
                document.getElementById('huntSpec').path = 'wowSpec';
            } else {
                document.getElementById('huntSpecs').style.display = 'none';
                document.getElementById('huntSpec').path = '';
            }
            if (userInput == 'MAGE') {
                document.getElementById('mageSpecs').style.display = 'inline';
                document.getElementById('mageSpec').path = 'wowSpec';
            } else {
                document.getElementById('mageSpecs').style.display = 'none';
                document.getElementById('mageSpec').path = '';
            }
            if (userInput == 'MONK') {
                document.getElementById('monkSpecs').style.display = 'inline';
                document.getElementById('monkSpec').path = 'wowSpec';
            } else {
                document.getElementById('monkSpecs').style.display = 'none';
                document.getElementById('monkSpec').path = '';
            }
            if (userInput == 'PALADIN') {
                document.getElementById('palSpecs').style.display = 'inline';
                document.getElementById('palSpec').path = 'wowSpec';
            } else {
                document.getElementById('palSpecs').style.display = 'none';
                document.getElementById('palSpec').path = '';
            }
            if (userInput == 'PRIEST') {
                document.getElementById('priestSpecs').style.display = 'inline';
                document.getElementById('priestSpec').path = 'wowSpec';
            } else {
                document.getElementById('priestSpecs').style.display = 'none';
                document.getElementById('priestSpec').path = '';
            }
            if (userInput == 'ROGUE') {
                document.getElementById('rogueSpecs').style.display = 'inline';
                document.getElementById('rogueSpec').path = 'wowSpec';
            } else {
                document.getElementById('rogueSpecs').style.display = 'none';
                document.getElementById('rogueSpec').path = '';
            }
            if (userInput == 'SHAMAN') {
                document.getElementById('shamSpecs').style.display = 'inline';
                document.getElementById('shamSpec').path = 'wowSpec';
            } else {
                document.getElementById('shamSpecs').style.display = 'none';
                document.getElementById('shamSpec').path = '';
            }
            if (userInput == 'WARLOCK') {
                document.getElementById('lockSpecs').style.display = 'inline';
                document.getElementById('lockSpec').path = 'wowSpec';
            } else {
                document.getElementById('lockSpecs').style.display = 'none';
                document.getElementById('lockSpec').path = '';
            }
            if (userInput == 'WARRIOR') {
                document.getElementById('warSpecs').style.display = 'inline';
                document.getElementById('warSpec').path = 'wowSpec';
            } else {
                document.getElementById('warSpecs').style.display = 'none';
                document.getElementById('warSpec').path = '';
            }
            return false;
        }
        function showSpecs1() {
            document.getElementById('selOption').disabled = 'true';
            var dk = '${dkSpecList}';
            var dh = '${dhSpecList}';

            var selectBox = document.getElementById('wowClass');
            var userInput = selectBox.options[selectBox.selectedIndex].value;
            if (userInput == 'DEATH KNIGHT') {
                document.getElementById('specs').style.visibility = 'visible';
                document.getElementById('specOption').items = dk;
            }
            if (userInput == 'DEMON HUNTER') {
                document.getElementById('specs').style.visibility = 'visible';
                document.getElementById('specOption').items = dh;
            }
            if (userInput == 'DRUID') {
                document.getElementById('specs').style.visibility = 'visible';
                document.getElementById('specOption').items = '${druSpecList}';
            }
            if (userInput == 'HUNTER') {
                document.getElementById('specs').style.visibility = 'visible';
                document.getElementById('specOption').items = '${huntSpecList}';
            }
            if (userInput == 'MAGE') {
                document.getElementById('specs').style.visibility = 'visible';
                document.getElementById('specOption').items = '${mageSpecList}';
            }
            if (userInput == 'MONK') {
                document.getElementById('specs').style.visibility = 'visible';
                document.getElementById('specOption').items = '${monkSpecList}';
            }
            if (userInput == 'PALADIN') {
                document.getElementById('specs').style.visibility = 'visible';
                document.getElementById('specOption').items = '${palSpecList}';
            }
            if (userInput == 'PRIEST') {
                document.getElementById('specs').style.visibility = 'visible';
                document.getElementById('specOption').items = '${priestSpecList}';
            }
            if (userInput == 'ROGUE') {
                document.getElementById('specs').style.visibility = 'visible';
                document.getElementById('specOption').items = '${rogueSpecList}';
            }
            if (userInput == 'SHAMAN') {
                document.getElementById('specs').style.visibility = 'visible';
                document.getElementById('specOption').items = '${shamSpecList}';
            }
            if (userInput == 'WARLOCK') {
                document.getElementById('specs').style.visibility = 'visible';
                document.getElementById('specOption').items = '${lockSpecList}';
            }
            if (userInput == 'WARRIOR') {
                document.getElementById('specs').style.visibility = 'visible';
                document.getElementById('specOption').items = '${warSpecList}';
            }
            return false;

        }*/

    </script>
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

        div.errors {
            color: red;
        }

        label.errors {
            color: red;
        }

        input.errors {
            background-color: darksalmon;
        }
        select.errors{
            background-color: darksalmon;
        }
        div.green{
            color: #32AA21;
        }
    </style>
</head>
<body>
<sec:authorize access="isAuthenticated()">
    <sec:authentication property="principal.username" var="loginId"/>
    <h1><s:message code="form.hello"/> ${loginId}!</h1>
</sec:authorize>

<div class="mainform">

    <sf:form method="POST" commandName="zayavka" acceptCharset="UTF-8">

        <sf:errors path="*" element="div" cssClass="errors"></sf:errors>

        <sf:label path="name" cssErrorClass="errors"><s:message code="form.name"/></sf:label>
        <sf:input path="name" cssErrorClass="errors"/> <br/>

        <div id="wowClassDiv" style="visibility: visible">
            <sf:label path="wowClass.shortName" cssErrorClass="errors"><s:message code="form.wowClass"/></sf:label>
            <sf:select path="wowClass.shortName" id="wowClass" cssErrorClass="errors">
            <sf:option value="" label="--- Select ---" disabled="false" id="selOption" cssErrorClass="errors"/>
            <c:forEach var="clas" items="${classList}">

                <optgroup label="${clas.wowClass}">

                    <c:forEach var="spec" items="${specList}">
                        <c:if test="${clas.wowClass eq spec.wowClass}">
                            <option value="${spec.shortName}" label="${spec.wowSpec}" />

                        </c:if>
                    </c:forEach>
                </optgroup>
            </c:forEach>


            <%--
        <optgroup label="DEATH KNIGHT">
            <option value="bdk" label="BLOOD"</>
            <option value="fdk" label="FROST"</>
            <option value="udk" label="UNHOLY"</>
        </optgroup>
        <optgroup label="DEMON HUNTER">
            <option value="hdh" label="HAVOC"</>
            <option value="vdh" label="VENGEANCE"</>
        </optgroup>
        <optgroup label="DRUID">
            <option value="rdru" label="RESTORATION"</>
            <option value="fdru" label="FERAL"</>
            <option value="gdru" label="GUARDIAN"</>
            <option value="bdru" label="BALANCE"</>
        </optgroup>
        <optgroup label="HUNTER">
            <option value="shunt" label="SURVIVAL"</>
            <option value="bmhunt" label="BEAST MASTERY"</>
            <option value="mhunt" label="MARKSMANSHIP"</>
        </optgroup>
        <optgroup label="MAGE">
            <option value="amage" label="ARCANE"</>
            <option value="fimage" label="FIRE"</>
            <option value="frmage" label="FROST"</>
        </optgroup>
        <optgroup label="MONK">
            <option value="bmonk" label="BREWMASTER"</>
            <option value="mmonk" label="MISTWEAVER"</>
            <option value="wmonk" label="WINDWALKER"</>
        </optgroup>
        <optgroup label="PALADIN">
            <option value="hpal" label="HOLY"</>
            <option value="rpal" label="RETRIBUTION"</>
            <option value="ppal" label="PROTECTION"</>
        </optgroup>
        <optgroup label="PRIEST">
            <option value="hpriest" label="HOLY"</>
            <option value="spriest" label="SHADOW"</>
            <option value="dpriest" label="DISCIPLINE"</>
        </optgroup>
        <optgroup label="ROGUE">
            <option value="arogue" label="ASSASSINATION"</>
            <option value="orogue" label="OUTLAW"</>
            <option value="srogue" label="SUBTLETY"</>
        </optgroup>
        <optgroup label="SHAMAN">
            <option value="elsham" label="ELEMENTAL"</>
            <option value="ensham" label="ENHANCEMENT"</>
            <option value="mhunt" label="MARKSMANSHIP"</>
        </optgroup>
        <optgroup label="WARLOCK">
            <option value="alock" label="AFFLICTION"</>
            <option value="demlock" label="DEMONOLOGY"</>
            <option value="deslock" label="DESTRUCTION"</>
        </optgroup>
        <optgroup label="WARRIOR">
            <option value="awar" label="ARMS"</>
            <option value="fwar" label="FURY"</>
            <option value="pwar" label="PROTECTION"</>
        </optgroup>--%>
        </sf:select><br/>
        </div>


        <%-- <div id="dkSpecs" style="display: none">
            Специализация: <sf:select path="" id="dkSpec">
                <sf:option value="NONE" label="--- Select ---" />
                <sf:options items="${dkSpecList}" />
            </sf:select><br/>
        </div>
        <div id="dhSpecs" style="display: none">
            Специализация: <sf:select path="" id="dhSpec">
                <sf:option value="NONE" label="--- Select ---" />
                <sf:options items="${dhSpecList}" />
            </sf:select><br/>
        </div>
        <div id="druSpecs" style="display: none">
            Специализация: <sf:select path="" id="druSpec">
                <sf:option value="NONE" label="--- Select ---" />
                <sf:options items="${druSpecList}" />
            </sf:select><br/>
        </div>
        <div id="huntSpecs" style="display: none">
            Специализация: <sf:select path="" id="huntSpec">
                <sf:option value="NONE" label="--- Select ---" />
                <sf:options items="${huntSpecList}" />
            </sf:select><br/>
        </div>
        <div id="mageSpecs" style="display: none">
            Специализация: <sf:select path="" id="mageSpec">
                <sf:option value="NONE" label="--- Select ---" />
                <sf:options items="${mageSpecList}" />
            </sf:select><br/>
        </div>
        <div id="monkSpecs" style="display: none">
            Специализация: <sf:select path="" id="monkSpec">
                <sf:option value="NONE" label="--- Select ---" />
                <sf:options items="${monkSpecList}" />
            </sf:select><br/>
        </div>
        <div id="palSpecs" style="display: none">
            Специализация: <sf:select path="" id="palSpec">
                <sf:option value="NONE" label="--- Select ---" />
                <sf:options items="${palSpecList}" />
            </sf:select><br/>
        </div>
        <div id="priestSpecs" style="display: none">
            Специализация: <sf:select path="" id="priestSpec">
                <sf:option value="NONE" label="--- Select ---" />
                <sf:options items="${priestSpecList}" />
            </sf:select><br/>
        </div>
        <div id="rogueSpecs" style="display: none">
            Специализация: <sf:select path="" id="rogueSpec">
                <sf:option value="NONE" label="--- Select ---" />
                <sf:options items="${rogueSpecList}" />
            </sf:select><br/>
        </div>
        <div id="shamSpecs" style="display: none">
            Специализация: <sf:select path="" id="shamSpec">
                <sf:option value="NONE" label="--- Select ---" />
                <sf:options items="${shamSpecList}" />
            </sf:select><br/>
        </div>
        <div id="lockSpecs" style="display: none">
            Специализация: <sf:select path="" id="lockSpec">
                <sf:option value="NONE" label="--- Select ---" />
                <sf:options items="${lockSpecList}" />
            </sf:select><br/>
        </div>
        <div id="warSpecs" style="display: none">
            Специализация: <sf:select path="" id="warSpec">
                <sf:option value="NONE" label="--- Select ---" />
                <sf:options items="${warSpecList}" />
            </sf:select><br/>
        </div> --%>
        <sf:label path="ilvl" cssErrorClass="errors" ><s:message code="form.ilvl"/></sf:label>
        <sf:input path="ilvl" cssErrorClass="errors" />
        <br/>
        <sf:label path="exp" cssErrorClass="errors"><s:message code="form.exp"/></sf:label>
        <sf:input path="exp" cssErrorClass="errors"/>
        <br/>
        <sf:label path="why" cssErrorClass="errors"><s:message code="form.why"/></sf:label>
        <sf:textarea path="why" cssErrorClass="errors"/>
        <br/>
        <sf:label path="what" cssErrorClass="errors"><s:message code="form.what"/></sf:label>
        <sf:textarea path="what" cssErrorClass="errors"/> <br/>
        <input type="submit"/>


    </sf:form>
    <sec:authorize access="isAnonymous()">
        <div class="right-side">
            <s:url value="/gslogin" var="login"/>
            <a href="${login}"><s:message code="form.login"/></a>
        </div>
    </sec:authorize>
    <sec:authorize access="isAuthenticated()">
        <div class="right-side">
            <sec:authentication property="principal.username" var="username"></sec:authentication>
            <s:message code="form.loggedAs"/>${username}

            <sf:form action="/logout" method="post">
                <input type="submit" value="<s:message code="form.logout"/>"/>
            </sf:form>
        </div>
    </sec:authorize>
</div>
<sec:authorize access="isAuthenticated() and hasAnyRole('ROLE_ADMIN', 'ROLE_OFFICER')">
    <s:url value="/vsezayavki" var="vse"/>
    <a href="${vse}"><s:message code="form.vseZayavki"/></a>
</sec:authorize>

</body>
</html>
