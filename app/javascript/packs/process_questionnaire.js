window.processQuestionnaire = function() {
    formData = $('#questionnaireForm').serialize();
    $.ajax({
        url: '/questionnaires',
        type: 'POST',
        dataType: 'application/javascript',
        data: formData
    });
}