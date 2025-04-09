require "rails_helper"

describe Shelter, type: :model do
  describe "validations" do
    it {should validate_presence_of(:foster_program)}
    it {should validate_presence_of(:rank)}
    it {should validate_presence_of(:city)}
    it {should validate_presence_of(:name)}
  end

  describe "relationships" do
    it {should have_many(:pets)}
  end
end