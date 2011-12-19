# To change this template, choose Tools | Templates
# and open the template in the editor.

class AkasImdb
  def self.imdb_raw(title)
    Imdb::Search.new(title)
  end

  def self.new(id)
    Imdb::Movie.new(id)
  end
  
end
