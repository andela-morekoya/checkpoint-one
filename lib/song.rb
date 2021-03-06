require_relative "artist"
require_relative "genre"

class Song
  extend Concerns::Findable
  include Concerns::LibraryCommon

  attr_accessor :name, :artist, :genre

  @@all = []

  def initialize(song_name, artist = nil, genre = nil)
    @name = song_name
    self.artist = artist if artist
    self.genre = genre if genre
  end

  def artist=(an_artist)
    @artist = an_artist 
    an_artist.add_song(self) unless an_artist.songs.include?(self)
  end

  def genre=(a_genre)
    @genre = a_genre
    a_genre.add_song(self) unless a_genre.songs.include?(self)
  end

  def self.new_from_filename(filename)
    song_name = filename.chomp(".mp3").split(" - ")
    genre = Genre.find_or_create_by_name(song_name[2])
    artist = Artist.find_or_create_by_name(song_name[0])
    song = Song.new(song_name[1], artist, genre)
    song
  end

  def self.create_from_filename(filename)
    song = Song.new_from_filename(filename)
    song.save
    song
  end

  def full_name
    "#{self.artist.name} - #{self.name} - #{self.genre.name}"
  end
end
