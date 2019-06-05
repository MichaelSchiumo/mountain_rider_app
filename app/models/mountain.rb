class Mountain < ApplicationRecord
  has_many :trails
  has_many :riders, through: :trails

  scope :top_ranked, -> { order(rank: :DESC).first }
end
