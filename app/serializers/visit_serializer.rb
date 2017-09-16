class VisitSerializer < ActiveModel::Serializer
  attributes :id, :city_rating
  belongs_to :user
  belongs_to :city

end
