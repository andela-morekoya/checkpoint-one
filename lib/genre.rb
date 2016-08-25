class Genre
  extend Concerns::Findable
  include Concerns::LibraryCommon

  attr_accessor :name
  attr_reader :songs
  
  @@all = []

  def initialize(genre_name)
    @name = genre_name
    @songs = []
    @genre_artists = []
  end

  def add_song(song)
    song.genre ||= self
    @songs.push(song)
    @genre_artists.push(song.artist) unless @genre_artists.include?song.artist
    song.artist.add_genre(song) if song.artist
  end

  def artists
    @genre_artists
  end
end
