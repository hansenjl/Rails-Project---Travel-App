class User < ApplicationRecord
  has_secure_password
  has_many :visits, dependent: :destroy
  has_many :cities, -> { distinct } through: :visits
  has_many :countries, -> { distinct } through: :cities
  has_many :comments, dependent: :destroy
  accepts_nested_attributes_for :visits
  validates :username, uniqueness: true

  def countries_visited
    # countries = []
    # self.cities.each do |city|
    #   countries << city.country
    # end
    # countries.uniq

    @countries_visited ||= countries.uniq
  end

#should this be memoized?
  def self.active_users
    #User.all.select{|user| !user.visits.empty?}
    joins(:visits).distinct  #much faster load time - 1 query total
  end

end
