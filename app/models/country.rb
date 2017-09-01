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

  def visits_to_country
    total_visits = 0
    self.cities.each do |city|
      total_visits = total_visits + city.times_visited
    end
    total_visits
  end

  def self.most_visited
    Country.all.sort{ |a,b| b.visits_to_country <=> a.visits_to_country}.first
  end


end
