class TravelsController < ApplicationController
  def index
    @travels = Travel.all
  end

  def show
    @travel = Travel.find_by_id(params[:id])
  end

  def new
    @travel = Travel.new
  end

  def create
    @travel = Travel.new(travel_params)

    if @travel.save
      redirect_to @travel
    else
      render :new
    end
  end

  def edit
    @travel = Travel.find_by_id(params[:id])
  end

  def update
    @travel = Travel.find_by_id(params[:id])

    if @travel.update(travel_params)
      redirect_to @travel
    else
      render :edit
    end
  end

  def destroy
    @travel = Travel.find_by_id(params[:id])
    @travel.destroy

    redirect_to root_path
  end

  private
    def travel_params
      params.require(:travel).permit(:city, :country)
    end

end
