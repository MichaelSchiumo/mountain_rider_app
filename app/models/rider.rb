class Rider < ApplicationRecord
  validates :password, presence: true
  validates :name, presence: true
  has_many :trails
  has_many :mountains, through: :trails

end
