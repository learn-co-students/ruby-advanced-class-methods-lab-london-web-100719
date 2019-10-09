

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
    song = Song.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = Song.create
    song.name = name
    song
  end

  def self.find_by_name(name)
    self.all.find { |song| song.name==name }
  end

  def self.find_or_create_by_name(name)
    Song.create_by_name(name)
    Song.find_by_name(name) 
  end

  def self.alphabetical
    @@all.sort_by {|song| song.name}
  end

  def self.new_from_filename(filename)
    elements    = filename.split(" - ")
    artist_name = elements[0]
    song_name   = elements[1].split(".")[0]

    new_song      = Song.create_by_name(song_name)
    new_song.artist_name = artist_name
    new_song
  end

  def self.create_from_filename(filename)
    @@all << Song.new_from_filename(filename)
  end

  def self.destroy_all
    @@all = []
  end

end
