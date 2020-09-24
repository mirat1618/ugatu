window.showStartButton = function(html_select) {
    universityGroupId = html_select.value;
    $('#startButton').html('');
    if (universityGroupId != '') {
        $.ajax({
            url: '/show_start_button/',
            type: 'POST',
            dataType: 'script',
            data: {
                university_group_id: universityGroupId
            }
        });
    }
}
