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
    self.all << song
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
    result = self.all.find { |song| song.name == name}
    result
  end

  def self.find_or_create_by_name(name)
    result = self.find_by_name(name)
    if result
      result
    else
      self.create_by_name(name)
    end
  end

  def self.alphabetical 
    # sorts by song.name, default is alphabetical type sort for sort_by
    sorted = self.all.sort_by {|song| song.name}
    sorted
  end
  
  def self.new_from_filename(string)
    data = string.split(" - ") # splits the string into 2 elements with corresponding data
    data[1] = data[1].chomp(".mp3") # removes the .mp3 
    
    song = self.new
    song.artist_name = data[0]
    song.name = data[1]
    song
  end
  
  def self.create_from_filename(string)
    data = self.new_from_filename(string)
    song = self.create
    song.name = data.name
    song.artist_name = data.artist_name
    song
  end
  
  def self.destroy_all
    self.all.clear # accesses self -> Song.all.clear
  end
end
