class Rider < ApplicationRecord
  has_secure_password
  validates :password, presence: true
  validates :name, presence: true
  has_many :trails
  has_many :mountains, through: :trails

end
