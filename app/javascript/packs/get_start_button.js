window.getStartButton = function() {
    $.ajax({
        url: '/get_start_button',
        type: 'POST',
        dataType: 'script',
        data: { university_group_id: $('#university_group_id').val() }
    });
}