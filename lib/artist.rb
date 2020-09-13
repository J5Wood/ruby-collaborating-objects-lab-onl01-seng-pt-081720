require 'pry'


class Artist

  attr_accessor :name, :artist, :songs

  @@all = []


  def initialize(name)
    @name = name
    @@all << self
  end


  def self.all
    @@all
  end


  def add_song(song)
    song.artist = self
  end


  def songs
    Song.all.select { |x| x.artist == self.name}
  end


  def self.find_or_create_by_name(name)
    if self.all.find { |x| x.name == name }
      self.all.find { |x| x.name == name }
    else
      name = self.new(name)
      name
    end
  end


  def print_songs
    self.songs.each { |x| puts x.name }
  end



end
