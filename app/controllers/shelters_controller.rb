class SheltersController < ApplicationController
  before_action :find_shelter, only: [:show, :edit, :update]

  def index
    @shelters = Shelter.all.reverse
  end

  def show
  end

  def new
    @shelter = Shelter.new
  end

  def create
    @shelter = Shelter.new
    @shelter.update(shelter_params)
    @shelter.save
    redirect_to("/shelters")
  end

  def edit
  end

  def update
    @shelter.update(shelter_params)
    redirect_to("/shelters/#{@shelter.id}")
  end

  private

  def shelter_params
    params.require(:shelter).permit(:foster_program, :rank, :city, :name)
  end

  def find_shelter
    @shelter = Shelter.find(params[:id])
  end
end