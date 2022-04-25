<div class="modal-dialog myForm">
    <div class="modal-content">
        <g:form class="edit-form form-horizontal centered" action="update">
            <g:hiddenField name="id" value="${checklist.id}"/>
            <div class="form-group modal-body">
                <label for="name">Task Name:</label>
                <input type="text" id="name" name="taskName" value="${checklist.taskName}"/>
            </div>

            <div class="form-group modal-body">
                <label for="dco">Date Completed:</label>
                <input type="date" id="dco" name="dateCompleted" value="${formatDate(format:'yyyy-MM-dd',date:checklist.dateCompleted)}"/>
            </div>

            <div class="form-group modal-body">
                <label for="completed">Completed:</label>
                <input type="checkbox" id="completed" name="complete" value="${checklist.complete}"/>
            </div>

            <div class="modal-footer">
                <g:link action="update">
                    <button type="submit" class="btn btn-accent" id="edit-ckls-btn">
                        SAVE
                    </button>
                </g:link>
                <button class="btn btn-accent" data-dismiss="modal">
                    CLOSE
                </button>
            </div>
        </g:form>
    </div>
</div>