<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main" />
    <g:set var="entityName" value="${message(code: 'user.label', default: 'Checklist')}" />
    <title><g:message code="default.list.label" args="[entityName]" /></title>
    <asset:javascript src="application.js"/>
    <asset:javascript src="create.js"/>
</head>
    <body>
    <a href="#list-user" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
    <div class="nav" role="navigation">
        <ul>
            <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
            <li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
        </ul>
    </div>

        <g:form name="addForm" action="save">
            Task: <g:textField name="taskName" required="true"/><br/>
            Completed: <g:checkBox name="complete" default="N" id="create-checkbox"/><br/>
            Create Date: <input type="date" name="dateCreated" required="true" id="dateCreated"/><br/>
            Completed Date: <input type="date" name="dateCompleted" id="date-completed" disabled="true"/><br/>
            <g:submitButton name="save" value="Save" />
        </g:form>


    </body>
</html>