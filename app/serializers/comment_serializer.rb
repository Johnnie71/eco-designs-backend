class CommentSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :design_id, :comment
  has_one :user
end
