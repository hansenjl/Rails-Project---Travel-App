class City < ApplicationRecord
  has_many :visits
  has_many :users, through: :visits
  has_many :reviews
  belongs_to :country

  def overall_rating
    total = 0
    self.visits.each do |visit|
      total = total + visit.city_rating
    end
    total = total / times_visited
  end

  def times_visited
    self.visits.count
  end

end
