class Api::V1::DesignsController < ApplicationController

    def index
        designs = Design.all
        render json: designs
    end

    def show
        design = Design.find(params[:id])
        render json: design, except: [:created_at, :updated_at]
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

    private

    def design_params
        params.require(:design).permit(:title, :main_img, :img_1, :img_2, :img_3, :img_4, :img_5, :img_6, :description, :category)
    end

end
