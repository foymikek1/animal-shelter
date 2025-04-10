require "rails_helper"

describe "user sees one shelter", type: :feature do
  describe "they visit /shelters/:id" do
    it "displays all shelters" do
      shelter_1 = Shelter.create!(foster_program: true, rank: 1, city: "Erie", name: "Erie Shelter")
      shelter_1.pets.create(adoptable: true, age: 1, breed: "Border Collie", name: "Milo")
      shelter_1.pets.create(adoptable: true, age: 1, breed: "Huskie", name: "Max")

      visit "/shelters/#{shelter_1.id}"

      expect(page).to have_content(shelter_1.name)
      expect(page).to have_content(shelter_1.foster_program)
      expect(page).to have_content(shelter_1.city)
      expect(page).to have_content(shelter_1.rank)
      expect(page).to have_content("Erie Shelter currently has 2 pets.")
    end
  end
end