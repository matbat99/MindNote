class Session < ApplicationRecord
  belongs_to :practice
  validates :grade, presence: true
end
