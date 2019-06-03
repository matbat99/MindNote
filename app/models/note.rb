class Note < ApplicationRecord
  belongs_to :practice
  validates :content, presence: true
  validates :practice_id, presence: true
end
