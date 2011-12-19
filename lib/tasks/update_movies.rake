desc "update the movie details"
task :update_movie_details => :environment do

  Movie.all .each do |movie|
    imdb_movie = Imdb::Movie.new("#{movie.imdb_id}")
    director = remove_html_tags(imdb_movie.director)
    genres = remove_html_tags(imdb_movie.genres)
    #genres = remove_html_tags(imdb_movie.genres)

    puts ""



#    movie.build_movie_detail( :cast_members => imdb_movie.cast_members ,
#                              :director => director,
#                              :genres => genres ,
#                              :languages => imdb_movie.languages,
#                              :length => imdb_movie.length,
#                              :plot => imdb_movie.plot,
#                              :poster => imdb_movie.poster,
#                              :imdb_rating => imdb_movie.rating,
#                              :tagline => imdb_movie.tagline,
#                              :trailer_url => imdb_movie.trailer_url,
#                              :year => imdb_movie.year )
#    movie.save
 end


  def remove_html_tags(value)
#    value.gsub!("---\n ","")
#    value.gsub!("\n",",")
#    value.chop!
      value
  end
 
end