$(".edit-btn").on('click', onClickEditBtn);

$('#myForm ').on('hidden.bs.modal', function (e) {
    $('#myForm').empty();
});

$(".delete-btn").on('click', onClickDeleteBtn);

// $(".delete-btn").on('click', onClickDeleteBtn);

function onClickEditBtn() {
    var id = $(this).data('id');
    console.log(id);

    $.ajax({
        type: "POST",
        url: "edit",
        data: {id: id},
        success: function (response) {
            //console.log(response);
            $('.div-edit').append(response);

            if (response.checklist) {
                // find a way to show the template bootstrapeditmodal
            }
        }
    });

    // window.location.href="http://localhost:8080/checklist/edit?id="+id;
}

function onClickDeleteBtn(){
    var id = $(this).data('id');
    // console.log("ID: "+id);
    document.getElementById("confirm-modal").value = id;
}

// function onClickDeleteBtn() {
//
//     var id = $(this).data('id');
//     $.ajax({
//         type: "POST",
//         url: "deleteModal",
//         data: {id: id},
//         success: function (response) {
//             console.log(response);
//             $('.div-edit').append(response);
//
//             if (response.checklist) {
//                 // find a way to show the template bootstrapeditmodal
//             }
//         }
//     });
// }

function show(event) {
    var rowId = event.target.parentNode.parentNode.id;
    var data = document.getElementById(rowId).querySelectorAll(".row-data");
    var taskName = data[0].innerHTML;
    // var dCreate = data[1].innerHTML;
    var dComp = data[2].innerHTML;
    var comp = data[3].innerHTML;

    document.getElementById("task-name").value = taskName;
    // document.getElementById("dcr").value = dCreate;
    document.getElementById("dco").value = dComp;

    if (comp == true) {
        document.getElementById("comp").checked = true;
    }

    // console.log()
}