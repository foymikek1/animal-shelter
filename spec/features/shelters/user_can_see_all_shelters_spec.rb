require "rails_helper"

describe "user sees all shelters", type: :feature do
  describe "they visit /shelters" do
    it "displays all shelters" do
      shelter_1 = Shelter.create(foster_program: true, rank: 1, city: "Erie", name: "Erie Shelter")
      shelter_2 = Shelter.create(foster_program: true, rank: 2, city: "Boulder", name: "Boulder Shelter")

      visit "/shelters"

      expect(page).to have_content(shelter_1.name)
      expect(page).to have_content(shelter_2.name)
    end
  end
end