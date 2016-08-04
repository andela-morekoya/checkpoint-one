class Artist
  extend Concerns::Findable
  attr_accessor :name, :song
  attr_reader :songs

  @@all = []

  def initialize(artist_name, song_name = nil)
    @name = artist_name
    @song = song_name
    @songs = []
    @song_genres = []
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all = []
  end

  def save
    if !@@all.include?(self)
      @@all.push(self)
    end
  end

  def self.create(artist_name)
    artist = Artist.new(artist_name)
    artist.save
    artist
  end

  # def songs
  #   @songs
  # end

  def add_song(song)
    @song = song.name
    save
    song.artist = self if song.artist != self
    @songs.push(song) if !@songs.include?(song)
    @song_genres.push(song.genre) if !@song_genres.include?(song.genre)
  end

  def genres
    @song_genres
  end
end
