class UserSerializer < ActiveModel::Serializer
    attributes :id, :name, :username, :bio, :profile_pic, :isFollowing, :isFollowedBy
    has_many :designs
    has_many :comments

     
    def isFollowing
      object.isFollowing.map { |user| { id: user.id, name: user.name, username: user.username, profile_pic: user.profile_pic, bio: user.bio } }
    end

  
    def isFollowedBy
      object.isFollowedBy.map { |user| { id: user.id, name: user.name, username: user.username, profile_pic: user.profile_pic, bio: user.bio } }
    end

  end
  