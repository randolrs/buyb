class CreateOrderSessions < ActiveRecord::Migration[5.0]
  def change
    create_table :order_sessions do |t|
      t.integer :session_id
      t.integer :order_id

      t.timestamps
    end
  end
end
