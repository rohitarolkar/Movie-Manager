# To change this template, choose Tools | Templates
# and open the template in the editor.

class AkasImdb
  def self.imdb_raw(title)
    Imdb::Search.new(title)
  end

  def self.new(id)
    Imdb::Movie.new(id)
  end

  def self.suggest_list(title)
   Imdb::Search.new(title).movies[0..5]
  end
end
