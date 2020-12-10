class Comment < ApplicationRecord
    belongs_to :user 
    belongs_to :design

    accepts_nested_attributes_for :user

    validates :comment, presence: true
end
