  class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :lastname
      t.string :phone
      t.string :adress
      t.datetime :date_of_birth
    end
  end
end
