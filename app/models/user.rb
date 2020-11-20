class User < ApplicationRecord
    has_many :designs
    has_many :comments

    accepts_nested_attributes_for :designs

    def my_designs
        User.first.designs.map{ |design| design}
    end
    
end
