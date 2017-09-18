class CommentSerializer < ActiveModel::Serializer
  attributes :id, :user, :city, :text
  belongs_to :city
  belongs_to :user
end