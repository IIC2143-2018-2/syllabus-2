class MusicComponent
  attr_accessor :children

  def initialize
    @children = []
  end

  def add(child)
    @children << child
  end

  def music_len
    len = 0
    @children.each do |child|
      len += child.music_len
    end
    len
  end
end

class Artist < MusicComponent
  attr_accessor :name
  def initialize(name)
    @name = name
    super()
  end
end

class Album < MusicComponent
  attr_accessor :title

  def initialize(title)
    @title = title
    super()
  end
end

class Song < MusicComponent
  attr_accessor :title

  def initialize(title, len)
    @title = title
    @len = len
  end

  def add; end

  def music_len
    puts "#{@title}: #{@len}"
    @len
  end
end

artist = Artist.new 'Rush'
hemispheres = Album.new 'Hemispheres'
presto = Album.new 'Test For Echo (Album)'
hemispheres.add Song.new('Xanadu', 14)
hemispheres.add Song.new('The Trees', 6)
presto.add Song.new('Test For Echo', 5)
presto.add Song.new('Driven', 5.5)
artist.add hemispheres
artist.add presto
puts artist.music_len
