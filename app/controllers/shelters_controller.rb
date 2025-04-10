class SheltersController < ApplicationController
  before_action :find_shelter, only: [:show]

  def index
    @shelters = Shelter.all.reverse
  end

  def show
  end

  private

  def find_shelter
    @shelter = Shelter.find(params[:id])
  end
end