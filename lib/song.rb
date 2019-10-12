require 'pry'

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
    song = Song.new
    song.save
    song
  end

  def self.new_by_name(name)
    song = Song.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = self.create
    song.name = name
    song
  end

  def self.find_by_name(name)
    @@all.find { |song| song.name == name }
  end

  def self.find_or_create_by_name(name)
    find_by_name(name) || create_by_name(name)
  end

  def self.alphabetical
    # binding.pry
    self.all.sort_by(&:name)
  end

  def self.new_from_filename(string)
    artist = string.split(/[-.]/)[0].rstrip
    name = string.split(/[-.]/)[1].lstrip
    # form = name = string.split(/[-.]/)[2] //may need the format later

    song = new_by_name(name)
    song.artist_name = artist
    song
  end

  def self.create_from_filename(string)
    song = new_from_filename(string)
    song.save
    song
  end

  def self.destroy_all
    @@all = []
  end
  

end


# binding.pry

# 0

