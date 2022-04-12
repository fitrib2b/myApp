<%--
  Created by IntelliJ IDEA.
  User: fitri
  Date: 12-Apr-22
  Time: 3:35 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title></title>
%{--<g:javascript src="search.js" />--}%
<style>
table, th, td {
    border: 1px solid black;
}
</style>
</head>

<body>
%{--<g:javascript>--}%
%{--    (  $".submit-btn").onclick(onClickSearchBtn);--}%


%{--    function onClickSearchBtn() {--}%
%{--        console.log("I am here");--}%
%{--    };--}%
%{--</g:javascript>--}%

    <g:form action="getSearchResult" method="post">
        <g:textField name="search" value="" placeholder="Insert task name here"/>
        <button type="submit" class="submit-btn">SEARCH</button>
    </g:form>
    <table style="width:400px">
        <tr>
            <b>
            <th>ID</th>
            <th>Task Name</th>
            <th>Date Created</th>
            <th>Date Completed</th>
            <th>Completed</th>
            </b>
        </tr>
        <g:each var = "r" in = "${results}">
        <tr>
            <td>${r.id}</td>
            <td>${r.taskName}</td>
            <td>${r.dateCreated}</td>
            <td>${r.dateCompleted}</td>
            <td>${r.complete}</td>
        </tr>
        </g:each>
    </table>

</body>

</body>
</html>