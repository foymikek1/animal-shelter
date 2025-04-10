class PetsController < ApplicationController

  def index
    @pets = Pet.all
  end

  def show
    @pet = Pet.find(params[:id])
  end

  def edit
    @pet = Pet.find(params[:id])
  end

  def update
    @pet = Pet.find(params[:id])
    @pet.update(pet_params)
    redirect_to(pet_path(@pet))
  end

  private

  def pet_params
    params.require(:pet).permit(:age, :breed, :adoptable, :name)
  end
end