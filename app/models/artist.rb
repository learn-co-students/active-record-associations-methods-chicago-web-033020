class Artist < ActiveRecord::Base
  has_many :songs
  has_many :genres, through: :songs

  def get_first_song 
    self.songs.first
  end 

  def get_genre_of_first_song
    first_genre = get_first_song.genre_id
    Genre.find(first_genre)
  end

  def song_count
    self.songs.count
  end

  def genre_count
    genre_id = self.songs.map do |song|
      song.genre_id 
    end 

    genre_id.uniq.count
  end
end
