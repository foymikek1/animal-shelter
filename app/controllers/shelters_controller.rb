class SheltersController < ApplicationController
  before_action :find_shelter, only: [:show]

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
    @shelter.update(
      foster_program: params[:shelter][:foster_program],
       rank:params[:shelter][:rank],
        city: params[:shelter][:city],
         name: params[:shelter][:name]
        )
    @shelter.save
    redirect_to("/shelters")
  end

  private

  def find_shelter
    @shelter = Shelter.find(params[:id])
  end
end