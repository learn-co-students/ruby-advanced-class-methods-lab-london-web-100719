require 'pry'

class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def self.create
    @song = Song.new
    @song.save
    return @song
  end 

  def self.new_by_name(song_name)
    @song = self.new
    @song.name = song_name
    return @song
  end

  def self.create_by_name(song_name)
    self.new_by_name(song_name).save
    return @song
  end

  def self.find_by_name(song_name)
    self.all.select do |song| 
      return song if song.name == song_name
    end
    nil
  end

  def self.find_or_create_by_name(song_name)
    self.find_by_name(song_name) || self.create_by_name(song_name) 
  end

  def self.new_from_filename(file_name)
    split_file_name = file_name.split(/[-.]/)
    song = self.new
    song.artist_name = split_file_name[0].strip
    song.name = split_file_name[1].strip
    return song
  end

  def self.create_from_filename(file_name)
    self.new_from_filename(file_name).save  
  end

  def self.destroy_all
    self.all.clear
  end

  def self.alphabetical
    self.all.sort_by(&:name)
  end

  def save
    self.class.all << self
  end

end
