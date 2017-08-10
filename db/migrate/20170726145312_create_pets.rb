class CreatePets < ActiveRecord::Migration[5.1]
  def change
    create_table :pets do |t|
      t.string :name
      t.string :kind
      t.string :breed
      t.datetime :date_of_birth
      t.string :size
      t.belongs_to :user, foreign_key: true
    end
  end
end
