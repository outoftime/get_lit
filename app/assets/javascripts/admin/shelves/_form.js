$(function () {
    var $body = $('.Admin.Shelves#New, .Admin.Shelves#Create')
    $body.find('#shelf_drink_id').change(function () {
        var val = $(this).val();
        if(val === undefined || val === null || val === '') {
            $body.find('.drink').show();
        } else {
            $body.find('.drink').hide();
        }
    });
});
