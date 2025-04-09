class Pet < ApplicationRecord
  validates_presence_of :adoptable, :age, :breed, :name
  belongs_to :shelter
end