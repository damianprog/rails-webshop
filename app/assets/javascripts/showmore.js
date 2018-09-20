$(document).on('turbolinks:load',function() {

    $('.moreDesc').click(function(e) {
        descMoreLess($(this).text(), $(this).data("value"));
    });

    var descMoreLess = function(method, value) {

        var currentTag = '#' + value + '';
        var currentButton = 'a[data-value=\'' + value + '\']';
        if (method == 'More...') {

            $(currentTag).css({
                'height' : 'auto'
            })
            $(currentButton).text('Less...');
        }

        else if (method == 'Less...') {
            $(currentTag).css({
                'height' : '140px'
            })
            $(currentButton).text('More...');
        }

    }

});