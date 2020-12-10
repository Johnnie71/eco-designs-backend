class Design < ApplicationRecord
    belongs_to :user, dependent: :destroy
    has_many :comments, dependent: :destroy

    accepts_nested_attributes_for :user
    accepts_nested_attributes_for :comments

    
    
end
