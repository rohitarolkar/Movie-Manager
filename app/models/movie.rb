class Movie < ActiveRecord::Base
  has_one :movie_detail

  after_destroy :remove_poster

  private
  def remove_poster
    File.delete("#{RAILS.root}/app/assets/images/posters/#{self.imdb_id}_small.jpg")
    File.delete("#{RAILS.root}/app/assets/images/posters/#{self.imdb_id}_large.jpg")     
  end
end
