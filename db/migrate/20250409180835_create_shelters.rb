class CreateShelters < ActiveRecord::Migration[7.1]
  def change
    create_table :shelters do |t|
      t.boolean :foster_program
      t.integer :rank
      t.string :city
      t.string :name

      t.timestamps
    end
  end
end
