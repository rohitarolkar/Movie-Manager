class AddPosterVersionsToMovies < ActiveRecord::Migration
  def change
    add_column :movies, :poster_1, :text, :before => :imdb_rating
    add_column :movies, :poster_2, :text, :before => :imdb_rating
    add_column :movies, :poster_3, :text, :before => :imdb_rating
  end
end
