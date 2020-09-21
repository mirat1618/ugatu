window.getNextHtmlSelect = function(html_element) {
    type = html_element.name;
    typeId = html_element.value;
    parentColumn = $('#'+html_element.id).parents()[1].id;
    hideNextColumns(parentColumn);
    if (typeId != '') {
        $.ajax({
            url: '/get_next_html_select/' + type + '/' + typeId,
            type: 'POST',
            dataType: 'script'
        });
    }
}

columns = ['facultiesOptions', 'departmentsOptions', 'universityGroupsOptions', 'startButton']

function hideNextColumns(parentColumn) {
    for (i = 0; i < columns.length; i ++) {
            if (parentColumn == columns[i]) {
                parentColumnOrderNumber = i;
            }
    }
    for (i = parentColumnOrderNumber + 1; i < columns.length; i ++) {
            $('#'+columns[i]).html('');
        }
}

