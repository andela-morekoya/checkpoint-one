require_relative "message"

class MusicLibraryController
  include

  def initialize(path = "./db/mp3s")
    MusicImporter.new(path).import
    @menu = {
      "list songs" => :list_songs,
      "list artists" => :list_artists,
      "list genres" => :list_genres,
      "play song" => :play_song,
      "list artist" => :list_artist,
      "list genre" => :list_genre,
      "help" => :list_commands
    }
  end

  def call
    Message.intro
    command = gets.downcase
    run_command(command)

  end

  def run_command(command)
    if @menu.keys.include?(command)
      send(@menu[command])
      call
    elsif command != "exit"
      Message.invalid
      call
    else
      return
    end
  end

  def list_songs
    Song.all.each.with_index(1) do |song, index|
      Message.song_name_with_index(
        index,song.artist.name,song.name,song.genre.name
        )
    end
  end

  def list_artists
    Artist.all.each {|item| puts item.name}
  end

  def list_genres
    Genre.all.each {|item| puts item.name}
  end

  def play_song
    size = Song.all.length
    Message.what_song(size)
    selection = gets.to_i - 1

    if [0..size].include? selection
      Message.invalid_song
    else 
      Message.playing(Song.all[selection])
    end
  end

  def list_artist
    Message.get_name(Artist)
    result = Artist.find_by_name(gets)
    print_data(result)
  end

  def list_genre
    Message.get_name(Genre)
    result = Genre.find_by_name(gets)
    print_data(result)
  end

  def print_data(klass)
    if klass
      klass.songs.each do |song|
        Message.song_name(song.artist.name, song.name, song.genre.name)
      end
    else
      Message.not_found(klass)
    end
  end

  def list_commands
    Message.list_commands
  end
end
