class Song < ApplicationRecord
  belongs_to :artist
  validates :title, presence: true
  validates :title, uniqueness: { scope: :artist_id, message: "This song has already been added" }

end
