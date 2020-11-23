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

    def comments 
        # grab user, grab comments and return user's comments
        user = User.find(params[:id])
        comments = user.comments
        render json: comments
    end 

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
