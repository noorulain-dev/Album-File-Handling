

module Genre
  POP, CLASSIC, JAZZ, ROCK = *1..4
end

$genre_names = ['Null', 'Pop', 'Classic', 'Jazz', 'Rock']

class Album
# NB: you will need to add tracks to the following and the initialize()
	attr_accessor :title, :artist, :genre, :tracks

	def initialize (atitle, aartist, agenre, atracks)
		# insert lines here
		@title=atitle
		@artist=aartist
		@genre = agenre
        @tracks=atracks
	end
end

class Track
	attr_accessor :ttitle, :tlocation

	def initialize (tname, tloc)
		@ttitle = tname
		@tlocation = tloc
	end
end

# Reads in and returns a single track from the given file

def read_track music_file
	# fill in the missing code
	ttitle=music_file.gets.chomp
	tlocation=music_file.gets.chomp
	mytrack=Track.new(ttitle, tlocation)
	mytrack
end

# Returns an array of tracks read from the given file

def read_tracks music_file
	tracks = Array.new()
	count = music_file.gets.chomp.to_i
	tracks = Array.new

	# Put a loop here which increments an index to read the tracks
    count.times do
	track = read_track(music_file)
	tracks << track
end
	tracks
end

# Takes an array of tracks and prints them to the terminal

def print_tracks tracks
x=0
tracks.length.times do
print_track(tracks[x])
x+=1
end
	# print all the tracks use: tracks[x] to access each track.
end

# Reads in and returns a single album from the given file, with all its tracks

def read_album music_file

	# read in all the Album's fields/attributes including all the tracks
	# complete the missing code
    album_title=music_file.gets.chomp
	album_artist=music_file.gets.chomp
	album_genre=music_file.gets.chomp.to_i
	tracks=read_tracks(music_file)
	album = Album.new(album_title, album_artist, album_genre, tracks)
	album
end


# Takes a single album and prints it to the terminal along with all its tracks
def print_album album

  # print out all the albums fields/attributes
  # Complete the missing code.
    puts "The title of the album is: #{album.title}"
	puts "The artist of the album is: #{album.artist}"
	puts 'Genre is ' + album.genre.to_s
	puts $genre_names[album.genre]
	# print out the tracks
	print_tracks(album.tracks)

end

# Takes a single track and prints it to the terminal
def print_track track
	puts('Track title is: ' + track.ttitle)
	puts('Track file location is: ' + track.tlocation)
end

# Reads in an album from a file and then print the album to the terminal

def main
	music_file = File.new("album.txt", "r")
	album = read_album(music_file)
	music_file.close()

	print_album(album)
end

main
