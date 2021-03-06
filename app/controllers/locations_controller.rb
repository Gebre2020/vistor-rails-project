class LocationsController < ApplicationController
    before_action :redirect_if_not_logged_in
    before_action :set_location, except: [:index, :new, :create]
    # before_action :authenticate_user!,except: [:index, :show] 

    def index
        if params[:user_id] && @user = User.find_by_id(params[:user_id])
            # nested
            @locations = @user.locations.baller_travels
            @travels = Travel.latest_travels
        else
            @error = "The user doesn't exist" if params[:user_id]
            @locations = Location.baller_travels
            @travels = Travel.latest_travels
         end
    end

    def new
        # if params[:user_id] && @user = User.find_by_id(params[:user_id])
        #     @location = current_user.locations.build
        #   # @location = Location.new
        #    #@location.travels.build
        #    # @travel.build_location()
        # else
        #     @error = "The user doesn't exist" if params[:user_id]
            @location = Location.new
        # end
    end
    
    def create
        @location =Location.new(location_params)
       # @location = current_user.locations.build(location_params)
        if @location.save 
            redirect_to location_path(@location)
        else
            render :new
        end            
    end

    def show
    #  @location = Location.find_by(id: params[:id])
    #   if @location
    #     redirect_to location_path
    #   else
     redirect_to locations_path if !@location
    #    @travel = Travel.new
    #     @travel = @location.travels
    #  end
    end

    def edit
       # @location = Location.find_by_id(params[:id])
    end

    def update
        #@location = Location.find_by_id(params[:id])
        if @location.update(location_params)
            redirect_to location_path(@location)
        else
            render :edit
        end
    end

    def destroy
        @location.destroy
        redirect_to locations_path
    end 
    
    private

    def location_params
        params.require(:location).permit(:city, :country,:user_id)
    end

    def set_location
        @location = Location.find_by(id: params[:id])
      end 
end
