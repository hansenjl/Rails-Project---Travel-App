class City < ApplicationRecord
  has_many :visits
  has_many :users, through: :visits
  has_many :reviews
  belongs_to :country

  def overall_rating
    total = 0
    self.visits.each do |visit|
      total = total + visit.rating
    end
    total
  end

end
