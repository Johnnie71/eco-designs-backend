class Api::V1::CommentsController < ApplicationController

    def index
        comments = Comment.all.sort_by {|comment| comment.created_at}
        render json: comments
    end

    def create
        comment = Comment.create!(com_params)
        
        render json: comment
    end

    def update
        comment = Comment.find(params[:id])

        comment.update!(com_params)

        render json: comment
    end

    def destroy
        comment = Comment.find(params[:id])
        comment.destroy
        render json: {}
    end

    private
 
    def com_params
        params.permit(:user_id, :design_id, :comment)
    end

end
