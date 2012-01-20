class MoviesController < ApplicationController
  before_filter :load_redis
  def index
    #@movies = Movie.search(params[:search])
    #@movies = Movie.order(sort_column + " " + sort_order)
    @movies = Movie.fetch_movies(params)
    #@rescent_views =  RedisData.get_rescent_views(request.remote_ip.to_s)
  end

  # GET /movies/1
  # GET /movies/1.json
  def show
    @movie = Movie.find(params[:id])

  end

  # GET /movies/new
  # GET /movies/new.json
  def new
    @movie = Movie.new
  end

  # GET /movies/1/edit
  def edit
    @movie = Movie.find(params[:id])
  end

  # POST /movies
  # POST /movies.json
  def create
    @movie = Movie.new(params[:movie])    
    @fetched_movies =  AkasImdb.suggest_list(params[:movie][:title]) if params[:imdb_id] == nil && params[:movie][:title]
    respond_to do |format|
      if params[:imdb_id] || @fetched_movies.try(:length) == 1
        Resque.enqueue(FetchMovie,params[:imdb_id] ||  @fetched_movies.first.id )
        format.html { redirect_to @movie, notice: 'Movie was successfully created.' }
      else
        format.html { render action: "new" }
      end
    end
  end

  # PUT /movies/1
  # PUT /movies/1.json
  def update
    @movie = Movie.find(params[:id])

    respond_to do |format|
      if @movie.update_attributes(params[:movie])
        format.html { redirect_to @movie, notice: 'Movie was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @movie.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /movies/1
  # DELETE /movies/1.json
  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy

    respond_to do |format|
      format.html { redirect_to movies_url }
      format.json { head :ok }
    end
  end

  private
  def load_redis
    @redis = RedisData.redis_con
  end
 
end
