desc "Populate DB"
task :populate_db => :environment do
  File.open("#{Rails.root}/public/db_dump.txt", "r") do |f|
    while id = f.gets
      puts "Fetching Movie id #{id.to_s}"
      FetchMovie.perform(id.to_s)
    end
  end
end
