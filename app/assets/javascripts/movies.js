$(document).ready(function(){
    $('#submit_movie').click(function(){
        var value = $('.movie_fetched').attr('id');
        $('#imdb_id').attr('value',value);
    });
});

$(function() {
    $('.rating-star').click(function(){
        var star = $(this);
        var form_id = $(this).attr('data-form-id');
        var stars = $(this).attr('data-stars');
        for(i=1; i<=10; i++){
            if(i <= stars){
                $('#' + form_id + '_' + i).addClass('on');
            }else{
                $('#' + form_id + '_' + i).removeClass('on');
            }
        }
        $('#movie_my_rating').attr('value',stars);
        $.ajax({
            type: "post",
            url: $('#' + form_id).attr('action'),
            data:$('#' + form_id).serialize()
        });
    });

    //         alert($('.rating-star').attr('id'));
    $('li.rating-star').hover(
        function(){
            var form_id = $(this).attr('data-form-id');
            var stars = $(this).attr('data-stars');
            var original_rating = $('#movie_my_rating').attr('value')

            $('.rating-helper').html(stars.toString() + '/10');
            for(i=1; i<= 10; i++){
                $('#' + form_id + '_' + i).removeClass('on');
            }
            for(i=1; i<= stars; i++){
                $('#' + form_id + '_' + i).addClass('on-temp');
            }
        }, 
        function () {
            var form_id = $(this).attr('data-form-id');
            var original_rating = $('#movie_my_rating').attr('value');
            $('.rating-helper').html(original_rating + '/10');
            for(i=1; i<= 10; i++){
                $('#' + form_id + '_' + i).removeClass('on-temp');
            }
            for(i=1; i<= original_rating; i++){
                $('#' + form_id + '_' + i).addClass('on');
            }
        }
        );
});