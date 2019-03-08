class User < ApplicationRecord
  has_secure_password
  has_many :visits
  has_many :cities, through: :visits
  has_many :comments
  accepts_nested_attributes_for :visits
  validates :username, uniqueness: true

  def countries_visited
    countries = []
    self.cities.each do |city|
      countries << city.country
    end
    countries.uniq
  end

  def self.active_users
    #User.all.select{|user| !user.visits.empty?}
    joins(:visits).uniq  #much faster load time - 1 query total
  end

end
