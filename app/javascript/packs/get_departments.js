// window.getDepartments = function() {
//     $.ajax({
//             url: '/get_departments',
//             type: 'POST',
//             dataType: 'script',
//             data: { faculty_id: $('#faculty_id').val() },
//             success: function (data) {
//                 console.log(data);
//             }
//         });
// }
window.getDepartments = function() {
    $.ajax({
            url: '/get_departments',
            type: 'POST',
            dataType: 'script',
            data: { faculty_id: $('#faculty_id').val() }
        });
}