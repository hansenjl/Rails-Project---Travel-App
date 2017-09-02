class City < ApplicationRecord
  has_many :visits
  has_many :users, through: :visits
  has_many :reviews
  belongs_to :country
  validates :name, presence: true, uniqueness: true
  validates :country_id, presence: true


  def overall_rating
    total = 0
    self.visits.each do |visit|
      total = total + visit.city_rating.to_f
    end
    total = total / times_visited.to_f
  end

  def times_visited
    self.visits.count
  end

  def visited?
    if self.times_visited > 0
      true
    else
      false
    end
  end

  def country=(countries)
    if !countries[:name].empty?
      country = Country.find_or_create_by(name: countries[:name])
    else
      country = Country.find_by(id: countries[:id])
    end
    country.cities << self
    country
  end

end
