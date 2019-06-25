class Song < ApplicationRecord
  belongs_to :artist
  validates :title, presence: true
  validates :title, uniqueness: { scope: :artist_id, message: "This song has already been added" }

  include PgSearch
  pg_search_scope :search_by_title_artist,
                  against: [:title],
                  associated_against: {
                    artist: [:name]
                  },
                  using: {
                    tsearch: { prefix: true }
                  }
end
