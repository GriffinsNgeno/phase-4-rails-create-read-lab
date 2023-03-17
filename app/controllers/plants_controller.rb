class PlantsController < ApplicationController
    wrap_parameters format: []
    def index
        render json: Plant.all
    end

    def create
        plant = Plant.create(plant_params)
        render json: plant, status: :created
    end

    def show
        plants = Plant.find_by(id: params[:id])
        if plants
        render json: plants
        else 
            render json: {error: "Plant not found"}, status: 404
        end
    end

    private

    def plant_params
        params.permit(:name, :image, :price)
    end
end
