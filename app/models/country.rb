class Country < ApplicationRecord
  has_many :cities
  has_many :visits, through: :cities
  validates :name, presence: true, uniqueness: true

  def visits_to_country
    visits.size
  end

  def self.most_visited
    joins(:visits).group(:id).order('count(visits.id) DESC').first
  end


end
