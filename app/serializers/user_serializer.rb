class UserSerializer < ActiveModel::Serializer
    attributes :id, :name, :username, :bio, :profile_pic, :isFollowing, :isFollowedBy
    has_many :designs
    has_many :comments

     # we need to serialze to get the propic as url and to remove sensitve/extra data from array of users
  def isFollowing
    
    object.isFollowing.map { |user| { id: user.id, name: user.name, username: user.username, profile_pic: user.profile_pic, bio: user.bio } }
  
  end

  # we need to serialze to get the propic as url and to remove sensitve/extra data from array of users
  def isFollowedBy
    
    object.isFollowedBy.map { |user| { id: user.id, name: user.name, username: user.username, profile_pic: user.profile_pic, bio: user.bio } }
    
  end

  end
  