<%--
  Created by IntelliJ IDEA.
  User: fitri
  Date: 12-Apr-22
  Time: 3:35 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main" />
    <title>Search Checklist</title>
</head>

<body>
<g:form class="form-horizontal centered" action="update" method="post">
    <g:hiddenField name="id" value="${checklist.id}" ></g:hiddenField>
    <div class="form-group">
        <label for="name">Task Name: </label>
        <g:textField id="task-name" name="name" value="${checklist.getTaskName()}" type=""/>
    </div>

%{--    <div class="form-group">--}%
%{--        <label for="dCompleted">Date Completed: </label>--}%
%{--        <g:datePicker id="dco" name="dCompleted" value=""></g:datePicker>--}%
%{--    </div>--}%
%{--    <div class="form-group">--}%
%{--        <label for="completed">Completed: </label>--}%
%{--        <g:checkBox id="comp" name="completed"></g:checkBox>--}%
%{--    </div>--}%
%{--    <div class="">--}%
%{--        <button type="submit" class="btn btn-accent">--}%
%{--            SAVE--}%
%{--        </button>--}%
%{--        <button class="btn btn-accent">--}%
%{--            CANCEL--}%
%{--        </button>--}%
%{--    </div>--}%

</g:form>

%{--Scripts, will need to make a layout later so that we don't need to type these on every gsp--}%
<asset:javascript src="application.js" charset="utf-8"/>
<asset:javascript src="bootstrap.js"/>
<asset:javascript src="jquery-2.2.0.min.js"/>
<asset:javascript src="search.js"/>

</body>
</html>