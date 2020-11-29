class FollowJoinSerializer < ActiveModel::Serializer
  attributes :id, :following_id, :followed_id

  
end
