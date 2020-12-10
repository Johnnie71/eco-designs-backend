class Api::V1::FollowersController < ApplicationController


    def index
        follows = FollowJoin.all 
        render json: follows
    end


     # creates a follower/followed relationship using following_id, and followed_id
     def create
        follow = FollowJoin.create!(followJoinParams)
        
        render json: follow
     end

    # deletes a following/followed relationship using the ids...wanted to use where because I think its more efficent then enums
    def destroy
        # followJoin = FollowJoin.where(followed_id: params[:followed_id], following_id: params[:following_id])
        followJoin = FollowJoin.find(params[:id])

        followJoin.destroy
        
        # render json: { message: 'deleted' }, status: :accepted
        render json: {}
    end

    private

    def followJoinParams
        params.permit(:following_id, :followed_id)
    end
end
