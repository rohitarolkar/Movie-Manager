class Movie < ActiveRecord::Base

  after_destroy :remove_poster

  def self.fetch_movies(args)
    if args[:search].present?
      where('title ILIKE ?', "%#{args[:search]}%").paginate(:page => args[:page], :per_page => 14)
    else
      #Movie.find(:all,:order => sort_column(args[:sort]) + " " + sort_order(args[:direction]) )
      order(sort_column(args[:sort]) + " " + sort_order(args[:direction])).paginate(:page => args[:page], :per_page => 14)
    end
  end
  
  private

  def remove_poster
    path = "#{Rails.root}/app/assets/images/posters/#{self.imdb_id}_small.jpg"
    File.delete(path) if File.exist?(path)
    File.delete(path) if File.exist?(path)
  end
  
  def self.sort_column(column)
    Movie.column_names.include?(column) ? column : "created_at"
  end

  def self.sort_order(direction)
    %w[asc desc].include?(direction) ? direction : "desc"
  end
  
end
