module AlbumsHelper
  def load_all_song
    Song.all.map { |u| [u.name, u.id] }
  end
end
