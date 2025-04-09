require "rails_helper"

describe "user sees all pets", type: :feature do
  describe "they visit /pets" do
    it "displays all pets" do
      shelter = Shelter.create(foster_program: true, rank: 1, city: "Erie", name: "Erie Shelter")
      pet_1 = shelter.pets.create(adoptable: true, age: 1, breed: "Collie", name: "Zues")
      pet_2 = shelter.pets.create(adoptable: true, age: 2, breed: "Lab", name: "Horatio")

      visit "/pets"

      expect(page).to have_content(pet_1.name)
      expect(page).to have_content(pet_2.name)
    end
  end
end