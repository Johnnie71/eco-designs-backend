class Api::V1::DesignsController < ApplicationController

    def index
        designs = Design.all.sort_by {|design| design.created_at}
        render json: designs
    end

    def show
        design = Design.find(params[:id])
        render json: design, except: [:updated_at]
    end

    def create
        design = Design.create!(design_params)

        render json: design
    end

    def update
        design = Design.find(params[:id])

        design.update!(design_params)

        render json: design
    end

    def destroy
        design = Design.find(params[:id])
        design.destroy
        render json: {}
    end

    def comments 
        # grab user, grab comments and return user's comments
        design = Design.find(params[:id])
        comments = design.comments
        render json: comments
    end 

    private

    def design_params
        params.require(:design).permit(:user_id, :title, :main_img, :img_1, :img_2, :img_3, :img_4, :img_5, :img_6, :description, :category)
    end

end
