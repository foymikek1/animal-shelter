require "rails_helper"

describe "user sees all shelters", type: :feature do
  describe "they visit /shelters" do
    it "displays all shelters by most recently created" do
      shelter_1 = Shelter.create(foster_program: true, rank: 1, city: "Erie", name: "Erie Shelter")
      shelter_2 = Shelter.create(foster_program: true, rank: 2, city: "Boulder", name: "Boulder Shelter")

      visit "/shelters"

      expect("#{shelter_2.name}").to appear_before("#{shelter_1.name}", only_text: true)
    end
  end
end