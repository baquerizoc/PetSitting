class CreateAgenda < ActiveRecord::Migration[5.1]
  def change
    create_table :agendas do |t|
      t.datetime :start_day
      t.datetime :end_day
      t.integer :total_payment
      t.string :care_needs
      t.belongs_to :pet, foreign_key: true
      t.belongs_to :user, foreign_key: true, null: true
    end
  end
end
