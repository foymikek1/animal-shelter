# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
puts "Beginning seed"

Shelter.destroy_all
Pet.destroy_all

shelter_1 = Shelter.create(foster_program: true, rank: 5, city: "Erie", name: "Erie Animal Shelter")
shelter_2 = Shelter.create(foster_program: true, rank: 6, city: "Longmont", name: "Longmont Animal Shelter")

shelter_1.pets.create(adoptable: true, age: 1, breed: "Border Collie", name: "Milo")
shelter_1.pets.create(adoptable: true, age: 1, breed: "Huskie", name: "Max")

shelter_2.pets.create(adoptable: true, age: 1, breed: "American Bulldog Terrier", name: "John")
shelter_2.pets.create(adoptable: true, age: 2, breed: "Poodle X", name: "Misty")
shelter_2.pets.create(adoptable: true, age: 1, breed: "Beagle", name: "Scout")

puts "Finished seed"