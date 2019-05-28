class Rider < ApplicationRecord
  validates :password, presence: true
  has_many :trails
  has_many :mountains, through: :trails

end
