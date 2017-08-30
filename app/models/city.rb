class City < ApplicationRecord
  has_many :visits
  has_many :users, through: :visits
  has_many :reviews
  belongs_to :country
end
