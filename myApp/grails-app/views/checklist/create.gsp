<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main" />
    <g:set var="entityName" value="${message(code: 'user.label', default: 'Checklist')}" />
    <title><g:message code="default.list.label" args="[entityName]" /></title>
</head>
    <body>
    <a href="#list-user" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
    <div class="nav" role="navigation">
        <ul>
            <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
            <li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
        </ul>
    </div>

        <g:form name="addForm" action="save" id="${task?.id}">
            Task: <g:textField name="taskName" value="${task?.taskName}"/><br/>
            Completed: <g:checkBox name="complete" value="${task?.complete}"/><br/>
            Create Date: <g:datePicker name="dateCreated" value="${task?.dateCreated?:(new Date())}"/><br/>
            Completed Date: <g:datePicker name="dateCompleted" value="${task?.dateCompleted?:(new Date())}"/><br/>
            <g:submitButton name="save" value="Save" />
        </g:form>
    </body>
</html>