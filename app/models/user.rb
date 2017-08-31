class User < ApplicationRecord
  has_secure_password
  has_many :visits
  has_many :cities, through: :visits
  has_many :reviews
  accepts_nested_attributes_for :visits
  validates :username, uniqueness: true

end
