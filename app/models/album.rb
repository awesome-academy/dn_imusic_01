class Album < ApplicationRecord
  ATTR_PARAMS = [:name, :song_ids]
  has_many :album_songs, dependent: :destroy
  has_many :songs, through: :album_songs

  scope :sort_by_name, -> {order name: :asc}
  accepts_nested_attributes_for :album_songs
end
