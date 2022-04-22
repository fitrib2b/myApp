$(".edit-btn").on('click', onClickEditBtn);

$('#myForm ').on('hidden.bs.modal', function (e) {
    $('#myForm').empty();
});

$(".delete-btn").on('click', onClickDeleteBtn);

$(".filter").on('change', filter);

$(".submit-btn").on('click',retain);

// $(".delete-btn").on('click', onClickDeleteBtn);

function retain(){
    var str = document.getElementById("search").value;
    console.log(str);
    return str;
}

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

function onClickDeleteBtn() {
    var id = $(this).data('id');
    // console.log("ID: "+id);
    document.getElementById("confirm-modal").value = id;
}

function filter(){
    window.location.assign(`search?filter=${this.value}&search=${retain()}`);

}
// function filter() {
//
//     var selected = $('.filter').val();
//     console.log(selected);
//     //all option is selected
//     if (selected === 'all') {
//         $.each("tr").text().show();
//
//     }//completed option
//     else if (selected === 'true') {
//         // var tr = $(this);
//         $('tr').each(function () {
//             alert('tr'.id);
//             this.find('td:eq("false")').text().hide();
//             this.find('td:eq("false")').text().hide();
//         });
//
//     }//not complete option
//     else if (selected === 'false') {
//         $.each("tr").find('td:eq("true")').text().hide();
//         $.each("tr").find('td:eq("false")').text().show();
//     }
// }