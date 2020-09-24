window.showNextOptions = function(model, html_select) {
    modelId = html_select.value; // selected value
    htmlSelectId = html_select.id; // id of html select tag
    ParentFormGroupId = $('#'+html_select.id).parents('.form-group').attr('id'); // parent layer of html select tag


    // $('#' + ParentFormGroupId + '~ .form-group select option').html('---');
    $('#' + ParentFormGroupId + '~ .form-group select').empty();
    $('#startButton').html('');
    if (modelId != '') { // if smth is selected then make an ajax call to the controller
        $.ajax({
            url: '/show_next_options/' + model + '/' + modelId,
            type: 'POST',
            dataType: 'script',
            data: {
                model: model, // model name: 'faculty', 'department', 'university_group'
                model_id: modelId,
                parent_form_group_id: ParentFormGroupId,

            }
        });
    }
}