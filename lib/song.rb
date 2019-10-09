class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    new_song = self.new
    Song.all << new_song
    new_song
  end

  def self.new_by_name(song_name)
    new_song = self.new
    new_song.name = song_name
    new_song
  end

  def self.create_by_name(song_name)
    new_song = self.new
    new_song.name = song_name
    Song.all << new_song
    new_song
  end

  def self.find_by_name(song_name)
    Song.all.find {|song| song.name == song_name}
  end

  def self.find_or_create_by_name(song_name)
    create_by_name(song_name)
    find_by_name(song_name)
  end

  def self.alphabetical  
    Song.all.sort_by {|instance| instance.name}
  end

  def self.new_from_filename(song_name)
    title = song_name.split(".")
    artist_song = title[0].split(" - ")

    song = self.new
    song.name = artist_song[1]
    song.artist_name = artist_song[0]
    song
  end

  def self.create_from_filename(song_name)
    title = song_name.split(".")
    artist_song = title[0].split(" - ")

    song = self.new
    song.name = artist_song[1]
    song.artist_name = artist_song[0]

    Song.all << song
    song
  end


  def self.destroy_all
    Song.all.clear
  end


end
