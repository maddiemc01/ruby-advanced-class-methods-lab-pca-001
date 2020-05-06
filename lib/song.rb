class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
    self
  end

  def self.create
    Song.new.save
  end

  def self.new_by_name(song_name)
    song= Song.new #could also be self.new; creates an instance! not class
    song.name= song_name
    song
  end

  def self.create_by_name(song_name)
    song= Song.new.save #could also be coded as self.create
    song.name= song_name
    song
  end

  def self.find_by_name(arugment_song_name)
    @@all.find do |element_of_all_song|
      arugment_song_name == element_of_all_song.name
    end
  end

  def self.find_or_create_by_name(song_name)
    Song.find_by_name(song_name) || Song.create_by_name(song_name)
  end
    #  same as:
  # song = Song.find_by_name(song_name)
  #   if song.is_a?(Song)
  #     song
  #   else
  #   Song.create_by_name(song_name)
  #   end
  # end

  def self.alphabetical
    @@all.sort_by do |song|
      song.name
    end
  end

  def self.new_from_filename(filename)
    song_name = filename.split(".")[0].split(" - ")[1]
    artist_name = filename.split(" - ")[0]

    song= Song.new
    song.name = song_name
    song.artist_name = artist_name
    song
  end

  def self.create_from_filename(filename)
    new_from_filename(filename).save
  end

  def self.destroy_all
    @@all = []
  end

end
