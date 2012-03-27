class FetchMovie
  require 'open-uri'
  @queue = :fetch_movie_queue
  def self.perform(id,movies_list = nil)
    #raw_movie =  AkasImdb.new(id)
    if id.nil?
      movies_list.each do |name|
        name.gsub!(/.(mkv|avi|mp4)$/,"")
        search =  AkasImdb.imdb_raw(name)
        imdb_movie = Imdb::Movie.new( search.movies[0].id.to_s )
        self.add_movie(imdb_movie.id) if imdb_movie.id
      end
    else
      self.add_movie(id)
    end
  end

  def self.add_movie(id)
    movie = Movie.find_or_create_by_imdb_id(id)
      imdb_movie = Imdb::Movie.new(id)
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
                                :release_date => imdb_movie.release_date)
                              
      fetch_poster("app/assets/images/posters/#{id}_large.jpg","#{imdb_movie.poster.gsub(".jpg","")}"+"._V1._SX640_SY948_.jpg")
      fetch_poster("app/assets/images/posters/#{id}_small.jpg","#{imdb_movie.poster.gsub(".jpg","")}"+"._V1._SY317_.jpg")
    end

  def self.fetch_poster(path,url)
    unless File.exist?(path)
      open("#{path}",'wb') do |file|
        file << open(url).read
      end
    end
  end

end
