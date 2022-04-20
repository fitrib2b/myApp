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

    %{--Scripts, will need to make a layout later so that we don't need to type these on every gsp--}%
    <asset:javascript src="application.js" charset="utf-8"/>
    <asset:javascript src="bootstrap.js"/>
    <asset:javascript src="jquery-2.2.0.min.js"/>
    <asset:javascript src="search.js"/>
</head>

<body>

<div class="centered">
    <g:form action="search" method="post">
        <g:textField name="search" value="" placeholder="Insert task name here" style="margin:auto"/>
        <button type="submit" class="submit-btn">SEARCH</button>
    </g:form>
</div>
<table class="table-bordered centered sortable">
    <tr>
        <th class="">No.</th>
        <th>Task Name</th>
        <th>Date Created</th>
        <th>Date Completed</th>
        <th>Completed</th>
        <th></th>
    </tr>
    <g:each var="r" in="${results}" status="i">
        <tr id="${r.id}">
            <td>${i + 1}</td>
            <td class="row-data">${r.taskName}</td>
            <td class="row-data">${r.dateCreated}</td>
            <td class="row-data">${r.dateCompleted}</td>
            <td class="row-data">${r.complete}</td>
            <td>
                <button class="edit btn btn-warning edit-btn" data-id="${r.id}" data-task-name="${r.taskName}"
                        data-toggle="modal" data-target="#myForm">EDIT</button>

                <button class="btn btn-danger delete delete-btn" data-toggle="modal" data-target="#deleteConfirmation"
                        data-id="${r.id}" id="${r.id}" onclick="onClickDeleteBtn(this.id)">DELETE</button>
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