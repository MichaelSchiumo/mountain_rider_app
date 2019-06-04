class Mountain < ApplicationRecord
  has_many :trails
  has_many :riders, through: :trails

  # def self.top_ranked
  #   order(:rank).last
  # end

  #or

  scope :top_ranked, -> { order(rank: :DESC).first }
end
