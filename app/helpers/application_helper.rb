module ApplicationHelper
  
  def sortable(column ,title = nil)
    title ||= column.titleize
    direction = (column == params[:sort] && params[:direction] == "asc") ? "desc" : "asc"
    direction = direction == "asc" ? "desc" : "asc" if %w[created_at imdb_rating my_rating year].include?(column) unless column == params[:sort]
    link_to title , :sort => column ,:direction => direction
  end
  
end
