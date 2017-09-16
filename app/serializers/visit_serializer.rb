class VisitSerializer < ActiveModel::Serializer
  attributes :id, :city_rating, :avatar, :user_id, :avatar_url
  belongs_to :user
  belongs_to :city

end
