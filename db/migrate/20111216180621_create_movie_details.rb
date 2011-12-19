class CreateMovieDetails < ActiveRecord::Migration
  def change
    create_table :movie_details do |t|
      t.integer :movie_id
      t.text :cast_members
      t.string :director
      t.string :genres
      t.string :languages
      t.integer :length
      t.text :plot
      t.string :poster
      t.float :imdb_rating, :default => 0
      t.float :my_rating
      t.string :tagline
      t.string :trailer_url
      t.integer :year

      t.timestamps
    end
  end
end
