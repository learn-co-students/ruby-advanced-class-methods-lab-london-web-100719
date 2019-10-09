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

    song = self.new
    @@all << song
    song
    
  end

  def self.new_by_name(name)

    song = self.new
    song.name = name
    song
    
  end

  def self.create_by_name(name)

    song = self.new
    song.name = name
    @@all << song
    song

  end

  def self.find_by_name(name)
    #binding.pry
    @@all.find{|element| element.name == name}
    
  end

  def self.find_or_create_by_name(name)

    if self.find_by_name(name)

      self.find_by_name(name)

    else

      self.create_by_name(name)

    end
    
  end

  def self.alphabetical

    @@all.sort_by{|element| element.name}
    
  end

  def self.new_from_filename(filename)

    song = self.new
    song.artist_name = filename.split(" - ")[0]
    song.name = filename.split(" - ")[1].split(".")[0]
    song
    # can also do filename.split(" - ")[1][/[^.]+/] for a regEx but I cant explain how it works yet
    
  end

  def self.create_from_filename(filename)

    @@all << self.new_from_filename(filename)
    
  end

  def self.destroy_all

    @@all.clear
    
  end

end