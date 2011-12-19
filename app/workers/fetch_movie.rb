class FetchMovie
  require 'open-uri'
  @queue = :fetch_movie_queue
  def self.perform(id)
    raw_movie =  AkasImdb.new(id)
    movie = Movie.find_or_create_by_imdb_id(:imdb_id => raw_movie.id ,:url => raw_movie.url , :title => raw_movie.title)
    update_movie_details(id,movie) unless movie.movie_detail
  end

  def self.update_movie_details(id,movie)
    imdb_movie = Imdb::Movie.new(id)
    movie.build_movie_detail( :cast_members => imdb_movie.cast_members.join(",") ,
                              :director => imdb_movie.director.join(","),
                              :genres => imdb_movie.genres.join(",") ,
                              :languages => imdb_movie.languages.join(","),
                              :length => imdb_movie.length,
                              :plot => imdb_movie.plot,
                              :poster => imdb_movie.poster,
                              :imdb_rating => imdb_movie.rating,
                              :tagline => imdb_movie.tagline,
                              :trailer_url => imdb_movie.trailer_url,
                              :year => imdb_movie.year )
    #check if poster present ? later fix this
    fetch_poster(id,"#{id}_large.jpg","#{imdb_movie.poster.gsub(".jpg","")}"+"._V1._SX640_SY948_.jpg")
    fetch_poster(id,"#{id}_small.jpg","#{imdb_movie.poster.gsub(".jpg","")}"+"._V1._SY317_.jpg")
    movie.save  # take care of the exception later
  end

  def self.fetch_poster(imdb_id,size,url)
    open("app/assets/images/posters/#{size}",'wb') do |file|
      file << open(url).read
    end
  end

end
