require "rails_helper"

describe "user updates a shelter", type: :feature do
  describe "they visit /shelters/:id click 'Update Shelter'" do
    it "they fill out form and update shelter" do
      shelter = Shelter.create(foster_program: true, rank: 1, city: "Erie", name: "Erie Shelter")
      
      visit "/shelters/#{shelter.id}"
      click_on "Update Shelter"
      expect(current_path).to eq("/shelters/#{shelter.id}/edit")

      fill_in("Foster program", with: true)
      fill_in("Rank", with: 1)
      fill_in("City", with: "Eldorado")
      fill_in("Name", with: "Eldorado Canyon Rescue")
      click_on "Update Shelter"

      expect(current_path).to eq("/shelters/#{shelter.id}")

      expect(page).to have_content("1")
      expect(page).to have_content("true")
      expect(page).to have_content("Eldorado Canyon Rescue")
      expect(page).to_not have_content("Erie")
      expect(page).to_not have_content("Erie Shelter")
      
    end
  end
end