class Artist
  extend Concerns::Findable
  include Concerns::LibraryCommon

  attr_accessor :name, :song
  attr_reader :songs

  @@all = []

  def initialize(artist_name, song_name = nil)
    @name = artist_name
    @song = song_name
    @songs = []
    @song_genres = []
  end

  def add_song(song)
    @song = song.name 
    save
    song.artist = self unless song.artist == self
    @songs.push(song) unless @songs.include?(song)
    @song_genres.push(song.genre) unless @song_genres.include?(song.genre)
  end

  def genres
    @song_genres
  end
end
