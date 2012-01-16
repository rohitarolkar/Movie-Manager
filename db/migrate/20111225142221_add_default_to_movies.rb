class AddDefaultToMovies < ActiveRecord::Migration
  def change
    change_column :movies, :imdb_rating, :float, :default => 0
    change_column :movies, :my_rating, :float, :default => 0
    change_column :movies, :length, :integer, :default => 0
  end
end
