require 'pry'
class Country < ApplicationRecord
  has_many :cities
  validates :name, presence: true, uniqueness: true

  def ranked_cities
    cities_with_rankings = self.cities.select { |c| c.visits.count > 0}
    cities_with_rankings.sort do |a,b|
      b.overall_rating  <=> a.overall_rating
    end
  end

  def unranked_cities
    self.cities.select { |c| c.visits.count == 0}
  end


end
