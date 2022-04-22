<%--
  Created by IntelliJ IDEA.
  User: fitri
  Date: 12-Apr-22
  Time: 3:35 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Search Checklist</title>
    <asset:javascript src="application.js"/>
%{--    <asset:javascript src="jquery-2.2.0.min.js"/>--}%
    <asset:javascript src="search.js"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"/>
</head>

<body>

<div class="centered">
    <g:form action="search" method="get">
        <g:textField name="search" id="search" value="${params.search}" placeholder="Insert task name here" style="margin:auto"/>
        <button type="submit" class="submit-btn">SEARCH</button>
        <select name="filter" id="filter" class="filter">
            <option value="" ${params.filter == '' ? 'selected=selected' : ''}>All Tasks</option>
            <option value="true" ${params.filter == 'true' ? 'selected=selected' : ''}>Completed</option>
            <option value="false" ${params.filter == 'false' ? 'selected=selected' : ''}>Not Completed</option>
        </select>
    </g:form>
</div>
<table class="table-bordered centered sortable table-filter">
    <tr>
        <th>No.</th>
        <th>Task Name</th>
        <th>Date Created</th>
        <th>Date Completed</th>
        <th>Completed</th>
        <th></th>
    </tr>
    <g:each var="r" in="${results}" status="i">
        <tr id="${r?.id}">
            <td>${i + 1}</td>
            <td class="row-data">${r.taskName}</td>
            <td class="row-data">${r.dateCreated}</td>
            <td class="row-data">${r?.dateCompleted}</td>
            <td class="row-data"> <i class="fa ${r.complete ? 'fa-check fa-solid' : 'fa-times fa-solid'}"/></td>
             <td>
                <button class="edit btn btn-warning edit-btn" data-id="${r.id}" data-task-name="${r.taskName}"
                data-toggle="modal" data-target="#myForm">EDIT</button>


        <button class="btn btn-danger delete delete-btn" data-toggle="modal" data-target="#deleteConfirmation"
                        data-id="${r?.id}" id="${r?.id}">DELETE</button>
            </td>
        </tr>
    </g:each>
</table>

<br>

<div class="div-edit modal centered" id="myForm" role="dialog"></div>

<div class="modal" id="deleteConfirmation">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header danger">WARNING</div>

            <div class="modal-body">
                <p>Are you sure you want to delete this?</p>

                <p>Data deleted can't be retrieved again.</p>
            </div>

            <div class="modal-footer">
                <g:form action="delete" method="post">
                    <button class="delete confirm-modal" name="delete" id="confirm-modal">YES</button>
                </g:form>
                <button class="" data-dismiss="modal">NO</button>
            </div>

        </div>
    </div>
</div>

</body>
</html>