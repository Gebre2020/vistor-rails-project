class LocationsController < ApplicationController
    def create
        @travel = Travel.find_by_id(params[:travel_id])
        @location = @travel.locations.create(location_params)
        redirect_to travel_path(@travel)
    end
    
    private

    def location_params
        params.require(:location).permit(:name, :address)
    end
end
