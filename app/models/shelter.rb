class Shelter < ApplicationRecord
  validates_presence_of :foster_program, :rank, :city, :name
  has_many :pets
end