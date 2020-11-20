class Api::V1::CommentsController < ApplicationController

    def index
        comments = Comment.all.sort_by {|comment| comment.created_at}
        render json: comments
    end

    def create
        comment = Comment.create!(comment_params)
        render json: comment
    end

    def update
        comment = Comment.find(params[:id])

        comment.update!(comment_params)

        render json: comment
    end

    def destroy
        comment = Comment.find(params[:id])
        comment.destroy
        render json: {}
    end

    private

    def comment_params
        params.require(:comment).permit(:user_id, :design_id, :comment)
    end

end
