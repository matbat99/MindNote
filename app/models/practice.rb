class Practice < ApplicationRecord
  belongs_to :user
  has_many :sessions
end
