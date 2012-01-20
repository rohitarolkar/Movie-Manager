$(document).ready(function(){
    $('#submit_movie').click(function(){
        var value = $('.movie_fetched').attr('id');
        $('#imdb_id').attr('value',value);
    });
});