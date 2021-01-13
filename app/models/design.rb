class Design < ApplicationRecord
    belongs_to :user
    has_many :comments

    accepts_nested_attributes_for :user
    accepts_nested_attributes_for :comments

    
    
end
