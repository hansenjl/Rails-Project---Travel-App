class VisitSerializer < ActiveModel::Serializer
  attributes :id, :city_rating, :avatar
  belongs_to :user
  belongs_to :city

end
