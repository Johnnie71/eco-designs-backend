class Api::V1::FollowersController < ApplicationController


    def index
        follows = FollowJoin.all 
        render json: follows
    end


     def create
        follow = FollowJoin.create!(followJoinParams)
        
        render json: follow
     end

    
    def destroy
        followJoin = FollowJoin.find(params[:id])

        followJoin.destroy
        
        render json: {}
    end

    private

    def followJoinParams
        params.permit(:following_id, :followed_id)
    end
end
