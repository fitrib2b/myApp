<div class="modal-dialog myForm">
    <div class="modal-content">
        <g:form class="edit-form form-horizontal centered" action="update">
            <g:hiddenField name="id" value="${checklist.id}"/>
            <div class="form-group modal-body">
                <label for="name">Task Name:</label>
                <g:textField id="task-name" name="name" value="${checklist.taskName}" type=""/>
            </div>

            <div class="form-group modal-body">
                <label for="dCompleted">Date Completed:</label>
                <g:datePicker id="dco" name="dCompleted" value="${checklist.dateCompleted}"></g:datePicker>
            </div>

            <div class="form-group modal-body">
                <label for="completed">Completed:</label>
                <g:checkBox id="comp" name="completed" value="${checklist.complete}"></g:checkBox>
            </div>

            <div class="modal-footer">
                <g:link action="update">
                    <button type="submit" class="btn btn-accent">
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