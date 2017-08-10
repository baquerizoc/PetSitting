class ChangeColumnTotalPaymentToFloat < ActiveRecord::Migration[5.1]
  def change
  	change_column :agendas, :total_payment, :float
  end
end
