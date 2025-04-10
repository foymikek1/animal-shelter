class ShelterPetsController < ApplicationController

  def index
    @shelter = Shelter.find(params[:id])
  end

  def new
    @shelter = Shelter.find(params[:id])
    @pet = @shelter.pets.new(adoptable: true)
  end

  def create 
    shelter = Shelter.find(params[:format])
    pet = shelter.pets.create(adoptable: true)
    pet.update(shelter_pets_params)
    pet.save
    redirect_to "/shelters/#{shelter.id}/pets"
  end

  private

  def shelter_pets_params
    params.require(:pet).permit(:age, :breed, :adoptable, :name)
  end

end