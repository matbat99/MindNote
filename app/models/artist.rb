class Artist < ApplicationRecord
  has_many :songs
  validates :name, presence: true
  validates :name, uniqueness: true
end
