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
        <h4 style="position:center;color:green">ToDo List</h4>
        <g:each in="${tasks}" var="task">
            ${task}
        </g:each>

        <g:each in="${tasks}" var="task">
            <g:link action="edit" id="${task.id}">${task}</g:link><br/>
        </g:each>
    </body>
</html>