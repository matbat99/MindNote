class Practice < ApplicationRecord
  belongs_to :user
  has_many :sessions
  belongs_to :song
end
