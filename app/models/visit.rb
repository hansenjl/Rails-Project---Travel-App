class Visit < ApplicationRecord
  belongs_to :user
  belongs_to :city

  def city_attributes=(city_attributes)
    if !city_attributes[:name].nil?
      city = City.find_or_create_by(name: city_attributes[:name])
      city_attributes[:city_id] = city.id
    else
      city = City.find_by(id: city_attributes[:city_id])
    end
    if !city_attributes[:country].nil?
      country = Country.find_or_create_by(name: city_attributes[:country])
      city_attributes[:country_id] = country.id
    else
      country = Country.find_by(id: city_attributes[:country_id])
    end
      country.cities << city

  end
end
