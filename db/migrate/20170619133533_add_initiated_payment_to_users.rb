class AddInitiatedPaymentToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :initiated_payment, :boolean
  end
end
