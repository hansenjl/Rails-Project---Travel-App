class CitySerializer < ActiveModel::Serializer
  attributes :id, :name
  belongs_to :country
  has_many :users
  has_many :visits
  has_many :comments
end
