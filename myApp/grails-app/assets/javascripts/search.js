$ = jQuery;

$('.edit-btn').on('click', showModal);
$('.edit-btn').on('click', onClickEditBtn);

$('.myForm ').on('hidden.bs.modal', function (e) {
    // $('.myForm').remove();
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

function showModal() {
    $('#edit-modal').modal();
}

function onClickEditBtn() {

    var id = $(this).data('id');
    // console.log(id);

    $.ajax({
        type: "POST",
        url: "edit",
        data: {id: id},
        success: function (response) {
            // console.log(response);
            // $('.div-edit').append(response);

            if (response.checklist) {

                var dateCreated = new Date(response.checklist.dateCreated),
                    dateCompleted = new Date(response.checklist.dateCompleted),
                    newDate = new Date();

                var dcr = dateCreated.toISOString().split('T'),
                    dcm = dateCompleted.toISOString().split('T'),
                    nd = newDate.toISOString().split('T');

                $("[name='id']").val(id);
                $("[name=dateCreated]").val(dcr[0]);

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
