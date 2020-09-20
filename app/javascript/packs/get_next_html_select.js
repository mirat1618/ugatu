window.getNextHtmlSelect = function(type) {
    id = $('#'+type+'_id').val();
    if (id == '') {
        switch (type) {
            case 'faculty':
                $("#departmentsOptions").html('');
                $("#universityGroupsOptions").html('');
                $("#startButton").html('');
                break;
            case 'department':
                $("#universityGroupsOptions").html('');
                $("#startButton").html('');
            case 'university_group':
                $("#startButton").html('');
                break;
            default:
                console.log('Не распознан тип');
        }
    }
    else {
        switch (type) {
            case 'faculty':
                $("#universityGroupsOptions").html('');
                $("#startButton").html('');
                break;
            case 'department':
                $("#startButton").html('');
                break;
        }
        $.ajax({
            url: '/get_next_html_select/' + type + '/' + id,
            type: 'POST',
            dataType: 'script'
        });
    }
}