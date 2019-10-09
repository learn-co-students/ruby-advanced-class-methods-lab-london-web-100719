#require 'pry'

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
    song = self.new
    song.save
    song
  end

  def self.new_by_name(name)
    song = self.new
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
    # The above is black magic from solution. Mine below:
    #if !find_by_name(name)
    #  create_by_name(name)
    #else
    #  find_by_name(name)
    #end
  end

  def self.alphabetical
    @@all.sort_by(&:name)
  end

  def self.new_from_filename(filename)
    artist_title = filename.split(" - ")
    artist = artist_title[0]
    title = artist_title[1].split(".")[0]

    song = self.new
    song.name = title
    song.artist_name = artist
    song
  end

  def self.create_from_filename(filename)
    artist_title = filename.split(" - ")
    artist = artist_title[0]
    title = artist_title[1].split(".")[0]

    song = self.create
    song.name = title
    song.artist_name = artist
    song
  end

  def self.destroy_all
    self.all.clear
  end

end

#binding.pry