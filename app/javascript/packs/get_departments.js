window.getDepartments = function() {
    $.ajax({
            url: '/get_departments',
            type: 'POST',
            dataType: 'json',
            data: { faculty_id: $('#faculty_id').val() },
            success: function (data) {
                console.log(data);
            }
        });
}
// function getDepartments() {
//
// }
