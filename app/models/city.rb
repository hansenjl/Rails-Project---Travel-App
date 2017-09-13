class City < ApplicationRecord
  has_many :visits
  has_many :users, through: :visits
  has_many :reviews
  belongs_to :country
  validates :name, presence: true, uniqueness: true
  validates :country_id, presence: true


  def overall_rating
    if self.visited?
      total = 0
      self.visits.each do |visit|
        total = total + visit.city_rating.to_f
      end
      total = total / times_visited.to_f
    else
      total = 0
    end
    total
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

  def country_field=(country_field)
    country = Country.find_by(name: country_field[:name])
    country = Country.new(name: country_field[:name]) if country.nil?
    country.save
    self.country_id = country.id if !country.name.empty?
  end


  def self.most_visited
    City.all.sort{ |a,b| b.times_visited <=> a.times_visited}.first
  end

  def self.most_popular
    City.all.sort{ |a,b| b.overall_rating.to_f <=> a.overall_rating.to_f}.first
  end

end
