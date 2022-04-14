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
%{--    (  $(".submit-btn").on('click',onClickSearchBtn);--}%
%{--    document.querySelectorAll(".submit-btn").addEventListner('click', onClickSearchBtn);--}%


%{--    function onClickSearchBtn() {--}%
%{--        console.log("I am here");--}%
%{--    };--}%
%{--</g:javascript>--}%

    <div style="margin: auto" align="center">
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
            <th></th>
            </b>
        </tr>
        <g:each var = "r" in = "${results}" status="i">
        <tr>
            <td>${i+1}</td>
            <td>${r.taskName}</td>
            <td>${r.dateCreated}</td>
            <td>${r.dateCompleted}</td>
            <td>${r.complete}</td>
            <g:hiddenField name="id" value="${r.id}"/>
            <td>
                <g:link action="delete" id="${r.id}">
                    <button class="delete-btn delete" name="delete-btn">DELETE</button>
                </g:link>
            </td>
        </tr>
        </g:each>
    </table>

%{--<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>--}%
%{--<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>--}%
%{--<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>--}%
%{--<script>--}%
%{--    const selected = document.querySelectorAll("#table td");--}%
%{--</script>--}%

    %{--Scripts, will need to make a layout later so that we don't need to type these on every gsp--}%
    <asset:javascript src="application.js" charset="utf-8"/>
    <asset:javascript src="bootstrap.js"/>
    <asset:javascript src="jquery-2.2.0.min.js"/>
%{--    <asset:javascript src="search.js"/>--}%

</body>
</html>