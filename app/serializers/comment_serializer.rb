class CommentSerializer < ActiveModel::Serializer
  attributes :id, :user, :city
  belongs_to :city
  belongs_to :user
end