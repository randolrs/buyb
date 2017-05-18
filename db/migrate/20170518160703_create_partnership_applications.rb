class CreatePartnershipApplications < ActiveRecord::Migration[5.0]
  def change
    create_table :partnership_applications do |t|
      t.string :company_name
      t.text :company_description
      t.string :contact_email
      t.string :contact_name
      t.string :company_url
      t.string :product_name
      t.string :product_description
      t.decimal :product_retail_value 
      t.text  :product_why_is_great
      t.boolean :customer_service_staff
      t.string :contact_title

      t.timestamps
    end
  end
end
