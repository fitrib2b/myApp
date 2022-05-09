$ = jQuery;

$('.edit-btn').on('click', onClickEditBtn);

$('.myForm ').on('hidden.bs.modal', function (e) {
    $('.help-block').empty();
});

$(".delete-btn").on('click', onClickDeleteBtn);

$(".filter").on('change', filter);

$(".submit-btn").on('click', retain);

function retain() {
    var str = document.getElementById("search").value;
    console.log(str);
    return str;
}

function onClickEditBtn() {
    //show the modal
    $('#edit-modal').modal();

    //populate the fields
    var id = $(this).data('id');

    $.ajax({
        type: "POST",
        url: $(this).data('action'),
        data: {id: id},
        success: function (response) {
            console.log(response);
            // $('.div-edit').append(response);

            if (response.checklist) {

                var dateCompleted = new Date(response.checklist.dateCompleted),
                    // dateCreated = new Date(response.checklist.dateCreated),
                    newDate = new Date();

                var dcm = dateCompleted.toISOString().split('T'),
                    // dcr = dateCreated.toISOString().split('T'),
                    nd = newDate.toISOString().split('T');

                $("[name='id']").val(id);
                // $("[name=dateCreated]").val(dcr[0]);

                if (response.checklist.dateCompleted) {
                    $("[name=dateCompleted]").val(dcm[0]);
                } else {
                    $("[name=dateCompleted]").val(nd[0]);
                }

                $("[name=taskName]").val(response.checklist.taskName);

                if (response.checklist.complete == true) {
                    // document.getElementsByClassName('complete').checked = true;
                    $("[name=complete]").prop('checked', true);
                } else {
                    // document.getElementsByClassName('complete').checked = false;
                    $("[name=complete]").prop('checked', false);
                }
            }
        }
    });

    // window.location.href="http://localhost:8080/checklist/edit?id="+id;
}

function onClickDeleteBtn() {
    var id = $(this).data('id');
    // console.log("ID: "+id);
    document.getElementById("confirm-modal").value = id;
}

function filter() {
    window.location.assign(`search?filter=${this.value}&search=${retain()}`);

}
