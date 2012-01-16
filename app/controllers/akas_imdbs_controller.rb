class AkasImdbsController < ApplicationController
  # GET /movies
  # GET /movies.json
  def index
    if params[:movie_title].present?
      search =  AkasImdb.imdb_raw(params[:movie_title])
      @fetched_movies =  search.movies[0..3]      
    end
    
    if params[:dir_path].present?    
      @dir_files = fetch_names_from_folder(params[:dir_path])      
    end

  end

  def add_movie   
    Resque.enqueue(FetchMovie,params[:imdb_id] )
    #FetchMovie.perform params[:imdb_id]
    redirect_to movies_path
  end

  def import_movies
    Resque.enqueue(FetchMovie,nil,params[:movies] )
    redirect_to movies_path
  end

end