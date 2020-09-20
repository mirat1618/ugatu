window.startTesting = function() {
    var university_group_id = $('#university_group_id').val();

    $.ajax({
        url: '/start_testing',
        type: 'POST',
        dataType: 'application/javascript',
        data: { university_group_id: university_group_id }
    });

}