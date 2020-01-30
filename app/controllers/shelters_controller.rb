class SheltersController < ApplicationController
  def index
    @shelters = Shelter.all
  end

  def new
    @shelter = Shelter.new
  end

  def create
    shelter = Shelter.create({
      name: params[:shelter][:name],
      address: params[:shelter][:address],
      city: params[:shelter][:city],
      state: params[:shelter][:state],
      zip: params[:shelter][:zip]
      })
      # shelter.save

      redirect_to shelters_path
  end

  def show
    @shelter = Shelter.find(params[:id])
  end
end
