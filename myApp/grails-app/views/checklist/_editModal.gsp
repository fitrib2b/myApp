<div class="modal col-md-offset-5 fade myForm centered glyphicon-modal-window modal-sm " id="edit-modal">
    <div class="modal-content">
        <g:form class="edit-form form-horizontal centered" action="update">
            <g:hiddenField name="id" value=""/>
            <g:hiddenField name="dateCreated" value=""/>
            <div class="modal-header">Edit Task</div>
            <div class="form-group ">
                <br>
                <label for="taskName">Task Name:</label>
                <input class="has-error" type="text" id="taskName" name="taskName" value=""/>
                <span class="help-block col-xs-offset-3 col-xs-7"></span>
            </div>

            <div class="form-group ">
                <label for="dateCompleted">Date Completed:</label>
                <input type="date" class="" id="dateCompleted" name="dateCompleted" value=""/>
                <span class="help-block col-xs-offset-3 col-xs-7 word-wrap"></span>
            </div>
%{----}%
            <div class="form-group">
                <label for="complete">Complete:</label>
                <input type="checkbox" class="" id="complete" name="complete" value="${true}"  />
                <span class="help-block col-xs-offset-3 col-xs-7"></span>
            </div>

            <div class="modal-footer">
                    <button type="submit" class="btn btn-accent edit-ckls-btn" id="edit-ckls-btn">
                        SAVE
                    </button>
                <button class="btn btn-accent" data-dismiss="modal" type="reset">
                    CLOSE
                </button>
            </div>
        </g:form>
    </div>
</div>