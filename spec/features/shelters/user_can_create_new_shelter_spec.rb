require "rails_helper"

describe "user can create a shelter", type: :feature do
    before(:each) do
      @shelter = Shelter.create(foster_program: true, rank: 1, city: "Erie", name: "Erie Shelter")
      @pet_1 = @shelter.pets.create(adoptable: true, age: 1, breed: "Collie", name: "Zues")
      @pet_2 = @shelter.pets.create(adoptable: true, age: 2, breed: "Lab", name: "Horatio")
      @shelter_1 = Shelter.create(foster_program: true, rank: 3, city: "Erie", name: "Erie Shelter")
      @shelter_2 = Shelter.create(foster_program: true, rank: 2, city: "Boulder", name: "Boulder Shelter")
  end
  describe "they fill out a new shelter form" do
    it "creates a new shelter and is displayed on shelters_path" do
      visit "/shelters"
      click_on "New Shelter"
      
      expect(current_path).to eq("/shelters/new")

      fill_in("Foster program", with: true)
      fill_in("Rank", with: 4)
      fill_in("City", with: "Longmont")
      fill_in("Name", with: "Longmont Shelter")
      click_on "Submit"

      expect(current_path).to eq("/shelters")
      expect(page).to have_content("Longmont Shelter")
    end
  end
end