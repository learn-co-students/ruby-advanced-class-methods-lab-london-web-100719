require "pry"

class Song
  attr_accessor :name, :artist_name
  @@all = []

  def initialize(name, artist_name)
    @name = name
    @artist_name = artist_name
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    song = Song.new("", "")
    song.save
    return song
  end

  def self.new_by_name(name)
    song = Song.new(name, "")
  end

  def self.create_by_name(name)
    song = Song.new(name, "")
    song.save
    return song
  end
  
  def self.find_by_name(name)
    @@all.find {|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    song = find_by_name(name)
    if song
      return song
    else 
      return create_by_name(name)
    end
  end

  def self.alphabetical
    @@all.sort_by {|song| song.name}
  end

  def self.new_from_filename(filename)
    split_file = filename.split(" - ")
    artist_name = split_file[0]
    song_name = split_file[1].sub! ".mp3", ""
    new_song = Song.new(song_name, artist_name)
  end

  def self.create_from_filename(filename)
    new_song = new_from_filename(filename)
    new_song.save
    return new_song
  end

  def self.destroy_all
    @@all.clear
  end

end

purplehaze = Song.new("purplehaze", "Jimi Hendrix") 
fix_you = Song.new("fix you", "cold play")
hot_water = Song.new("hot water", "level 42")