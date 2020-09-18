window.showRangeValue = function(range_id) {
    var rangeValue = $('#inputRange'+range_id).val();
    $('#rangeValue'+range_id).html((range_id == 7) ? rangeValue+'%' : rangeValue);

}