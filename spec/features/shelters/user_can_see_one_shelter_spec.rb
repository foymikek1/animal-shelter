require "rails_helper"

describe "user sees one shelter", type: :feature do
  describe "they visit /shelters/:id" do
    it "displays all shelters" do
      shelter_1 = Shelter.create!(foster_program: true, rank: 1, city: "Erie", name: "Erie Shelter")
      
      visit "/shelters/#{shelter_1.id}"

      expect(page).to have_content(shelter_1.name)
      expect(page).to have_content(shelter_1.foster_program)
      expect(page).to have_content(shelter_1.city)
      expect(page).to have_content(shelter_1.rank)
    end
  end
end