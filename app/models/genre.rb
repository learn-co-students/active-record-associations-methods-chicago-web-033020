class Genre < ActiveRecord::Base
  has_many :songs
  has_many :artists, through: :songs

  def song_count
    self.songs.count
  end

  def unique_artists
    artists = self.songs.map do |song|
      song.artist_id 
    end

    artists.uniq
  end

  def artist_count
    unique_artists.count
  end

  def all_artist_names
    all_artists = unique_artists.map do |artist|
      Artist.find(artist).name
    end 

    all_artists
  end
end
