class City < ApplicationRecord
  has_many :visits
  has_many :users, through: :visits
  has_many :comments
  belongs_to :country
  validates :name, presence: true, uniqueness: true
  validates :country_id, presence: true


#this might be better as a column on the City table that gets updated when a visit is created/updated
   def overall_rating
     visits.avg_rating
   end
  #   # if self.visited?
  #   #   total = 0
  #   #   self.visits.each do |visit|
  #   #     total = total + visit.city_rating.to_f
  #   #   end
  #   #   total = total / times_visited.to_f
  #   # else
  #   #   total = 0
  #   # end
  #   # total
  # end

  # def set_avg_rating
  #   self.avg_rating = Visit.avg_rating_for_city(self.id)
  #   self.save
  # end

  def name_with_country
    "#{self.name}, #{self.country.name}"
  end

  def times_visited
    self.visits.size
  end

  def visited?
    self.times_visited > 0
  end

  def country_field=(country_field)
    country = Country.find_by(name: country_field[:name])
    country = Country.new(name: country_field[:name]) if country.nil?
    country.save
    self.country_id = country.id if !country.name.empty?
  end

  def self.rated
      select("cities.*, AVG(visits.city_rating) AS overall_rating").joins(:visits).group("cities.id")
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
