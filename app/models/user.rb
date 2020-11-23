class User < ApplicationRecord
    has_many :designs, dependent: :destroy
    has_many :comments, dependent: :destroy

    accepts_nested_attributes_for :designs

    def my_designs
        User.first.designs.map{ |design| design}
    end
    
end
