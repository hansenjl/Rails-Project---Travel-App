class Country < ApplicationRecord
  has_many :cities
  has_many :visits, through: :cities
  validates :name, presence: true, uniqueness: true

  # def ranked_cities
  #   cities_with_rankings = self.cities.select { |c| c.visits.count > 0}
  #   cities_with_rankings.sort do |a,b|
  #     b.overall_rating  <=> a.overall_rating
  #   end
  # end

  # def unranked_cities
  #   self.cities.select { |c| c.visits.count == 0}
  # end

  def visits_to_country
    total_visits = 0
    self.cities.each do |city|
      total_visits = total_visits + city.num_of_visits
    end
    total_visits
  end

#THIS NEEDS TO BE IMPROVED!!!!
  def self.most_visited
    if @total_number_visits != nil && @total_number_visits === Visit.all.count
      @country ||= Country.all.sort{ |a,b| b.visits_to_country <=> a.visits_to_country}.first
    else
      @country = Country.all.sort{ |a,b| b.visits_to_country <=> a.visits_to_country}.first
      @total_number_visits = Visit.all.count
    end
    @country
  end


end
