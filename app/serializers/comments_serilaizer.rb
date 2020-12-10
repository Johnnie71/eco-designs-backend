class CommentsSerializer < ActiveModel::Serializer
    attributes :id, :user_id, :design_id, :comment
    has_one :design
    has_one :user
end