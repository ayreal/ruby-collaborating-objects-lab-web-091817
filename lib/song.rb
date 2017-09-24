require 'pry'

class Song
  attr_accessor :name, :artist

  def initialize(name)
    @name = name
    @artist = artist
  end


  def self.new_by_filename(filename)
    filename = filename.split(" - ")
    song = self.new(filename[1])
    # an artist is associated with a pre-existing member of artist class
    song.artist = Artist.find_or_create_by_name(filename[0])
    song
  end

end
