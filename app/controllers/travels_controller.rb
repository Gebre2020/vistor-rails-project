class TravelsController < ApplicationController
  
  before_action :redirect_if_not_logged_in
  before_action :set_location, only: [:show, :edit, :update, :destroy]
  before_action :set_travel, only: [:show, :edit, :update, :destroy]
  
  def index
    # to check if it's nested?
    # 2 types of requests are going to invoke this action
    # travels index
    # location_travels index
    # check if its a regular request or a nested route request
    if params[:location_id] && @location = Location.find_by(id: params[:location_id])
      #  then it's nested
      @travels = @location.travels
    else
      @error = "The location doesn't exist" if params[:location_id]
      @travels = Travel.all
    end
  end

  def new
    if params[:location_id] 
      @location = Location.find_by(id: params[:location_id])
      @travel = @location.travels.build
      #@travel = @travel.new(location_id: @location.id)
    else
      @travel = Travel.new
      @travel.build_location
    end
  end
  
  def create
    if params[:location_id]
      @location = Location.find_by(id: params[:location_id])
      @travel = @location.travels.build(travel_params)
      redirect_to location_path(@location)
    else
      @travel = Travel.new(travel_params)
    end

    # if  @travel.save
    #   #redirect_to travel_path(@travel)
    #   redirect_to @location
    # else
    #   render :new
    # end
  end
  
  def show
   # @location = Location.find_by(id: params[:id])
    #@travel = Travel.find_by_id(params[:id])
    #redirect_to travels_path if !@travel
  end

  def edit
    #@travel = Travel.find_by_id(params[:id])
  end

  def update
    #@travel = Travel.find_by_id(params[:id])

    if @travel.update(travel_params)
      redirect_to travel_path(@travel)
      redirect_to location_path
    else
      render :edit
    end
  end

  def destroy
   # @travel = Travel.find_by_id(params[:id])
    @travel.destroy
    redirect_to location_path
  end

  private
    def travel_params
      params.require(:travel).permit(:name, :address, location_attributes:[:city, :country])
    end

    def set_location
      @location = Location.find_by_id(params[:location_id])    
    end

    def set_travel
      @travel = Travel.find_by_id(params[:id])
    end 

end
