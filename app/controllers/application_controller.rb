class ApplicationController < ActionController::Base
  protect_from_forgery

  def fetch_names_from_folder(path = "media/New Volume/Movies/*")
    files = Dir.entries(path)
    files.delete_if {|x| x == '.' || x == '..' || x.include?('.srt') || x.include?('sub') || x.include?('.db')}
    Movie.all.each do |movie|       
       files.delete_if {|x| movie.title == x }
    end
    files
  end
end
