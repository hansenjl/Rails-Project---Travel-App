class City < ApplicationRecord
  has_many :visits
  has_many :users, through: :visits
  has_many :comments
  belongs_to :country
  validates :name, presence: true, uniqueness: true
  validates :country_id, presence: true

   #this method is used ONLY when the cities haven't been preloaded using .rated
   def avg_rating
     visits.avg_rating
   end

  #this method is used ONLY when the cities haven't been preloaded using .rated
  def num_of_visits
    self.visits.size
  end

  def name_with_country
    "#{self.name}, #{self.country.name}"
  end


  def visited?
    self.try(:times_visited) != 0 ||  self.num_of_visits != 0
  end

  def country_field=(country_field)
    country = Country.find_by(name: country_field[:name])
    country = Country.new(name: country_field[:name]) if country.nil?
    country.save
    self.country_id = country.id if !country.name.empty?
  end

  def self.rated
      select("cities.*, AVG(visits.city_rating) AS overall_rating, COUNT(cities.id) as times_visited").joins(:visits).group("cities.id")
  end

  def self.unrated
    left_outer_joins(:visits).where(visits: { id: nil })
  end


  def self.most_visited
    #City.all.sort{ |a,b| b.times_visited <=> a.times_visited}.first
     joins(:visits).group(:id).order('count(visits.id) DESC').first
  end

  def self.popular
    #City.all.sort{ |a,b| b.overall_rating.to_f <=> a.overall_rating.to_f}.first
    select("cities.*, AVG(visits.city_rating) AS overall_rating").joins(:visits).group(:id).order('overall_rating DESC')
  end

  def self.most_popular
    popular.first
  end

end
