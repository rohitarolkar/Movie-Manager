class FetchMovie
  require 'open-uri'
  @queue = :fetch_movie_queue
  def self.perform(id,movies_list = nil)
    id.gsub!("\n","")
    if movies_list
      movies_list.each do |name|
        name.gsub!(/.(mkv|avi|mp4)$/,"")
        search =  AkasImdb.imdb_raw(name)
        search.movies[0].id.to_s
        self.add_movie(search.movies[0].id.to_s) if not search.movies[0].blank?
      end
    else
      self.add_movie(id) if id
    end
  end

  def self.add_movie(id)
    puts "============ working "
    movie = Movie.find_or_create_by_imdb_id(id)
      imdb_movie = Imdb::Movie.new(id)
      MovieApi.new()
      tmdb_movie = TmdbMovie.find(:imdb => "tt#{id}") rescue nil
      url = tmdb_movie.posters[1].url if tmdb_movie.present?
      movie.update_attributes!( :title => imdb_movie.title,
                                :url => imdb_movie.url.gsub("akas.imdb","imdb"),
                                :cast_members => imdb_movie.cast_members.join(",") ,
                                :director => imdb_movie.director.join(","),
                                :genres => imdb_movie.genres.join(",") ,
                                :languages => imdb_movie.languages.join(","),
                                :length => imdb_movie.length,
                                :plot => imdb_movie.plot,
                                :poster => imdb_movie.poster,
                                :imdb_rating => imdb_movie.rating,
                                :tagline => imdb_movie.tagline,
                                :trailer_url => imdb_movie.trailer_url,
                                :year => imdb_movie.year,
                                :release_date => imdb_movie.release_date,
#                               :poster_1 => imdb_movie.poster.present? ? "#{imdb_movie.poster.gsub(".jpg","")}"+"._V1._SY209_CR0,0,140,209_.jpg" : "",
                                :poster_2 => imdb_movie.poster.present? ? "#{imdb_movie.poster.gsub(".jpg","")}"+"._V1._SY317_.jpg" : "",
                                :poster_3 => imdb_movie.poster.present? ? "#{imdb_movie.poster.gsub(".jpg","")}"+"._V1._SX640_SY948_.jpg" : "",
                                :poster_1 => url.present? ? url : ''
                                )

    if Rails.env == 'development' and movie.poster
      fetch_poster("app/assets/images/posters/#{id}_large.jpg","#{imdb_movie.poster.gsub(".jpg","")}"+"._V1._SX640_SY948_.jpg")
      fetch_poster("app/assets/images/posters/#{id}_small.jpg","#{imdb_movie.poster.gsub(".jpg","")}"+"._V1._SY317_.jpg")
    end
  end

  def self.fetch_poster(path,url)
    unless File.exist?(path)
      open("#{path}",'wb') do |file|
        file << open(url).read
      end
    end
  end

end
