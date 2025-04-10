require "rails_helper"

describe "user sees all of a shelters pets", type: :feature do
  describe "they visit /shelters/:id/pets" do
    it "displays all the shelters pets" do
      shelter = Shelter.create(foster_program: true, rank: 1, city: "Erie", name: "Erie Shelter")
      pet_1 = shelter.pets.create(adoptable: true, age: 1, breed: "Collie", name: "Zues")
      pet_2 = shelter.pets.create(adoptable: true, age: 2, breed: "Lab", name: "Horatio")
      
      visit "/shelters/#{shelter.id}/pets"

      expect(page).to have_content(pet_1.name)
      expect(page).to have_content(pet_1.adoptable)
      expect(page).to have_content(pet_1.breed)
      expect(page).to have_content(pet_1.age)
      expect(page).to have_content(pet_2.name)
      expect(page).to have_content(pet_2.adoptable)
      expect(page).to have_content(pet_2.breed)
      expect(page).to have_content(pet_2.age)
      
    end
  end
end