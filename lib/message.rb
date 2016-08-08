class Message
  def self.intro
    puts " 
     Welcome to the Music Library
     What would you like to do? Enter a command
     (type help to get a list of valid commands)"
  end

  def self.invalid
    puts "Invalid Command"
  end

  def self.what_song(size)
    puts "What song number would like to play? (1 - #{size})"
  end

  def self.invalid_song
    puts "Invalid song number"
  end

  def self.not_found(klass)
    puts "#{klass.to_s} not found"
  end

  def self.list_commands
    puts "Commands:
      1.) 'list songs' lists all songs
      2.) 'list artists' lists all artists
      3.) 'list genres' lists all genres
      4.) 'play song' plays specified song
      5.) 'list artist' lists an artist's songs
      6.) 'list genre' lists a genre's songs
      7.) 'help' lists the commands
      8.) 'exit' closes the music library"
  end

  def self.song_name(artist, song, genre)
    puts "#{artist} - #{song} - #{genre}"
  end

  def self.playing(song)
    puts "Playing #{song}"
  end

  def self.get_name(name)
    puts "Enter the #{name}'s name to search for: "
  end
end
