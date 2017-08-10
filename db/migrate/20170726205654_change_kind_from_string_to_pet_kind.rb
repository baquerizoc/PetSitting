class ChangeKindFromStringToPetKind < ActiveRecord::Migration[5.1]
  def change
  	remove_column :pets, :kind
  	add_reference :pets, :pet_kind, index: true
  end
end
