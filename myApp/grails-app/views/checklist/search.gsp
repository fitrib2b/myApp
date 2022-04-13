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

    <div style="margin: auto">
    <g:form action="searchResult" method="post" >
        <g:textField name="search" value="" placeholder="Insert task name here" style="margin:auto"/>
        <button type="submit" class="submit-btn" style="margin:auto">SEARCH</button>
    </g:form>
    </div>
    <table style="width:400px; margin: auto">
        <tr>
            <b>
            <th>No.</th>
            <th>Task Name</th>
            <th>Date Created</th>
            <th>Date Completed</th>
            <th>Completed</th>
            </b>
        </tr>
        <g:each var = "r" in = "${results}" status="i">
        <tr>
            <td>${i+1}</td>
            <td>${r.taskName}</td>
            <td>${r.dateCreated}</td>
            <td>${r.dateCompleted}</td>
            <td>${r.complete}</td>
        </tr>
        </g:each>
    </table>

<g:script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></g:script>
<g:script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></g:script>
<g:script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></g:script>
</body>
</html>