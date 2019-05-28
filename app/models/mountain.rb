class Mountain < ApplicationRecord
  has_many :trails
  has_many :riders, through: :trails
end
