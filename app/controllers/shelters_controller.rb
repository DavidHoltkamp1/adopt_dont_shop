class SheltersController < ApplicationController
  def index
    @shelters = Shelter.all
  end

  def new
    @shelter = Shelter.new
  end

  def create
    Shelter.create(shelters_params)
      redirect_to shelters_path
  end

  def show
    @shelter = Shelter.find(params[:id])
  end

  def edit
    @shelter = Shelter.find(params[:id])
  end

  def update
    shelter = Shelter.find(params[:id])
    shelter.update(shelters_params)

    redirect_to "/shelters/#{shelter.id}"
  end

  def destroy
    Shelter.destroy(params[:id])
    redirect_to "/shelters"
  end

  private

  def shelters_params
    params.permit(:name, :address, :city, :state, :zip)
  end
end
