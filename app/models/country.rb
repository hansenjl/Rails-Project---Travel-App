class Country < ApplicationRecord
  has_many :cities

  def ranked_cities
    self.cities.sort do |a,b|
      b.overall_rating  <=> a.overall_rating
    end
  end
end
