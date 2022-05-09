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
    <asset:javascript src="search.js"/>
    <asset:javascript src="update.js"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"/>
</head>

<body>

<div class="centered container container-fluid glyphicon-align-justify">
    <div class="col-xs-3"></div>
    <div class="col-xs-5">
        <g:form action="search" method="get">
            <g:textField name="search" id="search" value="${params.search}" placeholder="Insert task name here"
                         style="margin:auto"/>
            <button type="submit" class="submit-btn"><i class="fa fa-search"></i></button>
            &nbsp;
            <select name="filter" id="filter" class="filter">
                <option value="" ${params.filter == '' ? 'selected=selected' : ''}>All Tasks</option>
                <option value="true" ${params.filter == 'true' ? 'selected=selected' : ''}>Completed</option>
                <option value="false" ${params.filter == 'false' ? 'selected=selected' : ''}>Not Completed</option>
            </select>
        </g:form>
    </div>

    <div class="col-xs-1">
        <g:link action="create"><button class="button btn btn-default">CREATE <i class="fa fa-plus fa-solid"></i>
        </button></g:link>
    </div>
    <div class="col-xs-3"></div>
</div>

<div class="container container-fluid">
    <table class="table-bordered centered sortable table-filter col-lg-offset-3">
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
                <td class="row-data">${r.dateCreated.format('yyyy-MM-dd kk:mm:ss')}</td>
                <td class="row-data">${r?.dateCompleted?.format('yyyy-MM-dd kk:mm:ss')}</td>
                <td class="row-data"><i class="fa ${r.complete ? 'fa-check fa-solid' : 'fa-times fa-solid'}"/></td>
                <td>
                    <button class="edit btn btn-warning edit-btn" data-id="${r.id}" data-action="edit">EDIT</button>


                    <button class="btn btn-danger delete delete-btn" data-toggle="modal"
                            data-target="#deleteConfirmation"
                            data-id="${r?.id}" id="${r?.id}">DELETE</button>
                </td>
            </tr>
        </g:each>
    </table>
</div>

<br>

<g:render template="deleteModal"/>

<g:render template="editModal"/>
</body>
</html>