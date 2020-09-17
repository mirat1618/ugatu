window.getUniversityGroups = function() {
    $.ajax({
        url: '/get_university_groups',
        type: 'POST',
        dataType: 'script',
        data: { department_id: $('#department_id').val() }
    });
}