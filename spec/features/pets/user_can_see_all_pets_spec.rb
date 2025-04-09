require "rails_helper"

describe "user sees all pets", type: :feature do
  describe "they visit /pets" do
    it "displays all pets" do
      pet_1 = Pet.create(adoptable: true, age: 1, breed: "Collie", name: "Zues")
      pet_2 = Pet.create(adoptable: true, age: 2, breed: "Lab", name: "Horatio")

      visit "/pets"

      expect(page).to have_content(pet_1.name)
      expect(page).to have_content(pet_2.name)
    end
  end
end