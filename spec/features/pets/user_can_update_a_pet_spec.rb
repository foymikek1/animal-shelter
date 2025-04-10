require "rails_helper"

describe "user sees one pet", type: :feature do
  describe "they visit /pets/:id" do
    it "displays all pets" do
      shelter = Shelter.create(foster_program: true, rank: 1, city: "Erie", name: "Erie Shelter")
      pet_1 = shelter.pets.create(adoptable: true, age: 1, breed: "Collie", name: "Zues")
      pet_2 = shelter.pets.create(adoptable: true, age: 2, breed: "Lab", name: "Horatio")
      
      visit "/pets/#{pet_1.id}"
      click_on "Update Pet"
      expect(current_path).to eq("/pets/#{pet_1.id}/edit")

      fill_in("Age", with: 2)
      fill_in("Breed", with: "Border collie")
      click_on "Update Pet"

      expect(current_path).to eq("/pets/#{pet_1.id}")

      expect(page).to have_content("2")
      expect(page).to have_content("Border collie")
      expect(page).to_not have_content("Collie")
      expect(page).to_not have_content("1")
      
    end
  end
end