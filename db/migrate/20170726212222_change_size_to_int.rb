class ChangeSizeToInt < ActiveRecord::Migration[5.1]
  def change
  	change_column :pets, :size, :int
  end
end
