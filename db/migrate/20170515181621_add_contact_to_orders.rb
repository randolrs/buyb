class AddContactToOrders < ActiveRecord::Migration[5.0]
  def change
    add_column :orders, :contact_email, :string
    add_column :orders, :mailing_address, :string
  end
end
