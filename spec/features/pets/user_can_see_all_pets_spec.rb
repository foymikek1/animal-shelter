require "rails_helper"

describe "user sees all pets", type: :feature do
  before(:each) do
      @shelter = Shelter.create(foster_program: true, rank: 1, city: "Erie", name: "Erie Shelter")
      @pet_1 = @shelter.pets.create(adoptable: true, age: 1, breed: "Collie", name: "Zues")
      @pet_2 = @shelter.pets.create(adoptable: true, age: 2, breed: "Lab", name: "Horatio")
  end
  describe "they visit /pets" do
    it "displays all pets" do
      visit "/pets"

      expect(page).to have_content(@pet_1.name)
      expect(page).to have_content(@pet_2.name)
    end

    it 'has a link on any page, to see all pets' do
      visit pets_path
      expect(page).to have_link("<< View All Pets >>")

      visit shelters_path
      expect(page).to have_link("<< View All Pets >>")

      visit "/shelters/#{@shelter.id}/pets"
      expect(page).to have_link("<< View All Pets >>")

      click_on "<< View All Pets >>"
      
      expect(current_path).to eq(pets_path)
    end
  end
end