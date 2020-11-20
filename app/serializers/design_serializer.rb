class DesignSerializer < ActiveModel::Serializer
    attributes :id, :title, :main_img, :img_1, :img_2, :img_3, :img_4, :img_5, :img_6, :description, :category
    has_one :user
    has_many :comments
  end