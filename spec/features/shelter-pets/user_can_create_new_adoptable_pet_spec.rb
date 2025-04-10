require "rails_helper"

describe "user can create an adoptable pet that belongs to a shelter", type: :feature do
    before(:each) do
      @shelter = Shelter.create(foster_program: true, rank: 1, city: "Erie", name: "Erie Shelter")
      @pet_1 = @shelter.pets.create(adoptable: true, age: 1, breed: "Collie", name: "Zues")
      @pet_2 = @shelter.pets.create(adoptable: true, age: 2, breed: "Lab", name: "Horatio")
      @shelter_1 = Shelter.create(foster_program: true, rank: 3, city: "Erie", name: "Erie Shelter")
      @shelter_2 = Shelter.create(foster_program: true, rank: 2, city: "Boulder", name: "Boulder Shelter")
  end
  describe "they fill out a new pet form" do
    it "creates a new adoptable pet" do
      visit "/shelters/#{@shelter_1.id}/pets"
      click_on "Create Pet"
      
      expect(current_path).to eq("/shelters/#{@shelter_1.id}/pets/new")

      #fill_in("adoptable", with: true)
      fill_in("age", with: 3)
      fill_in("breed", with: "Australian Shepard")
      fill_in("Name", with: "Ranger")
      click_on "Create Pet"

      expect(current_path).to eq("/shelters/#{@shelter_1.id}/pets")
      expect(page).to have_content("Ranger")
    end
  end
end