class UserSerializer < ActiveModel::Serializer
    attributes :id, :name, :username, :bio, :profile_pic, :password_digest
    has_many :designs
    has_many :comments
  end
  