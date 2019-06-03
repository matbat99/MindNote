class Note < ApplicationRecord
  belongs_to :practice
  validates :content, presence: true
end
