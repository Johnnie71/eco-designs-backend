class Api::V1::UsersController < ApplicationController

    def index
        users = User.all.sort_by {|user| user.name}
        render json: users
    end

    def show
        user = User.find(params[:id])
        render json: user, except: [:created_at, :updated_at]
    end

    def create
        user = User.create!(user_params)
        
        render json: user
    end

    def update
        user = User.find(params[:id])

        user.update!(user_params)

        render json: user
    end

    def destroy
        user = User.find(params[:id])
        user.destroy
        render json: {}
    end

    def homepage
    end

    def designs 
        # grab user, grab designs and return user's designs
        user = User.find(params[:id])
        designs = user.designs
        render json: designs
    end 

    def follows 
        # grab user, grab follows and return user's follows
        user = User.find(params[:id])
        follows = user.following_relationships
        render json: follows
    end 

    def comments 
        # grab user, grab comments and return user's comments
        user = User.find(params[:id])
        comments = user.comments
        render json: comments
    end 

    # def feed
    #     # find the user
    #   user = User.find(params[:id])
    #     # the the ids of the ppl user is following
    #   ids = user.isFollowing.map { |user| user.id }
    #     # I wanted to use .where and .order because I think they are more optimal than enums
    #     # This should return posts that have a matching user_id column prop to the array of ids and then order them desending by creation date followed by number of likes if the created by is equal. It limits results to 100
    #   designs = Design.where(user_id: ids).group(:id).order('created_at DESC').limit(100)

    #   render json: designs, status: :accepted
  
    # end

    # def login
    # end

    # def logout
    #     session[:user] = nil
    #     flash[:message] = "You have successfully logged out"
    #     redirect_to login_path
    # end

    private
    
    def user_params
        params.require(:user).permit(:username, :name, :bio, :profile_pic, :password_digest)
    end
end
