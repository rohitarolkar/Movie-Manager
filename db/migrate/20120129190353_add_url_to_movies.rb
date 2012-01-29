class AddUrlToMovies < ActiveRecord::Migration
  def change
    change_column :movies, :url, :text
  end
end
