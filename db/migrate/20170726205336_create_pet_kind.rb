class CreatePetKind < ActiveRecord::Migration[5.1]
  def change
    create_table :pet_kinds do |t|
      t.string :name
    end
  end
end
