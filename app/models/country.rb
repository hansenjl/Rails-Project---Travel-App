require 'pry'
class Country < ApplicationRecord
  has_many :cities
  validates :name, presence: true, uniqueness: true

  def ranked_cities
    self.cities.sort do |a,b|
      b.overall_rating  <=> a.overall_rating
    end
  end


end
