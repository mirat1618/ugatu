window.showStats = function(lecturer_id) {
    disciplineId = $('#discipline_id').val();
    calculationType = $('#calculation_type').val();
    lecturerId = lecturer_id;
    $.ajax({
        url: '/show_stats/',
        type: 'POST',
        dataType: 'script',
        data: {
            discipline_id: disciplineId,
            calculation_type: calculationType,
            lecturer_id: lecturerId
        }
    });
}
