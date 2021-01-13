class User < ApplicationRecord
    has_many :designs
    has_many :comments

    has_many :follower_relationships, foreign_key: :followed_id, class_name: "FollowJoin"
    has_many :isFollowedBy, through: :follower_relationships, source: :following

    has_many :following_relationships, foreign_key: :following_id, class_name: 'FollowJoin'
    has_many :isFollowing, through: :following_relationships, source: :followed
    
    accepts_nested_attributes_for :designs

    def my_designs
        User.first.designs.map{ |design| design}
    end
    
end
