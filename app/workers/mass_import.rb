# To change this template, choose Tools | Templates
# and open the template in the editor.

class MassImport
  @queue = :update_movie_queue
  def self.perform(movie_names)
    movie_names.each do |name|
      name.gsub!(/.(mkv|avi|mp4)$/,"")
      search =  AkasImdb.imdb_raw(name)
      imdb_movie = Imdb::Movie.new( search.movies[0].id.to_s )
      movie = Movie.find_or_create_by_imdb_id(:imdb_id => imdb_movie.id ,:url => imdb_movie.url , :title => imdb_movie.title)
      FetchMovie.update_movie_details(movie.imdb_id, movie)
    end
  end

end
