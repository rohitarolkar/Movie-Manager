desc "Adds release year"
task :add_release_year => :environment do
  Movie.all.each do |movie|
    imdb_movie = Imdb::Movie.new( movie.imdb_id )
    movie.update_attributes!( :release_date => imdb_movie.release_date )
  end
end