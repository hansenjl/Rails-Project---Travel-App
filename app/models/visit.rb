class Visit < ApplicationRecord
  belongs_to :user
  belongs_to :city
  validates :city_rating, presence: true
  validate :not_a_repeat

  def not_a_repeat
    if Visit.where(user_id: user_id, city_id: city_id).count > 1
      errors.add(:city_id, "You have already entered this visit")
    end
  end

  def city_attributes(city_attributes)
    if !city_attributes[:name].empty?
      city = City.find_or_create_by(name: city_attributes[:name])
      if !city_attributes[:country].empty?
        country = Country.find_or_create_by(name: city_attributes[:country])
        city_attributes[:country_id] = country.id
      else
        country = Country.find_by(id: city_attributes[:country_id])
      end
      country.cities << city if !city.nil? && !country.nil?
      country.save
    end
    city.visits << self
    city.save
  end
end
