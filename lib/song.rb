class Song
  attr_accessor :name, :artist_name
  @@all = []
  # below is the initialiation
  def self.create
    #name = Song.new
    #@name = name
    #@@all << name
    #@name
    song = Song.new
    song.save
    song
  end

  def self.new_by_name(name)
    song = Song.create
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = Song.create # == self.create
    song.name = name 
    song
  end

  def self.find_by_name(name)
    @@all.find{ |song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    find_by_name(name) || create_by_name(name)
  end
  
  def self.alphabetical
    @@all.sort_by { |song| song.name }
  end

  def self.new_from_filename(filename)
    array_of_artists = filename.split(" - ")
    song = self.new
    song.artist_name = array_of_artists[0]
    song.name = array_of_artists[1].chomp(".mp3")
    song
  end

  def self.create_from_filename(filename)
    @@all << self.new_from_filename(filename)
  end

  def self.destroy_all
    @@all.clear
  end


  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

end
