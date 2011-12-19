class MovieDetailsController < ApplicationController
  # GET /movie_details
  # GET /movie_details.json
  def index
    @movie_details = MovieDetail.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @movie_details }
    end
  end

  # GET /movie_details/1
  # GET /movie_details/1.json
  def show
    @movie_detail = MovieDetail.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @movie_detail }
    end
  end

  # GET /movie_details/new
  # GET /movie_details/new.json
  def new
    @movie_detail = MovieDetail.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @movie_detail }
    end
  end

  # GET /movie_details/1/edit
  def edit
    @movie_detail = MovieDetail.find(params[:id])
  end

  # POST /movie_details
  # POST /movie_details.json
  def create
    @movie_detail = MovieDetail.new(params[:movie_detail])

    respond_to do |format|
      if @movie_detail.save
        format.html { redirect_to @movie_detail, notice: 'Movie detail was successfully created.' }
        format.json { render json: @movie_detail, status: :created, location: @movie_detail }
      else
        format.html { render action: "new" }
        format.json { render json: @movie_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /movie_details/1
  # PUT /movie_details/1.json
  def update
    @movie_detail = MovieDetail.find(params[:id])

    respond_to do |format|
      if @movie_detail.update_attributes(params[:movie_detail])
        format.html { redirect_to @movie_detail, notice: 'Movie detail was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @movie_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /movie_details/1
  # DELETE /movie_details/1.json
  def destroy
    @movie_detail = MovieDetail.find(params[:id])
    @movie_detail.destroy

    respond_to do |format|
      format.html { redirect_to movie_details_url }
      format.json { head :ok }
    end
  end
end
