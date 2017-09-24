require 'pry'

class MP3Importer
  attr_accessor :path

  def initialize(path)
    @path = path
  end

  def files #gets files array from directory, parses out directory name
    files = Dir["#{self.path}/*"]
    files.collect {|file| file.slice!(0, 21)}
    files
  end

  def import #creates songs from a filename, adds to that artist list of all songs

    files.each do |file|
      song = Song.new_by_filename(file)
      song.artist.add_song(song)
    end
  end

end


# You should write code that responds to MP3Importer.new('./db/mp3s').import.
#Google around for how to get a list of files in a directory!
# Make sure you only get .mp3 files.
