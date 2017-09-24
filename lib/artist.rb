require 'pry'

class Artist
  attr_accessor :name, :songs
  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def add_song(song)
    @songs << song
  end

  def self.create
    artist = self.new
    artist.save
    artist
  end

  def self.find_by_name(name)
    self.all.detect { |song| song.name == name }
  end

  def self.create_by_name(name)
    artist = self.create
    artist.name = name
    artist
  end

  def self.find_or_create_by_name(name)
  
    if self.find_by_name(name)
      self.find_by_name(name)
    else
      self.create_by_name(name)
    end
  end

end
