desc "Dumps the database into a text file"
task :dump_db => :environment do
  File.open("#{Rails.root}/public/db_dump.txt", "w") do |f|
    Movie.all.each do |movie|
      f.puts movie.imdb_id.to_s
    end
  end
end