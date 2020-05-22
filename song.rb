class Song

  attr_reader :title, :artist, :genre
  
  def initialize(title, artist, genre)
    @title = title
    @artist = artist
    @genre = genre
  end

end