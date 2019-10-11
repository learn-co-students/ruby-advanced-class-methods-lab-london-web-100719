require "pry"

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
    new_song.save
    new_song
  end

  def self.new_by_name(song_name)
    new_song = self.new
    new_song.name = song_name
    new_song
  end

  def self.create_by_name(song_name)
    new_song = self.create
    new_song.name = song_name
    new_song
  end

  def self.find_by_name(song_name)
    self.all.find {|song| song.name == song_name }
  end

  def self.find_or_create_by_name(song_name)
    self.find_by_name(song_name) || self.create_by_name(song_name)
  end

  def self.alphabetical
    self.all.sort_by{ |song| song.name }
  end

  def self.new_from_filename(file_name)
    new_song = self.new
    new_song.name = (file_name[(file_name.index("- ") + 2)...-4])
    new_song.artist_name = (file_name[0...file_name.index(" -")])
    new_song
  end

  def self.create_from_filename(file_name)
    new_song = self.create
    new_song.name = (file_name[(file_name.index("- ") + 2)...-4])
    new_song.artist_name = (file_name[0...file_name.index(" -")])
    new_song
  end

  def self.destroy_all
    self.all.clear
  end

end

# song1 = Song.create
# binding.pry
# 0